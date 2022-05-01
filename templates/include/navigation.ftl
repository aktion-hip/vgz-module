[#assign siteRoot = cmsfn.root(content, "mgnl:page")!content ]
[#assign root = isInIntern(content)?then(getIntern(content, siteRoot), siteRoot) ]
[#assign clsIntern = isInIntern(content)?then("intern", "")]
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
      <div class="uk-modal-dialog uk-modal-body uk-height-viewport ${clsIntern}">
        <button class="uk-modal-close-full uk-icon uk-close" type="button" uk-close=""></button>
        <div class="uk-child-width-1-1 uk-grid uk-grid-stack" uk-grid="">
          <div>
            <div class="uk-panel">
              <!-- Mobile-Navigation Start (hamburger menu) -->
              <ul class="uk-nav uk-nav-default uk-nav-parent-icon" uk-nav="">
                [#list cmsfn.children(root, "mgnl:page") as child ]
                  [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                    [#if (content.@path == child.@path) || isAncestorOf(child, content) ]
                      <!-- highlight entry of current page -->
                      <li class="uk-active">
						            [#if !hideInNav(child)]
                          <a href="${getLinkChkd(child)}">${child.navigationTitle!child.title!}</a>
                        [/#if]
                      </li>
                      [#if hasChildren(child)]
                        <li class="uk-active uk-parent vgz-mobile-parent">
                          <a href="${getLinkChkd(child)}"></a>
                          [@mobNavigation child /]
                        </li>
                      [/#if]
                    [#else]
                      <!-- entries of other pages -->
                      <li>
            						[#if !hideInNav(child)]
                          <a href="${getLinkChkd(child)}">${child.navigationTitle!child.title!}</a>
                        [/#if]
                      </li>
                      [#if hasChildren(child)]
                        <li class="uk-parent vgz-mobile-parent">
                          <a href="${getLinkChkd(child)}"></a>
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
                  <li><a href="${getLinkChkd(internHome)}">${internHome.navigationTitle!"Verein"}</a></li>
                [/#if]
              </ul>
              <!-- Mobile-Navigation End -->

              <!-- Page References Start -->
              [#if content.refPages?hasContent]
                <div class="btnRow btnRowLeft">
                  <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid>
                    [#list cmsfn.children(content.refPages) as reference ]
                      <div class="el-item ${(reference?counter > 1)?then('uk-grid-margin','')} uk-first-column">
                        <a class="el-content uk-button uk-button-default" href="${cmsfn.link(cmsfn.contentById(reference.link))}">${reference.label}</a>
                      </div>
                    [/#list]
                  </div>
                </div>
              [/#if]
              <!-- Page References End -->
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
          <!-- Navigation Start (horizontal menu bar at top of page) -->
          <ul class="uk-navbar-nav">
            [#list cmsfn.children(root, "mgnl:page") as child ]
              [#if cmsfn.metaData(child, "mgnl:template") != "vgz-module:pages/vgz-homepage-intern"]
                [#if (content.@path == child.@path) || isAncestorOf(child, content) ]
                  <!-- highlight entry of current page -->
                  <li class="uk-parent uk-active">
                    [#if !hideInNav(child)]
                      <a href="${getLinkChkd(child)}">${child.navigationTitle!child.title!}</a>
                      [@subNavigation child /]
                    [/#if]
                  </li>
                [#else]
                  <!-- entries of other pages -->
                  <li>
                    [#if !hideInNav(child)]
                      <a href="${getLinkChkd(child)}">${child.navigationTitle!child.title!}</a>
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
              <li><a href="${getLinkChkd(internHome)}">${internHome.navigationTitle!"Verein"}</a></li>
            [/#if]
          </ul>
          <!-- Navigation End -->
        </div>
      </nav>
    </div>
  </div>
</div> 	 

