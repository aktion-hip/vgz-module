[#assign attributes]name="${content.controlName}" id="${content.controlName}"[#if content.maxlength?has_content] maxlength="${content.maxlength}"[/#if][#if content.placeholder?has_content] placeholder="${content.placeholder}"[/#if][#if content.min?has_content] min="${content.min}"[/#if][#if content.max?has_content] max="${content.max}"[/#if][#if content.step?has_content] step="${content.step}"[/#if][#if content.patternDescription?has_content] title="${content.patternDescription!}"[/#if][#if content.readonly!false] readonly[/#if][#if content.disabled!false] disabled[/#if][#if content.mandatory!false] required[/#if][#if content.autofocus!false] autofocus[/#if] autocomplete=[#if content.autocomplete!false]"on"[#else]"off"[/#if][/#assign]
[#if content.inputType! == "date"]
    [#assign onFocusBlur]onfocus="(this.type='date')" onblur="(this.type='text')"[/#assign]
    [#assign fldType = "text"]
[#else]
    [#assign onFocusBlur = ""]
    [#assign fldType = content.inputType!"text"]
[/#if]
[#assign errMessage = content.errMessage!"Bitte geben Sie einen Wert ein!"]

<div class="uk-margin-small ${model.valid?then('', 'uk-text-danger')}">
    [#if content.rows?default(1) == 1]
        <input class="uk-input" ${attributes} type="${fldType}" id="${content.controlName!}" placeholder="${content.title!} ${content.mandatory?then('*', '')}" value="${model.value!}" ${onFocusBlur} 
        oninvalid="this.setCustomValidity('${errMessage}')"
        oninput="this.setCustomValidity('')"  />
        [#if !model.valid]${content.errMessage!"Bitte geben Sie einen gültigen Wert ein!"}[/#if]
    [#else]
        <textarea class="uk-textarea" ${attributes}[#if content.rows?has_content] rows="${content.rows}"[/#if] placeholder="${content.title!} ${content.mandatory?then('*', '')}">${model.value!}</textarea>
    [/#if]
</div>
