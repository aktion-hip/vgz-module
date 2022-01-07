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
  </head>
  <body class="vgz-page-imgmap ${cmsfn.language()}">
      <div class="tm-page">
        [#assign root = cmsfn.root(content, "mgnl:page") ]
        [#include "../include/navigation.ftl"]
        [@childNavText content false /]

        <!-- include titles -->
        [#if content.titles?size > 0]
          <div class="imgmap-titles">
            <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">              
              [#list content.titles as title ]
                <div class="el-item uk-grid-margin uk-first-column">
                  <a class="el-content uk-button uk-button-default" href="#">${title}</a>
                </div>
              [/#list]
            </div>
          </div>
        [/#if]
        <!-- include svg -->
        [#if content.svg?has_content]
            ${cmsfn.decode(content).svg}
        [/#if]

        [#include "../include/footer.ftl"]
      </<div>
  </body>
</html>
