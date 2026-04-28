  <head>
    [@cms.page /]
    
    [#include "../include/functions.ftl"]
    [#include "../include/macros.ftl"]
    [#include "../include/head.ftl"]
    [#include "../include/search.ftl"]

    [#assign site = sitefn.site()!]
    [#assign theme = sitefn.theme(site)!]
    [#list theme.cssFiles as cssFile]
        <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
  </head>
  <body class="vgz-page-galery ${cmsfn.language()}">
    [#assign clsIntern = isInIntern(content)?then("intern", "")]
    <div class="tm-page ${clsIntern}">
      [#assign root = cmsfn.root(content, "mgnl:page") ]
      [#include "../include/navigation.ftl"]

      [@vgzLogo false /]
      [@childNavText content true /]

      <!-- Content - 2 Cols -->
      <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
        <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">

          <div class="uk-width-1-2@m uk-flex-first@m">
            <!-- Content - Col Left -->
            <div class="uk-section-muted left-container">
              <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
                <div class="uk-width-1-1">
                  <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                    <div class="uk-first-column">
                      <img class="el-image" alt="${content.botanicalName!}" uk-img="target: !.uk-slideshow-items" src="${damfn.getAssetLink(content.image)}">
                    </div>
                    <div class="vgz-content">
                      [@cms.area name="left"/]
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="uk-grid-item-match uk-width-1-2@m uk-flex-first">
            <!-- Content - Col Right -->
            <div class="uk-section-muted uk-section uk-section-small innerSection right-container">
              <div class="uk-container">
                <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                  <div class="uk-width-2-3@m">
                    <h1 class="vgz-image-title">${content.title!}</h1>
                    <h2 class="vgz-image-subtitle">${content.botanicalName!}</h2>
                    <div class="vgz-content">
                      [@cms.area name="right"/]
                    </div>
                  </div>
                </div>
              </div>
            </div>  
          </div>
        </div>
      </div>

      [#include "../include/footer.ftl"]      
    </div>
  </body>
</html>
