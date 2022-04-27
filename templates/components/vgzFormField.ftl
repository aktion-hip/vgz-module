[#assign options = cmsfn.children(content.entries, "mgnl:contentNode") ]
[#if content.mandatory ]
  [#if options?size > 1]
    [#assign mandatoryM=true mandatoryS=false ] 
  [#else]
    [#assign mandatoryM=false mandatoryS=true ] 
  [/#if]
[#else]
  [#assign mandatoryM=false mandatoryS=false ]
[/#if]
[#if content.title?has_content]
  <div class="text">${content.title} ${mandatoryM?then("*","")}</div>
[/#if]
<div class="uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
  <div class="uk-first-column">
    [#list options as entry ]
      <div class="vgzFormField ${model.valid?then('', 'uk-text-danger')}">
        <label><input class="uk-${content.type}" type="${content.type}" name="${content.controlName}" value="${entry.name}" ${mandatoryS?then("required","")} /> ${entry.label} ${mandatoryS?then("*","")}</label>
      </div>
    [/#list]
  </div>
</div>
