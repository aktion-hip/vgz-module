[#assign siteRoot = cmsfn.root(content, "mgnl:page")!content ]
[#assign root = isInIntern(content)?then(getIntern(content, siteRoot), siteRoot) ]
<div class="tm-header uk-visible@m" uk-header="">
  <div class="uk-navbar-container">
    <div class="uk-container">
      <nav class="uk-navbar" uk-navbar="{align:left,boundary:!.uk-navbar-container}">
        <div class="uk-navbar-center">
          <!-- Navigation Start -->
          <ul class="uk-navbar-nav">
            [#list cmsfn.children(root, "mgnl:page") as child ]
              [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                [#if (content.@path == child.@path) || isAncestorOf(child, content) ]
                  <li class="uk-parent uk-active">
                    <a href="${cmsfn.link(child)}">${child.title!}</a>
                    [@subNavigation child /]
                  </li>
                [#else]
                  <li>
                    <a href="${cmsfn.link(child)}">${child.title!}</a>
                    [@subNavigation child /]
                  </li>
                [/#if]
              [/#if]
            [/#list]
            [#if !isInIntern(content)]
              [#assign root = cmsfn.root(content, "mgnl:page")!content ]
              [#assign intern = cmsfn.contentListByTemplateId(cmsfn.asJCRNode(root), "vgz-module:pages/vgz-homepage-intern") ]
              [#assign internHome = cmsfn.asContentMap(intern[0]) ]
              <li><a href="${cmsfn.link(internHome)}">${internHome.navigationTitle!"Verein"}</a></li>
            [/#if]
          </ul>
          <!-- Navigation End -->
        </div>
      </nav>
    </div>
  </div>
</div> 	 

<!-- Logo -->
<div class="imgLogo">
  <a class="el-link" href="${cmsfn.link(siteRoot)}"><img src="${ctx.contextPath}/.resources/vgz-module/webresources/img/logo.png" class="el-image" alt="Stadt Oase Zürich" /></a> 
</div>
