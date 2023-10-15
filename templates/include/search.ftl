[#assign queryStr = ctx.getParameter('queryStr')!?html]
[#if queryStr?has_content]
    [#assign searchResults = searchfn.searchPages(queryStr, '/stadtoase') /]
    [#assign recordsFound = searchResults?size /]
    <div class="vgz-search-results" onclick="hideSearchOverlay()">
        <div class="vgz-search-content">
            [#if searchResults?has_content]
                [#list searchResults as item]
                    <a href="${cmsfn.link(item)}">
                        <p>${item.title!}</p>
                    </a>
                [/#list]
            [#else]
                Keine Ergebnisse gefunden zu "${queryStr}"!
            [/#if]
        </div>
    </div>
[/#if]