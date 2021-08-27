[#assign title = content.title!]
[#if title?has_content]
    <h3>${title}</h3>
[/#if]

[@cms.area name="fields"/]