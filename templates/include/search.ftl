[#assign queryStr = ctx.getParameter('queryStr')!?html]
[#if queryStr?has_content]
    [#assign searchResults = searchfn.searchPages(queryStr, '/stadtoase') /]
    [#assign recordsFound = searchResults?size /]
    <div class="vgz-search-results" onclick="hideSearchOverlay()">
        <div class="vgz-search-content">
            [#if searchResults?has_content]
                [#list searchResults as item]
                    <div class="vgz-search-result-item">
                        <div class="vgz-result-item-title">                            
                            <a href="${cmsfn.link(item)}">${item.title!}</a>
                        </div>
                        ${item.excerpt!}
                    </div>
                [/#list]
            [#else]
                Keine Ergebnisse gefunden zu "${queryStr}"!
            [/#if]
        </div>
    </div>
[/#if]