<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
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
  <body class="vgz-page-textbild ${cmsfn.language()}">
    [#assign clsIntern = isInIntern(content)?then("intern", "")]
    <div class="tm-page ${clsIntern}">
      [#assign root = cmsfn.root(content, "mgnl:page") ]
      [#include "../include/navigation.ftl"]

        <!-- Content - 2 Cols -->
        <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
          <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
            <div class="uk-width-1-2@m">

              <!-- Content - Col Left -->
              <div class="uk-section-muted">
                <div style="background-image: url(images/sauna.jpg); height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
                  <div class="uk-width-1-1">
                    <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                      <div class="uk-first-column">
                        
                        <!-- Slideshow -->
                        [#assign interval = (content.imagesInterval!0) * 1000]
                        [#assign autoplayInterval = (interval == 0)?then("", "autoplay-interval: " + interval?c + ";")]
                        <div uk-slideshow="ratio: false; animation: fade; pauseOnHover: false; autoplay: 1; ${autoplayInterval}" class="uk-margin uk-text-left@l uk-slideshow">
                          <div class="uk-position-relative">
                            <ul class="uk-slideshow-items" uk-height-viewport="offset-top: true; minHeight: 600;">
                              [#list content.images as slideImg ]
                                <li class="el-item uk-transition"><img class="el-image uk-cover" alt="" uk-img="target: !.uk-slideshow-items" src="${damfn.getAssetLink(slideImg)}"></li>
                              [/#list]
                            </ul>
                          </div>
                        </div>

                        <!-- Navigation under Logo right // Placed here for Mobile View -->
                        [@childNavigation content /]

                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <div class="uk-grid-item-match uk-width-1-2@m">

              <!-- Content - Col Right -->
              <div class="uk-section-muted uk-section uk-section-small innerSection">
                <div class="uk-container">
                  <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                    <div class="uk-width-2-3@m"> 
                      <h1>${content.title!}</h1>
                      [#if content.teaser?hasContent]
                        <div class="vgz-teaser">${cmsfn.decode(content).teaser!}</div>
                      [/#if]
                      <div class="vgz-content">
                        [@cms.area name="content"/]                                      
                      </div>
                    </div>
                    <div class="uk-width-1-3@m"></div>
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
