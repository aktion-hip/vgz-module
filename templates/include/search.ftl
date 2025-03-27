[#assign queryStr = ctx.getParameter('queryStr')!?html]
[#if queryStr?has_content]
    [#assign pages = searchfn.searchContent("website", queryStr, "/stadtoase", "mgnl:page") /]
    [#assign searchResults1 = pages?filter(p -> p["mgnl:template"] != "vgz-module:pages/vgz-proxy") /]
    [#assign searchResults2 = searchfn.searchContent("dam", queryStr, "/vgz", "mgnl:asset") /]
    [#assign recordsFound = searchResults1?size /]
    <div class="vgz-search-results" onclick="hideSearchResults()">
        <div class="vgz-search-content">
            [#if searchResults1?has_content || searchResults2?has_content]
                [#list searchResults1 + searchResults2 as item]
                    <div class="vgz-search-result-item">
                        <h2 class="vgz-result-item-title">
                            <a href="${cmsfn.link(item)}">${item.title!}</a>
                        </h2>
                        <section>
                            ${item.excerpt!}
                            [#assign vgzAsset = damfn.getAsset("jcr", cmsfn.asJCRNode(item).getPath())!]
                            [#if vgzAsset?has_content]
                                <p class="vgz-result-asset"><a href="${vgzAsset.getLink()}">${vgzAsset.name}</a></p>
                            [/#if]
                        </section>
                    </div>
                [/#list]
            [#else]
                <h2 class="vgz-result-item-title">
                    Keine Ergebnisse gefunden zu "${queryStr?replace('*','')}"!
                </h2>
            [/#if]
        </div>
    </div>
[/#if]