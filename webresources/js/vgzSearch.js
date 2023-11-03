const pathImg = "/.resources/vgz-module/webresources/img/icons/";
const imgSearch = "search_vgz.svg";
const imgCross = "search_vgz_cross.svg";
const template = document.createElement('template');
template.innerHTML = `
<style>
.vgz-search {
    display: inline;
    position: absolute;
    top: 1.1em;
    right: 0;
}
.vgz-search:hover {
    cursor: pointer;
}
.vgz-search-overlay {
    position: fixed;
    display: none;
    width: 30%;
    height: 2em;
    top: 0;
    right: 0;
    bottom: 0;
    cursor: pointer;
    border: 1px solid #465F0E;
    padding: 0.2em 1em 0.2em 0.3em;
    margin: 0.5em 6.3em 0.5em 5em;
    z-index: 2;
}
.mobile .vgz-search-overlay {
    width: 55%;
    margin-right: 4.4em;
}
.vgz-search-content {
    margin: auto;
    width: 80%;
    height: 80%;
    font-size: 3em;
    color: #465F0E;
    background-color: #FFF;
    padding:20px;    
}
.vgz-search-query {
    width: 99%;
    height: 2em;
    border-style: none;
    background-color: #FAF8E7;
    font-size: 1em;
    color: #465F0E;
    padding: 0 0.5em;
}
.mobile .vgz-search-query {
    width: 97%;
}
.vgz-search-query:focus {
    outline: none;
    background-color: #FFF;
}
.vgz-search-query-clear {
    position: absolute;
    display: none;
    right: 0.5em;
    top: 0.5em;
    border: none;
    background-color: transparent;
    cursor: pointer;
    z-index: 3;
}
.vgz-search-close {
    position: absolute;
    display: none;
    width: 2.5em;
    background-color: transparent;
    border: none;
    right: 2em;
    top: 0.1em;
    cursor: pointer;
}
.vgz-search-close svg {
    width: 1.2em;
    height: auto;
    fill: #465F0E;
}
.vgz-search-close .vgz-search-close-hint {
    position: absolute;
    top: 1em;
    left: 0.6em;
    color: #465F0E;
}
svg.vgz-search-icon {
    fill: #465F0E;
}
.vgz-search-container.internal svg.vgz-search-icon {
    fill: #FFF;
}
.vgz-search-container.internal .vgz-search-close {
    background-color: #465F0E;;
}
.vgz-search-container.internal .vgz-search-close > svg {
    fill: #FFF;
}
.vgz-search-container.internal .vgz-search-close .vgz-search-close-hint {
    color: #FFF;
}
svg.vgz-search-icon:hover {
    fill: #AFAA1B;
}
</style>

<div class="vgz-search-container">
  <div class="vgz-search-overlay">
    <input class="vgz-search-query"/>
    <button aria-label="Clear" class="vgz-search-query-clear">
        <svg class="vgz-search-icon-clear" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24">
            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" fill="#465F0E"/>
        </svg>
    </button>
  </div>
  <div class="vgz-search">
    <button aria-label="Filter schliessen" class="vgz-search-close">
        <svg class="vgz-search-icon-cross" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24">
            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
        </svg>
        <span aria-hidden="true" class="vgz-search-close-hint">esc</span>
    </button>

    <svg class="vgz-search-icon" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24">
        <path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/>
    </svg>
  </div>
</div>
`

/**
 * The custom element for the search.
 */
class VgzSearch extends HTMLElement {

    constructor() {
        super();
        this.input = new InputField(this);
        this.close = new CloseButton(this);
    }
    
    connectedCallback() {
        if (!this.checkActive()) {
            return;
        }
        // shadow 
        this.attachShadow({mode: 'open'});
        this.shadowRoot.appendChild(template.content.cloneNode(true));

        const isMobile = this.dataset.vgzMobile;
        if (isMobile) {
            this.shadowRoot.querySelector(".vgz-search-container").classList.add("mobile");
        }
        const isIntern = this.dataset.vgzIntern;
        if (isIntern && !isMobile) {
            this.shadowRoot.querySelector(".vgz-search-container").classList.add("internal");
        }
        
        // prepare the search icon
        const btnSearch = this.shadowRoot.querySelector(".vgz-search-icon");
        btnSearch.addEventListener("click", () => {
            this.input.handleClick();
            this.close.show();
            this.setAttribute("aria-expanded", "true");
        });
        
        // prepare the input field
        this.input.init(btnSearch);
        // prepare the close icon
        this.close.init(this.shadowRoot.querySelector(".vgz-search-close"));

        this.handleParams();
    }

    checkActive() { // instance is active when visible
        return this.offsetHeight > 0;
    }

    /**
     * If we have a search parameter, we have to restore the field and buttons.
     */
    handleParams() {
        const urlParams = new URLSearchParams(window.location.search);
        const queryStr = urlParams.get("queryStr");
        if (queryStr) {
            this.toggleScrolling(true);
            // remove search parameter from URL
            const url = new URL(window.location.href);
            url.searchParams.delete("queryStr");
            history.replaceState(history.state, "", url.href);
            // restore input field
            this.input.restore(queryStr);
            // restore close button
            this.close.show();
        }
    }

    toggleScrolling(stop) {
        const body = document.body;
        if (stop) {
            body.style.height = "100vh";
            body.style.overflowY = "hidden";
        } else {
            body.style.position = "";
            body.style.top = "";
            body.style.height = "";
            body.style.overflowY = "";
        }
    }

    /**
     * Hides the overlay.
     */
    hideOverlay() {
        this.toggleScrolling(false);
        this.close.hide();
        this.input.hide();
        this.setAttribute("aria-expanded", "false");
    }
}

/**
 * The close button hides the field to enter the search query.
 * This button is displayed only if the search field is displayed.
 */
class CloseButton {

    constructor(parent) {
        this.parent = parent;
    }

    /**
     * Initialize the close button.
     * 
     * @param {*} root the close button element
     */
    init(root) {
        this.root = root;
        this.root.addEventListener("click", () => this.parent.hideOverlay());
    }

    /**
     * Shows the close button.
     */
    show() {
        this.root.style.display = "block";
    }

    /**
     * Hides the close button.
     */
    hide() {
        this.root.style.display = "none";
        const results = document.querySelector(".vgz-search-results");
        if (results) {
            results.style.display = "none";
        }
    }

}

/**
 * The clear button is part of the input field and is displayed only if the field contains some input.
 */
class ClearButton {

    constructor(parent) {
        this.parent = parent;
    }

    init(searchOverlay, searchField) {
        this.btnClear = searchOverlay.querySelector(".vgz-search-query-clear");
        this.btnClear.addEventListener("click", () => {
            searchField.value = "";
            this.hide();
            this.parent.setFocus();
        });
    }

    chkDisplay(searchField, fixLength) {
        const length = searchField.value.trim().length + fixLength;
        this.btnClear.style.display = length > 0 ? "block" : "none";
    }

    hide() {
        this.btnClear.style.display = "none";
    }
    
    show() {
        this.btnClear.style.display = "block";
    }

}

/**
 * The model of the field where the user can enter the search query.
 */
class InputField {

    constructor(parent) {
        this.parent = parent;
        this.isOpen = false;
        this.btnClear = new ClearButton(this);
    }

    init(target) {
        this.btnClear = new ClearButton(this);

        const searchContainer = target.closest(".vgz-search-container");
        this.searchField = searchContainer.querySelector(".vgz-search-query");
        this.searchOverlay = searchContainer.querySelector(".vgz-search-overlay");
        
        this.btnClear.init(this.searchOverlay, this.searchField);
        this.searchField.addEventListener("keydown", e => this.handleKey(e, this.btnClear));
    }
    
    /**
     * The user clicked the search image.
     */
    handleClick() {
        if (this.isOpen) {
            this.doSearch(this.searchField);
        } else {
            this.show(this.searchOverlay, this.searchField);
        }
    }

    /**
     * Sets the focus on the input field for the search query.
     */
    setFocus() {
        if (this.searchField) {
            this.searchField.focus();
        }
    }
    
    show(searchOverlay, searchField) {
        searchOverlay.style.display = "block";
        searchField.focus();
        this.isOpen = true;
    }

    doSearch(searchField) {
        const queryStr = searchField.value.trim();
        if (queryStr) {
            const queryParts = queryStr.split(" ");
            queryParts.forEach((item, index, arr) => arr[index] = item + "*");
            location.href = location.href + "?queryStr=" + queryParts.join("+");
        }
    }

    handleKey(keyEvent, btnClear) {
        const code = keyEvent.keyCode;
        if (code == 27) {
            this.parent.hideOverlay(); // esc
        } else if (code == 13) { // enter
            if (this.searchField) {
                this.doSearch(this.searchField);
            }
        } else if (code == 8) { // backspace
            btnClear.chkDisplay(this.searchField, -1);
        } else if (code == 46) { // delete
            btnClear.chkDisplay(this.searchField, -1);
        } else {
            btnClear.chkDisplay(this.searchField, 1);
        }
    }

    /**
     * Redisplay the search input field after the user sent the search query to the server.
     * 
     * @param {String} queryStr 
     */
    restore(queryStr) {
        this.searchField.value = queryStr.replaceAll("*", "");
        this.show(this.searchOverlay, this.searchField);
        if (this.searchField.value) {
            this.btnClear.show();
        }
    }

    /**
     * Hides the overlay with the input field.
     */
    hide() {
        if (this.searchOverlay) {
            this.searchOverlay.style.display = "none";
        }
        if (this.searchField) {
            this.searchField.value = "";
        }
        this.btnClear.hide();
        this.isOpen = false;
    }
}

customElements.define("vgz-search", VgzSearch);
