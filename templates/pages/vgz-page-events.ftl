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
  <body class="vgz-page-events ${cmsfn.language()}">
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
          <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
            <div class="uk-width-1-1">
              <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                <div class="uk-first-column">
                
                    <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                      <div class="uk-width-1-2@m">
                        <div class="uk-panel uk-margin">
                          <img src="images/agenda.jpg" class="el-image" alt="Agenda" />
                        </div>
                      </div>
                      <div class="uk-width-1-2@m">
                        <div class="uk-panel uk-margin innerGrid">
                          <h2>Kinderlesung mit Susanna Meier</h2>
                          <p>Lorem ipsum dolor sit amet, <a href="#">consectetuer adipiscing elit</a>. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. </p>
                          <p class="uk-text-large">Freitag 12. Juni 2021<br />15.00 - 17.30 Uhr</p>
                          <a class="el-content uk-button uk-button-default" href="#">Anmelden</a>
                        </div>
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
                [#list getEvents() as event]
                  <div class="vk-event">
                    <div class="vk-event_title">
                      ${event.title!"???"}
                    </div>
                    <div class="vk-event_date-time uk-text-small">
                      [@showEventDate event.start_date event.start_time!"" event.end_date!"" event.end_time!"" /]
                    </div>
                  </div>
                [/#list]
                
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
