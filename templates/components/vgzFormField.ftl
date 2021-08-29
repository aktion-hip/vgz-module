<div class="uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
  <div class="uk-first-column">
    [#list cmsfn.children(content.entries, "mgnl:contentNode") as entry ]
      <div class="vgzFormField ${model.valid?then('', 'uk-text-danger')}">
        <label><input class="uk-${content.type}" type="${content.type}" name="${entry.name}" ${content.mandatory?then("required","")} /> ${entry.label} ${content.mandatory?then("*","")}</label>
      </div>
    [/#list]
  </div>
</div>
