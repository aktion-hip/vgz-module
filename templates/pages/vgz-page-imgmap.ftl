<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
    [@cms.page /]
    
    [#include "../include/functions.ftl"]
    [#include "../include/macros.ftl"]
    [#include "../include/head.ftl"]

    [#assign site = sitefn.site()!]
    [#assign theme = sitefn.theme(site)!]
    [#list theme.cssFiles as cssFile]
        <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
    [#if content.styles?has_content]
      <style>
        ${cmsfn.decode(content).styles}
      </style>
    [/#if]
  </head>
  <body class="vgz-page-imgmap ${cmsfn.language()}">
      <div class="tm-page">
        [#assign root = cmsfn.root(content, "mgnl:page") ]
        [#include "../include/navigation.ftl"]
        [@childNavText content false /]
        [@vgzLogo false /]

        <!-- include titles -->
        [#if content.titles?size > 0]
          <div class="imgmap-titles">
            <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">              
              [#list cmsfn.children(content.titles) as area ]
                <div class="el-item uk-grid-margin uk-first-column"
                  onmouseover="areaOn(this)" onmouseout="areaOff(this)"
                  data-vgz-id="${area.key?lower_case}">
                  <a class="el-content uk-button uk-button-default" href="${cmsfn.link(cmsfn.contentById(area.url))}">${area.label}</a>
                </div>
              [/#list]
            </div>
          </div>
        [/#if]
        <!-- include svg -->
        <div class="vgz-img-areal">
          [#if content.svg?has_content]
              <?xml version="1.0" encoding="UTF-8" standalone="no"?>
              ${cmsfn.decode(content).svg}
          [/#if]
        </div>

        [#if content.scripts?has_content]
          <script>
            ${cmsfn.decode(content).scripts}
          </script>
        [/#if]

        [#include "../include/footer.ftl"]
      </<div>
  </body>
</html>
