<!-- Footer -->
<div id="footer" class="uk-section-default uk-section uk-section-xsmall">
    <div class="uk-container uk-container-expand">
        <div class="tm-grid-expand uk-grid-margin" uk-grid>
        <div class="uk-width-1-2">
            <div class="uk-panel">
            <ul class="uk-nav uk-nav-default">
                <li><a href="#">Newsletter</a></li>
                <li><a href="#">Sonnenpark</a></li>
                <li><a href="#">Blackboard</a></li>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
            </div>
        </div>
        <div class="uk-grid-item-match uk-flex-middle uk-width-1-2">
            <div class="uk-panel uk-margin uk-text-right">
                [#assign root = cmsfn.root(content, "mgnl:page")!content ]
                [#assign intern = cmsfn.contentListByTemplateId(cmsfn.asJCRNode(root), "vgz-module:pages/vgz-homepage-intern") ]
                <div class="btnVerein"><a href="${cmsfn.link(cmsfn.asContentMap(intern[0]))}">Verein</a></div>
            </div>
        </div>
        </div>
    </div>
</div>