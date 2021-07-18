[#assign siteRoot = cmsfn.root(content, "mgnl:page")!content ]
[#assign root = isInIntern(content)?then(getIntern(content, siteRoot), siteRoot) ]
<div class="tm-header uk-visible@m" uk-header="">
  <div class="uk-navbar-container">
    <div class="uk-container">
      <nav class="uk-navbar" uk-navbar="{align:left,boundary:!.uk-navbar-container}">
        <div class="uk-navbar-center">
          <!-- Navigation Placeholder Start -->
          <ul class="uk-navbar-nav">
            [#list cmsfn.children(root, "mgnl:page") as child ]
              [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                [#if content.@path == child.@path ]
                  <li class="uk-parent uk-active"><a href="${cmsfn.link(child)}">${child.title!}</a></li>
                [#else]
                  <li><a href="${cmsfn.link(child)}">${child.title!}</a></li>
                [/#if]
              [/#if]
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
  <a class="el-link" href="${cmsfn.link(siteRoot)}"><img src="${ctx.contextPath}/.resources/vgz-module/webresources/img/logo.png" class="el-image" alt="Stadt Oase Zürich" /></a> 
</div>
