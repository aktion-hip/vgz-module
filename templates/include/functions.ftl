[#function isHomeIntern item]
  [#return cmsfn.metaData(item, "mgnl:template") == "vgz-module:pages/vgz-homepage-intern"]
[/#function]

[#function isInIntern item]
  [#assign ancestors = cmsfn.ancestors(item, "mgnl:page") ]
  [#return (ancestors?size > 1)?then(isHomeIntern(ancestors[1]), isHomeIntern(item))]
[/#function]

[#function getIntern item, siteRoot]
  [#assign ancestors = cmsfn.ancestors(item, "mgnl:page") ]
  [#return (ancestors?size > 1)?then(ancestors[1], (ancestors?size == 1)?then(item, siteRoot))]
[/#function]

[#function isAncestorOf item, toCheck]
  [#assign ancestors = cmsfn.ancestors(toCheck, "mgnl:page") ]
  [#return ancestors?seq_contains(item)]
[/#function]

[#function getEvents]
  [#assign events = cmsfn.contentByPath("/", "vgz_events")]
  [#assign all = cmsfn.children(events, "vgz:event")?sort_by("start_date")]
  [#assign yesterday = .now?long - 86400000]
  [#return all?filter(e -> (e.end_date??)?then(e.end_date?long >= yesterday, e.start_date?long >= yesterday))]
[/#function]

[#function hasChildren item]
  [#return cmsfn.children(item, "mgnl:page")?size > 0]
[/#function]

[#function getSiteRoot content]
  [#assign root = cmsfn.children(cmsfn.contentByPath("/"), "mgnl:page")]
  [#return (root?size > 0)?then(root[0], content)]
[/#function]

[#function isProxy page]
  [#return cmsfn.metaData(page, "mgnl:template") == "vgz-module:pages/vgz-proxy"]
[/#function]

[#function hideInNav page]
  [#return isProxy(page)?then(false, page.hideInNav)]
[/#function]

[#function getLinkChkd page]
  [#return isProxy(page)?then(cmsfn.link(cmsfn.contentById(page.target)), cmsfn.link(page))]
[/#function]
