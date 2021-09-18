<div class="text-section">  
  <div class="vgzBox ${content.alarm?then('vgzAlarm', '')}">
    [#if content.text?has_content]
        ${cmsfn.decode(content).text!}
    [/#if]
  </div>
</div>
