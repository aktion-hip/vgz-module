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
