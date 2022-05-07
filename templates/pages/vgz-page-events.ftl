<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]

    [#setting locale="de_DE"]
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
        [@vgzLogo false /]

  <!-- Content - 2 Cols -->
  [#assign events = getEvents() ]
  <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
    <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
      <div class="uk-width-1-2@m">
        <!-- Content - Col Left - start -->
        <div class="uk-section-muted">
          <div style="background-image: none; height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
            <div class="uk-width-1-1">
              <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                <div class="uk-first-column">
                
                  <div class="vk-event_details active" id="vk.event.default">
                    [#if content.image?has_content]
                      <img src="${damfn.getAssetLink(content.image)}" class="el-image" alt="Bild zu ${content.title}" />
                    [/#if]
                  </div>

                  [#list events as event]
                    <div class="vk-event_details" id="${event.name}">
                      <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                        <div class="uk-width-1-2@m">
                          [#if event.image?has_content]
                            <img src="${damfn.getAssetLink(event.image)}" class="el-image" alt="Bild zu ${event.title}" />
                          [/#if]
                        </div>
                        <div class="uk-width-1-2@m">
                          <div class="uk-panel uk-margin innerGrid">
                            <h2>${event.title!}</h2>
                            [#if event.teaser?has_content]
                                <p>${event.teaser}</p>
                            [/#if]                            
                            [#if event.description?has_content]
                                ${cmsfn.decode(event).description}
                            [/#if]
                            [#if event.end_date?has_content]
                              <p class="uk-text-large">${event.start_date?string["EEEE, d. MMMM yyyy"]}<br />${event.start_time!}</p>
                              <p class="uk-text-large">bis ${event.end_date?string["EEEE, d. MMMM yyyy"]}<br />${event.end_time!}</p>
                            [#else]
                              <p class="uk-text-large">${event.start_date?string["EEEE, d. MMMM yyyy"]}<br />${event.start_time!} - ${event.end_time!}</p>
                            [/#if]
                            [#if event.registration_mail?has_content]
                              <a class="el-content uk-button uk-button-default" href="mailto:${event.registration_mail}?subject=Stadtoase Anmeldung">Anmelden</a>
                            [/#if]
                          </div>
                        </div>
                      </div>                 
                    </div>
                  [/#list]

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Content - Col Left - end -->
    
      </div>

      <div class="uk-grid-item-match uk-width-1-2@m">
        <!-- Content - Col Right -->
        <div class="uk-section-muted uk-section uk-section-small innerSection">
          <div class="uk-container">
            <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
              <div class="uk-width-2-3@m">
                <h1>${content.title!}</h1>
                [#list events as event]
                  <div class="vk-event" onclick='toggleEventDetails("${event.name}", this)'>
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
