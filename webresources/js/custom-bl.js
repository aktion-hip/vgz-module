function toggleEventDetails(id, div) {
    // handle element activation
    Array.from(document.getElementsByClassName("vk-event")).forEach(el => {
        el.classList.remove("active");
    });
    div.classList.add("active");
    // toggle details
    Array.from(document.getElementsByClassName("vk-event_details")).forEach(el => {
        el.style.display = "none";
    });    
    document.getElementById(id).style.display = "block";
};

/**
 * Onclick handler on VGZ toggle container: show/hide container area.
 * @param {} button : the container's header button
 */
function vgzContainerToggle(button) {
    const showHide = button.parentNode.querySelector(".vgz-toggle-container-area");
    if (showHide.style.display === "block") {
        showHide.style.display = "none";
        showHide.style.opacity = 0;                  
        button.classList.remove("vgz-toggle-container-button--open");
    } else {
        showHide.style.display = "block";
        showHide.style.opacity = 1;
        button.classList.add("vgz-toggle-container-button--open");
    }
};

/**
 * Document ready handler: displays toggle areas open if they contain a feedback
 */
document.addEventListener("DOMContentLoaded", e => {
    const toggleContent = e.target.querySelectorAll(".vgz-toggle-container-area");
    [...toggleContent].forEach(area => {
        const success = area.querySelector(".text.success");
        const error = area.querySelector(".text.error");
        if (success || error) {
            area.style.display = "block";
        }
    });
});
