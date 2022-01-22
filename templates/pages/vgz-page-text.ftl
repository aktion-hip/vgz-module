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
  <body class="vgz-page-text ${cmsfn.language()}">
      [#assign clsIntern = isInIntern(content)?then("intern", "")]
      <div class="tm-page ${clsIntern}">
        [#assign root = cmsfn.root(content, "mgnl:page") ]
        [#include "../include/navigation.ftl"]

        <!-- Navigation over Image left -->
        [#if content.refPages?hasContent]
          <div class="btnRow btnRowLeft uk-visible@m">
            <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
              [#list cmsfn.children(content.refPages) as reference ]
                <div class="el-item ${(reference?counter > 1)?then('uk-grid-margin','')} uk-first-column">
                  <a class="el-content uk-button uk-button-default" href="${cmsfn.link(cmsfn.contentById(reference.link))}">${reference.label}</a>
                </div>
              [/#list]
            </div>
          </div>
        [/#if]

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
                  [#if !(content.titlePos!false)]                    
                    <h1>${content.title!}</h1>
                    [#if content.teaser?hasContent]
                      <div class="vgz-teaser">${cmsfn.decode(content).teaser!}</div>
                    [/#if]
                  [#else]
                    <div class="vgz-title-placeholder"></div>
                  [/#if]
                  <div class="vgz-content">

                    [@cms.area name="left"/]
                  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      [@childNavText content false /]

      <div class="uk-grid-item-match uk-width-1-2@m uk-flex-first">
        <!-- Content - Col Right -->
        <div class="uk-section-muted uk-section uk-section-small innerSection right-container">
          <div class="uk-container">
            <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
              <div class="uk-width-2-3@m">
                [#if content.titlePos!false]
                  <h1>${content.title!}</h1>
                  [#if content.teaser?hasContent]
                    <div class="vgz-teaser">${cmsfn.decode(content).teaser!}</div>
                  [/#if]
                [#else]
                  <div class="vgz-title-placeholder"></div>
                [/#if]

                <div class="vgz-content">
                  [@cms.area name="rigth"/]                  
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
