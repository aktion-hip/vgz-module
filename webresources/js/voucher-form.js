const form = document.querySelector("form#vouchers");
const addressCheckbox = form.querySelector("input[name='chk_deliv_address']");
const ancestor = addressCheckbox.closest(
  "div.uk-grid-small.uk-child-width-auto"
);
const deliveryHead = ancestor.nextElementSibling;
const deliveryFields = form.querySelectorAll("input[name^='deliv_']");
addressCheckbox.addEventListener("change", (e) => {
  toggleDeliveryFields(deliveryHead, deliveryFields, !e.target.checked);
});
addressCheckbox.checked = true;
toggleDeliveryFields(deliveryHead, deliveryFields, false);

function toggleDeliveryFields(elHead, fields, show) {
  elHead.style.display = show ? "block" : "none";
  fields.forEach((el) => {
    el.style.display = show ? "block" : "none";
    if (show) {
      if (el.name !== "deliv_firma") {
        el.setAttribute("required", "");
      }
    } else {
      el.removeAttribute("required");
    }
  });
}
