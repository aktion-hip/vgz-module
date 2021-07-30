[#-------------- ASSIGNMENTS --------------]
[#include "/mtk2/templates/includes/init.ftl"]

[#-- CSS default --]
[#if !divClass?has_content]
    [#assign divClass = "text-section"]
[/#if]

[#-------------- RENDERING PART --------------]
[#-- Rendering: Text/Image item --]
<div class="${divClass!}"${divID!}>

    [#-- Headline --]
    [#if content.headline?has_content]
        <${headlineLevel}>${content.headline!}</${headlineLevel}>
    [/#if]

    [#-- Text --]
    [#if content.text?has_content]
        ${cmsfn.decode(content).text!}
    [/#if]

</div><!-- end ${divClass} -->
