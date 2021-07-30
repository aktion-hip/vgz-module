[#list components as person ]
    <div class="uk-grid-margin uk-first-column">[@cms.component content=person /]</div>
[/#list]
[#if cmsfn.editMode]
    <div cms:add="bar"></div>
[/#if]