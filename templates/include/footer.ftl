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
                    [#if root.footer_text?has_content]
                        ${cmsfn.decode(root).footer_text}
                    [/#if]                
                </div>
            </div>
        </div>
    </div>
    <!-- Friendly Analytics -->
    <script>
    let _paq = window._paq = window._paq || [];
    /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    (function() {
        const u="https://app.friendlyanalytics.ch/";
        _paq.push(['setTrackerUrl', u+'js/tracker.php']);
        _paq.push(['setSiteId', '283']);
        const d=document
        const g=d.createElement('script')
        const s=d.getElementsByTagName('script')[0];
        g.async=true; 
        g.src=u+'js/tracker.php'; 
        s.parentNode.insertBefore(g,s);
    })();
    </script>
    <!-- End Friendly Analytics Code -->
</div>