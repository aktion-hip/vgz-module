[#assign siteRoot = cmsfn.root(content, "mgnl:page")!content ]
[#assign root = isInIntern(content)?then(getIntern(content, siteRoot), siteRoot) ]
<!-- header mobile -->
  <div class="tm-header-mobile uk-hidden@m">
    <div class="uk-sticky uk-sticky-fixed" uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky">
      <div class="uk-navbar-container">
        <nav uk-navbar="" class="uk-navbar">
          <div class="uk-navbar-left"> 
            <a class="uk-navbar-toggle" href="#tm-mobile" uk-toggle="" aria-expanded="false">
              <div uk-navbar-toggle-icon="" class="uk-icon uk-navbar-toggle-icon"></div>
            </a> 
          </div>
        </nav>
      </div>
    </div>
    <div id="tm-mobile" class="uk-modal-full uk-modal" uk-modal="">
      <div class="uk-modal-dialog uk-modal-body uk-height-viewport">
        <button class="uk-modal-close-full uk-icon uk-close" type="button" uk-close=""></button>
        <div class="uk-child-width-1-1 uk-grid uk-grid-stack" uk-grid="">
          <div>
            <div class="uk-panel">
              <!-- Mobile-Navigation Start -->
              <ul class="uk-nav uk-nav-default uk-nav-parent-icon" uk-nav="">
                [#list cmsfn.children(root, "mgnl:page") as child ]
                  [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                    [#if (content.@path == child.@path) || isAncestorOf(child, content) ]
                      <li class="uk-active">
                        [#if !child.hideInNav]                        
                          <a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                        [/#if]
                      </li>
                      [#if hasChildren(child)]
                        <li class="uk-active uk-parent vgz-mobile-parent">
                          <a href="${cmsfn.link(child)}"></a>
                          [@mobNavigation child /]
                        </li>
                      [/#if]
                    [#else]
                      <li>
                        [#if !child.hideInNav]
                          <a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                        [/#if]
                      </li>
                      [#if hasChildren(child)]
                        <li class="uk-parent vgz-mobile-parent">
                          <a href="${cmsfn.link(child)}"></a>
                          [@mobNavigation child /]
                        </li>
                      [/#if]
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
              <!-- Mobile-Navigation End -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- header screen -->
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
                    [#if !child.hideInNav]                      
                      <a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                      [@subNavigation child /]
                    [/#if]
                  </li>
                [#else]
                  <li>
                    [#if !child.hideInNav]                     
                      <a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                      [@subNavigation child /]
                    [/#if]
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
