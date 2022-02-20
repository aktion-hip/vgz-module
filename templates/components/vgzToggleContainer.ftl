<div class="vgz-toggle-container">
  [#if content.containerTitle?has_content]
    <h2 class="vgz-toggle-container-button" onclick="vgzContainerToggle(this);">${content.containerTitle!}</h2>
  [/#if]
  <div class="vgz-toggle-container-area">
    [@cms.area name="toggle"/]
  </div>
</div>
