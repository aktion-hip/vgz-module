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
