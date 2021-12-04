[#-- displays the dropdown menu on the main navigation --]
[#macro subNavigation parent]
  [#assign children = cmsfn.children(parent, "mgnl:page") ]
  [#if children?size > 0]
    <!-- Sub-Navigation Start -->
    <div class="uk-navbar-dropdown uk-navbar-dropdown-bottom-left">
      <div class="uk-navbar-dropdown-grid uk-child-width-1-1 uk-grid uk-grid-stack" uk-grid>
        <div>
          <ul class="uk-nav uk-navbar-dropdown-nav">
            [#list children as child ]
              [#if !child.hideInNav]
                <li><a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a></li>
              [/#if]
            [/#list]	  
          </ul>
        </div>
      </div>
    </div>
    <!-- Sub-Navigation End -->
  [/#if]
[/#macro]

[#-- displays the subnavigation menu on the mobile screen --]
[#macro mobNavigation parent]
  [#assign children = cmsfn.children(parent, "mgnl:page") ]
  [#if children?size > 0]
    <!-- Sub-Navigation Start -->
    <ul class="uk-nav-sub">
      [#list children as child ]
        [#if !child.hideInNav]
          <li><a href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a></li>
        [/#if]
      [/#list]
    </ul>
    <!-- Sub-Navigation End -->
  [/#if]
[/#macro]

[#-- displays the navigation to a page's children (desktop or mobile) --]
[#macro childNavigation parent]
  [#assign children = cmsfn.children(parent, "mgnl:page") ]
  [#if children?size > 0]
    <div id="subNav" class="btnRow btnRowRight">
      <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
        [#list children as child ]
          [#if !child.hideInNav]
            <div class="el-item uk-first-column"> <a class="el-content uk-button uk-button-default" href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a> </div>
          [/#if]
        [/#list]
      </div>
    </div>
  [/#if]
[/#macro]

[#-- displays the navigation to a page's children --]
[#macro childNavText parent isTop ]
  [#assign children = cmsfn.children(parent, "mgnl:page") ]
  [#if children?size > 0]
    [#if isTop]
      <!-- mobile (will be hidden on computer) -->
      <div class="vgz-child_nav-mobile vgz-top">
        <div class="btnRow btnRowRight">
          <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
            [#list children as child ]
              [#if !child.hideInNav]
                <div class="el-item uk-grid-margin uk-first-column">
                  <a class="el-content uk-button uk-button-default" href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                </div>                      
              [/#if]
            [/#list]
          </div>
        </div>
      </div>      
    [#else]
      <!-- computer (will be hidden on mobile) -->
      <div class="vgz-child_nav">
        <div class="btnRow btnRowRight">
          <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid uk-grid-stack" uk-grid="">
            [#list children as child ]
              [#if !child.hideInNav]
                <div class="el-item uk-grid-margin uk-first-column">
                  <a class="el-content uk-button uk-button-default" href="${cmsfn.link(child)}">${child.navigationTitle!child.title!}</a>
                </div>                      
              [/#if]
            [/#list]
          </div>
        </div>
      </div>
    [/#if]
  [/#if]
[/#macro]

[#-- displays the event date on a event list --]
[#macro showEventDate eventDate eventTime endDate endTime]
  <div class="vk-event_date-time uk-text-small">
    <div class="vk-event_date-weekday">
      ${eventDate?date?string["EEEE"]}
    </div>
    <div class="vk-event_date-day">
      ${eventDate?date?string["d. MMMM yyyy"]}
    </div>
    <div class="vk-event_date-time">
      ${eventTime!}
    </div>
    [#if endDate?is_date_like]
      <div class="vk-event_date-day">
        bis ${endDate?date?string["d. MMMM yyyy"]}
      </div>
    [/#if]
    [#if endTime?length > 0]
      <div class="vk-event_date-time">
        ${endTime}
      </div>
    [/#if]
  </div>
[/#macro]
