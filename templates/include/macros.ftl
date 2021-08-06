[#macro subNavigation parent]
  [#assign children = cmsfn.children(parent, "mgnl:page") ]
  [#if children?size > 0]
    <!-- Sub-Navigation Start -->
    <div class="uk-navbar-dropdown uk-navbar-dropdown-bottom-left">
      <div class="uk-navbar-dropdown-grid uk-child-width-1-1 uk-grid uk-grid-stack" uk-grid>
        <div>
          <ul class="uk-nav uk-navbar-dropdown-nav">
            [#list children as child ]
            <li><a href="${cmsfn.link(child)}">${child.title!}</a></li>
            [/#list]	  
          </ul>
        </div>
      </div>
    </div>
    <!-- Sub-Navigation End -->
  [/#if]
[/#macro]
