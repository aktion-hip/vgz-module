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
        [#if cssFile.conditionalComment?has_content]<!--[if ${cssFile.conditionalComment}]>[/#if]
          <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
        [#if cssFile.conditionalComment?has_content]<![endif]-->[/#if]
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
  </head>
  <body class="vgz-homepage ${cmsfn.language()}">
    <div class="tm-page intern">
      [#include "../include/navigation.ftl"]
      [@vgzLogo false /]

  <!-- Navigation over Image left -->
  <div class="btnRow btnRowLeft uk-visible@m">
    <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid="">
      <div class="el-item"><a class="el-content uk-button uk-button-default" href="home.php">Zurück</a></div>
    </div>
  </div>
  
    
  <!-- Content - 2 Cols -->
  <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
    <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
      <div class="uk-width-1-2@m">

        <!-- Content - Col Left -->
        <div class="uk-section-muted">
          <div style="background-image: url(${damfn.getAssetLink(content.image!)}); height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
            <div class="uk-width-1-1">
              <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                <div class="uk-first-column">
                  <img src="${damfn.getAssetLink(content.image!)}" class="el-image uk-hidden@m" alt="Verein StadtOase Zürich" />
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
                [@cms.area name="content"/]
              </div>
              <div class="uk-width-1-3@m"></div>
            </div>
          </div>
        </div>       
        
        
      </div>
    </div>
  </div>


      [#include "../include/footer.ftl"]
    </<div>
    <!-- Alarm intern -->
    [#if content.alarm_text?has_content]
      <div id="modalInfo" class="uk-flex-top uk-modal uk-flex uk-open" uk-modal="">
        <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
          <button class="uk-modal-close-default uk-icon uk-close" type="button" uk-close=""><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><line fill="none" stroke="#000" stroke-width="1.1" x1="1" y1="1" x2="13" y2="13"></line><line fill="none" stroke="#000" stroke-width="1.1" x1="13" y1="1" x2="1" y2="13"></line></svg></button>
          <p>${cmsfn.decode(content).alarm_text}</p>
        </div>
      </div>      
    [/#if]
  </body>
</html>
