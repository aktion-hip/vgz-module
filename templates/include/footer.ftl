<!-- Footer -->
<div id="footer" class="uk-section-default uk-section uk-section-xsmall">
    <div class="uk-container uk-container-expand">
        <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
            <div class="uk-width-1-2 uk-first-column">
                <div class="uk-panel">
                    <ul class="uk-nav uk-nav-default">
                        [#assign root = getSiteRoot(content)]
                        [#if root.newsletter?has_content]
                            <li><a href="${cmsfn.link(cmsfn.contentById(root.newsletter))}" target="_blank">Newsletter</a></li>
                        [/#if]
                        [#if root.sopa?has_content]
                            <li><a href="${cmsfn.link(cmsfn.contentById(root.sopa))}" target="_blank">Sonnenpark</a></li>
                        [/#if]
                        [#if root.blackboard?has_content]
                            <li><a href="${cmsfn.link(cmsfn.contentById(root.blackboard))}">Blackboard</a></li>
                        [/#if]
                        [#if root.facebook?has_content]
                            <li><a href="${cmsfn.externalLink(root, "facebook")}" target="_blank">Facebook</a></li>
                        [/#if]
                        [#if root.instagram?has_content]
                            <li><a href="${cmsfn.externalLink(root, "instagram")}" target="_blank">Instagram</a></li>
                        [/#if]
                    </ul>
                </div>
            </div>
            <div class="uk-grid-item-match uk-flex-middle uk-width-1-2">
                <div class="uk-panel uk-margin uk-text-right">          
                Stadtoase<br>
                Verein für Volksgesundheit Zürich<br>
                Tobelhofstrasse 21<br>
                8044 Zürich<br>
                <a href="tel:+41445339909">+41 44 533 99 09</a><br>
                <a href="mailto:info@stadtoase.ch">info@stadtoase.ch</a></span>
            </div>
          </div>
        </div>
    </div>
</div>