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

      [#assign leftTop = cmsfn.contentByPath(content.@path + "/leftTop")!]
      [#assign rightTop = cmsfn.contentByPath(content.@path + "/rightTop")!]
      [#assign leftBottom = cmsfn.contentByPath(content.@path + "/leftBottom")!]
      [#assign rightBottom = cmsfn.contentByPath(content.@path + "/rightBottom")!]

      <!-- Content - 2 Cols  top -->
      <div id="contentTop" class="uk-section-muted uk-section uk-padding-remove-vertical">
        <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">

          [#if cmsfn.isEditMode() || (leftTop?? && cmsfn.children(leftTop, "mgnl:component")?size > 0) || (rightTop?? && cmsfn.children(rightTop, "mgnl:component")?size > 0)]
            <div class="uk-width-1-2@m uk-flex-first@m">
              <!-- Content - Col Left top -->
              <div class="uk-section-muted left-container">
                <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
                  <div class="uk-width-1-1">
                    <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                      <div class="uk-first-column">
                        <h1>${content.title!}</h1>
                        <div class="vgz-content">
                          [@cms.area name="leftTop"/]
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="uk-grid-item-match uk-width-1-2@m uk-flex-first">
              <!-- Content - Col Right top -->
              <div class="uk-section-muted uk-section uk-section-small innerSection right-container">
                <div class="uk-container">
                  <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                    <div class="uk-width-2-3@m">
                      <div class="vgz-title-placeholder"></div>
                      <div class="vgz-content">
                        [@cms.area name="rightTop"/]
                      </div>
                    </div>
                  </div>
                </div>
              </div>  
            </div>
          [#else]
            <div class="vgz-galery-title">
              <h1>${content.title!}</h1>
            </div>
          [/#if]
        </div>
      </div>

      <!-- galery part -->
      [#assign allImgChildren = cmsfn.children(content, "mgnl:page")! /]
      <div class="vgz-gallery-container uk-margin-remove-top">
        [#list allImgChildren as child]
          [#if cmsfn.metaData(child, "mgnl:template") == "vgz-module:pages/vgzPlant"]
            <figure class="gallery-item">
              <div class="image-wrapper">
                <img src="${damfn.getAssetLink(child.image)}" alt="${child.title!}">
                <div class="overlay">
                  <a class="title-link" href="${cmsfn.link(child)}">${child.title!}</a>
                </div>
              </div>
            </figure>
          [/#if]
        [/#list]
      </div>


      <!-- Content - 2 Cols  bottom -->
      <div id="contentBottom" class="uk-section-muted uk-section uk-padding-remove-vertical">
        <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">

          [#if cmsfn.isEditMode() || (leftBottom?? && cmsfn.children(leftBottom, "mgnl:component")?size > 0) || (rightBottom?? && cmsfn.children(rightBottom, "mgnl:component")?size > 0)]
            <div class="uk-width-1-2@m uk-flex-first@m">
              <!-- Content - Col Left bottom -->
              <div class="uk-section-muted left-container">
                <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
                  <div class="uk-width-1-1">
                    <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                      <div class="uk-first-column">
                        <div class="vgz-content">
                          [@cms.area name="leftBottom"/]
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="uk-grid-item-match uk-width-1-2@m uk-flex-first">
              <!-- Content - Col Right bottom -->
              <div class="uk-section-muted uk-section uk-section-small innerSection right-container">
                <div class="uk-container">
                  <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                    <div class="uk-width-2-3@m">
                      <div class="vgz-content">
                        [@cms.area name="rightBottom"/]
                      </div>
                    </div>
                  </div>
                </div>
              </div>  
            </div>
          [/#if]

        </div>
      </div>

      [#include "../include/footer.ftl"]      
    </div>
  </body>
</html>
