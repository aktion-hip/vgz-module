<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${content.windowTitle!content.title!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />

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
    <div class="tm-page">

      <div class="tm-header uk-visible@m" uk-header="">
        <div class="uk-navbar-container">
          <div class="uk-container">
            <nav class="uk-navbar" uk-navbar="{align:left,boundary:!.uk-navbar-container}">
              <div class="uk-navbar-center">
                <!-- Navigation Placeholder Start -->
                <ul class="uk-navbar-nav">
                  [#list cmsfn.children(content, "mgnl:page") as child ]
                    [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                      <li><a href="${cmsfn.link(child)}">${child.title!}</a></li>
                    [/#if]
                  [/#list]
                </ul>
                <!-- Navigation Placeholder End -->
              </div>
            </nav>
          </div>
        </div>
      </div
      
      <!-- Logo -->
      <div class="imgLogo"> 
        <a class="el-link" href="${cmsfn.link(content)}"><img src="${ctx.contextPath}/.resources/vgz-module/webresources/img/logo.png" class="el-image" alt="Stadt Oase Zürich" /></a> 
      </div>

      <!-- Content - Screen-Height -->
      <div id="content" class="uk-section-muted home">
        <div style="background-image: url(${damfn.getAssetLink(content.image!)}); min-height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-section uk-flex uk-flex-middle" uk-height-viewport="offset-top: true;">
          <div class="uk-width-1-1">
            <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid>
              <div class="uk-first-column">
              </div>
            </div>
          </div>
        </div>
      </div>      

      [#include "../include/footer.ftl"]
    </<div>
  </body>
</html>
