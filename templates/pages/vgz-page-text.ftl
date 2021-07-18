<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    
    [#include "../include/functions.ftl"]
    [#include "../include/head.ftl"]

    [#assign site = sitefn.site()!]
    [#assign theme = sitefn.theme(site)!]
    [#list theme.cssFiles as cssFile]
        [#if cssFile.conditionalComment?has_content]<!--[if ${cssFile.conditionalComment}]>[/#if]
          <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
        [#if cssFile.conditionalComment?has_content]<![endif]-->[/#if]
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
  </head>
  <body class="vgz-page-text ${cmsfn.language()}">
      [#assign clsIntern = isInIntern(content)?then("intern", "")]
      <div class="tm-page ${clsIntern}">
        [#assign root = cmsfn.root(content, "mgnl:page") ]
        [#include "../include/navigation.ftl"]

  <!-- Content - 2 Cols -->
  <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
    <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
      <div class="uk-width-1-2@m uk-flex-first@m">

        <!-- Content - Col Left -->
        <div class="uk-section-muted">
          <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
            <div class="uk-width-1-1">
              <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                <div class="uk-first-column">
                 

                    <div class="uk-margin teamGrid">
                        <div class="uk-child-width-1-1 uk-grid-match uk-grid uk-grid-stack" uk-grid="">

                            <div class="">
                                <div class="el-item uk-panel uk-margin-remove-first-child">
                                    <div class="uk-child-width-expand uk-grid" uk-grid="">
                                        <div class="uk-margin-remove-first-child uk-first-column">
                                            <h3 class="uk-margin-top uk-margin-remove-bottom">Rahel Leugger <a href="mailto:test@test.com" class="uk-icon" uk-icon="icon: mail; ratio: 2"></a></h3>
                                            Geschäftsleitung
                                        </div>
                                        <div class="uk-width-1-2@s"><img src="images/team/team1.jpg" class="el-image" alt=""></div>
                                    </div>
                                </div>
                            </div>

                            <div class="">
                                <div class="el-item uk-panel uk-margin-remove-first-child">
                                    <div class="uk-child-width-expand uk-grid" uk-grid="">
                                        <div class="uk-margin-remove-first-child uk-first-column">
                                            <h3 class="uk-margin-top uk-margin-remove-bottom">Petra Gartenmann <a href="mailto:test@test.com" class="uk-icon" uk-icon="icon: mail; ratio: 2"></a></h3>
                                            Assistentin Geschäftsleitung
                                        </div>
                                        <div class="uk-width-1-2@s"><img src="images/team/team2.jpg" class="el-image" alt=""></div>
                                    </div>
                                </div>
                            </div>

                            <div class="">
                                <div class="el-item uk-panel uk-margin-remove-first-child">
                                    <div class="uk-child-width-expand uk-grid" uk-grid="">
                                        <div class="uk-margin-remove-first-child uk-first-column">
                                            <h3 class="uk-margin-top uk-margin-remove-bottom">Vanessa Citrini <a href="mailto:test@test.com" class="uk-icon" uk-icon="icon: mail; ratio: 2"></a></h3>
                                            Mitarbeiterin Sauna und Cafeteria
                                        </div>
                                        <div class="uk-width-1-2@s"><img src="images/team/team3.jpg" class="el-image" alt=""></div>
                                    </div>
                                </div>
                            </div>                            


                        </div>
                    </div>

                  

                </div>
              </div>
            </div>
          </div>
        </div>


      </div>
      <div class="uk-grid-item-match uk-width-1-2@m uk-flex-first">

        <!-- Content - Col Right -->
        <div class="uk-section-muted uk-section uk-section-small innerSection">
          <div class="uk-container">
            <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
              <div class="uk-width-2-3@m">
                <h1>${content.title!}</h1>
                [@cms.area name="content"/]                 </div>
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
