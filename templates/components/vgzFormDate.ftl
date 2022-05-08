[#assign attributes]name="${content.controlName}" id="${content.controlName}"[/#assign]
[#assign errMessage = content.errMessage!"Bitte geben Sie Datum ein!"]
<div class="uk-margin-small ${model.valid?then('', 'uk-text-danger')}">
    <input class="uk-input vgz-flatpickr" ${attributes} type="text" id="${content.controlName!}" placeholder="${content.title!} ${content.mandatory?then('*', '')} [tt.mm.jjjj]" value="${model.value!}"
        oninvalid="this.setCustomValidity('${errMessage}')" oninput="this.setCustomValidity('')" />
    [#if !model.valid]${content.errMessage!"Bitte geben Sie Datum ein!"}[/#if]
</div>