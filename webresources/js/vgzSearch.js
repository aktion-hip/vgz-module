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
    width: 87%;
    height: 2em;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    cursor: pointer;
    padding: 0.2em 0.3em;
    border: 1px solid #465F0E;
    margin: 0.5em 10em 0.5em 5em;    
    z-index: 2;
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
.vgz-search-query:focus {
    outline: none;
    background-color: #FFF;
}
.vgz-search-query-clear {
    position: absolute;
    right: 0.5em;
    top: 0.5em;
    z-index: 3;
}
.vgz-search-close {
    position: absolute;
    display: none;
    width: 2.5em;
    background-color: #FFF;
    border: none;
    right: 2em;
    top: 0.1em;
    cursor: pointer;
}
.vgz-search-close .vgz-search-close-btn {
    width: 1.2em;
    height: auto;
}
.vgz-search-close .vgz-search-close-hint {
    position: absolute;
    top: 1em;
    left: 0.6em;
    color: #465F0E;
}
</style>

<div class="vgz-search-container">
  <div class="vgz-search-overlay">
    <input class="vgz-search-query"/>
    <img class="vgz-search-query-clear" title="Clear"/>
  </div>
  <div class="vgz-search">
    <button aria-label="Filter schliessen" class="vgz-search-close">
	    <img class="vgz-search-close-btn" title="Close"/>
	    <span aria-hidden="true" class="vgz-search-close-hint">esc</span>
    </button>

    <img class="vgz-search-btn" alt="search" title="Search"/>
  </div>
</div>
`

class VgzSearch extends HTMLElement {

    constructor() {
        super();
        this.input = new InputField(this);
        this.close = new CloseButton(this);
    }

    connectedCallback() {
        // shadow 
        this.attachShadow({mode: 'open'});
        this.shadowRoot.appendChild(template.content.cloneNode(true));

        const contextPath = this.getAttribute("contextPath");
        this.input.init(contextPath);

        // prepare the search icon
        const bntSearch = this.shadowRoot.querySelector(".vgz-search-btn");
        bntSearch.src = contextPath + pathImg + imgSearch;
        bntSearch.addEventListener("click", e => {
            this.input.handleClick(e.target);
            this.close.show();
        });

        // prepare the close icon
        this.close.init(this.shadowRoot.querySelector(".vgz-search-close"), contextPath);

        this.handleParams();
    }

    handleParams() {
        const urlParams = new URLSearchParams(window.location.search);
        const queryStr = urlParams.get("queryStr");
        if (queryStr) {
            const url = new URL(window.location.href);
            url.searchParams.delete("queryStr");
            history.replaceState(history.state, "", url.href);
            this.input.restore(queryStr, this.shadowRoot.querySelector(".vgz-search-container"));
        }
    }

    /**
     * Hides the overlay.
     */
    hideOverlay() {
        this.close.hide();
        this.input.hide();
    }
}

class CloseButton {

    constructor(parent) {
        this.parent = parent;
    }

    /**
     * Initialize the close button.
     * 
     * @param {*} root 
     * @param {*} contextPath 
     */
    init(root, contextPath) {
        this.root = root;
        this.btnClose = root.querySelector(".vgz-search-close-btn");
        this.btnClose.src = contextPath + pathImg + imgCross;
        this.btnClose.addEventListener("click", () => this.parent.hideOverlay());
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
    }

}

class InputField {

    constructor(parent) {
        this.parent = parent;
        this.isOpen = false;
        this.btnClear = null;
    }

    init(contextPath) {
        this.contextPath = contextPath;
    }
    
    /**
     * The user clicked the search image.
     * 
     * @param {HTMLElement} target the reciever of the click action
     */
    handleClick(target) {
        const searchContainer = target.closest(".vgz-search-container");
        this.searchField = searchContainer.querySelector(".vgz-search-query");
        this.searchOverlay = searchContainer.querySelector(".vgz-search-overlay");
        
        this.createClear(this.searchOverlay, this.searchField);
        if (this.isOpen) {
            this.doSearch(this.searchField);
        } else {
            this.show(this.searchOverlay, this.searchField);
        }
    }
    
    show(searchOverlay, searchField) {
        searchOverlay.style.display = "block";
        searchField.focus();
        this.isOpen = true;
    }

    doSearch(searchField) {
        const queryStr = searchField.value.trim();
        location.href = location.href + "?queryStr=" + queryStr + "*";
    }

    createClear(searchOverlay, searchField) {
        if (!this.btnClear) {
            this.btnClear = searchOverlay.querySelector(".vgz-search-query-clear");
            this.btnClear.src = this.contextPath + pathImg + imgCross;
            this.btnClear.addEventListener("click", () => {
                searchField.value = "";
            });
            searchField.addEventListener("keydown", e => this.handleKey(e));
        }
    }

    handleKey(keyEvent) {
        const key = keyEvent.key;
        const code = keyEvent.keyCode;
        if (code == 27) {
            this.parent.hideOverlay(); // esc
        } else if (code == 13) { // enter
            if (this.searchField) {
                this.doSearch(this.searchField);
            }
        }
    }

    /**
     * Redisplay the search input field after the user sent the search query to the server.
     * 
     * @param {String} queryStr the query parameter for the search.
     * @param {*} searchContainer 
     */
    restore(queryStr, searchContainer) {
        const searchOverlay = searchContainer.querySelector(".vgz-search-overlay");
        const searchField = searchContainer.querySelector(".vgz-search-query");

        searchField.value = queryStr.replace("*", "");
        this.show(searchOverlay, searchField);
        this.createClear(searchOverlay, searchField);
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
        this.isOpen = false;
    }
}

customElements.define("vgz-search", VgzSearch);
