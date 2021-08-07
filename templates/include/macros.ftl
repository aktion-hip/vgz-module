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

[#macro showEventDate eventDate eventTime]
  [#setting locale="de_DE"]
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
  </div>
[/#macro]