<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${content.windowTitle!content.title!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />

    [#-- To load resources you can link them manually (e.g. line below) --]
      [#-- <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/vgz-module/webresources/css/bootstrap.css" media="all" /> --]
      [#-- <script src="${ctx.contextPath}/.resources/vgz-module/webresources/js/jquery.js"></script> --]
    [#-- or via theme --]
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
  <body class="vgz-home-page ${cmsfn.language()}">
    <div class="tm-page">

      <div class="tm-header uk-visible@m" uk-header="">
        <div class="uk-navbar-container">
          <div class="uk-container">
            <nav class="uk-navbar" uk-navbar="{align:left,boundary:!.uk-navbar-container}">
              <div class="uk-navbar-center">
                <!-- Navigation Placeholder Start -->
                <ul class="uk-navbar-nav">
                  [#list cmsfn.children(content, "mgnl:page") as child ]
                    <li><a href="#">${child.title!}</a></li>
                  [/#list]
                </ul>
                <!-- Navigation Placeholder End -->
              </div>
            </nav>
          </div>
        </div>
      </div>    

      <!-- Logo -->
      <div class="imgLogo"> 
        <a class="el-link" href="home.php"><img src="${ctx.contextPath}/.resources/vgz-module/webresources/img/logo.png" class="el-image" alt="Stadt Oase Zürich" /></a> 
      </div>

      <!-- Navigation over Image left -->
      <div class="btnRow btnRowLeft uk-visible@m">
        <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid="">
          <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Sauna Abonnement </a> </div>
          <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Massage buchen </a> </div>
          <div class="el-item"> <a class="el-content uk-button uk-button-default" href="agenda.php">Agenda </a> </div>
          <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Mitgliedschaften </a> </div>
        </div>
      </div>

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
                    [#assign imgSauna = damfn.getFolder("jcr", "/vgz/img/sauna")!]
                    <div uk-slideshow="ratio: false; animation: fade; autoplay: 1; pauseOnHover: false;" class="uk-margin uk-text-left@l uk-slideshow">
                      <div class="uk-position-relative">
                        <ul class="uk-slideshow-items" uk-height-viewport="offset-top: true; minHeight: 600;">
                          [#list imgSauna.getChildren() as item]
                            <li class="el-item uk-transition"><img class="el-image uk-cover" alt="" uk-img="target: !.uk-slideshow-items" src="${item.getLink()}"></li>
                          [/#list]
                        </ul>
                      </div>
                    </div>

                    <!-- Navigation under Logo right // Placed here for Mobile View -->
                    <div id="subNav" class="btnRow btnRowRight">
                      <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid="">
                        <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Abonnement kaufen</a> </div>
                        <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Jetzt Mitglied werden</a> </div>                      
                      </div>
                    </div>
                      

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
                  <h1>Sauna</h1>
                    [@cms.area name="content"/]
                    <p>
                      <table class="uk-table uk-table-divider uk-table-justify uk-table-small">
                        <tbody>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td><span uk-icon="icon-wetter"></span> 22-55%</td>
                                <td><span uk-icon="icon-temperatur"></span> 85-95° C</td>
                            </tr>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td><span uk-icon="icon-wetter"></span> 22-55%</td>
                                <td><span uk-icon="icon-temperatur"></span> 85-95° C</td>
                            </tr>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td><span uk-icon="icon-wetter"></span> 22-55%</td>
                                <td><span uk-icon="icon-temperatur"></span> 85-95° C</td>
                            </tr>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td><span uk-icon="icon-wetter"></span> 22-55%</td>
                                <td><span uk-icon="icon-temperatur"></span> 85-95° C</td>
                            </tr>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td><span uk-icon="icon-wetter"></span> 22-55%</td>
                                <td><span uk-icon="icon-temperatur"></span> 85-95° C</td>
                            </tr>
                            <tr>
                                <td>Sauna&nbsp;Finnisch</td>
                                <td colspan="2" class="uk-text-small uk-text-right">Zwei Ruhezonen Indoor <br />und Liegen im grossen Aussenbereich</td>
                            </tr>                        
                        </tbody>
                      </table>
                    </p>
                                    
                  </div>
                  <div class="uk-width-1-3@m"></div>
                </div>
              </div>
            </div>       
            <!-- Content - Col Right End -->
            
          </div>
        </div>
      </div>
      <!-- Content - 2 Cols End -->

      [#include "../include/footer.ftl"]

    </div>
  </body>
</html>
