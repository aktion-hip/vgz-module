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
    <style>
    </style>
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
                <div class="el-item uk-grid-margin uk-first-column"
                  onmouseover="areaOn(this)" onmouseout="areaOff(this)"
                  data-vgz-id="${title?lower_case}">
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

        <script>
            function areaOn(el) {
                toggle(el, "fill: #EFAD8A");
            }
            function areaOff(el) {
                toggle(el, "stroke: none");
            }
            function toggle(el, style) {                
                const area = document.getElementById(el.dataset.vgzId);
                if (area) {
                    const polygons = [...area.getElementsByTagName("polygon")];
                    polygons.forEach(el => {
                        el.setAttribute("style", style);
                    });
                }
            }
            function labelOn(el) {
                toggleLabel(el, true);
            }
            function labelOff(el) {
                toggleLabel(el, false);
            }
            function toggleLabel(el, setAttr) {
                const label = document.querySelector('[data-vgz-id="' + el.id + '"]');
                if (label) {
                    if (setAttr) {
                        label.getElementsByTagName("a")[0].classList.add("vgz-lbl-on"); 
                    } else {
                        label.getElementsByTagName("a")[0].classList.remove("vgz-lbl-on"); 
                    }
                }
            }
        </script>        

        [#include "../include/footer.ftl"]
      </<div>
  </body>
</html>
