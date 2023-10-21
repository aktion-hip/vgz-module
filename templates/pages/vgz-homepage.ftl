<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]

    [#include "../include/functions.ftl"]
    [#include "../include/macros.ftl"]
    [#include "../include/head.ftl"]
    [#include "../include/search.ftl"]

    [#assign site = sitefn.site()!]
    [#assign theme = sitefn.theme(site)!]
    [#list theme.cssFiles as cssFile]
        [#if cssFile.conditionalComment?has_content]<!--[if ${cssFile.conditionalComment}]>[/#if]
          <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
        [#if cssFile.conditionalComment?has_content]<![endif]-->[/#if]
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
    [#assign img_interval = (content.imagesInterval!10)]
    <style>
      .vgz-fading {
        animation: vgz_fading ${img_interval}s infinite;
      }
      @keyframes vgz_fading { 0%{opacity:0} 20%{opacity:1} 80%{opacity:1} 100%{opacity:0} }
    </style>
  </head>
  <body class="vgz-homepage ${cmsfn.language()}">
    <div class="tm-page">
      [#include "../include/navigation.ftl"]
      [@vgzLogo true /]

      <!-- load homepage images -->
      <div class="vgz-home-div-bgr">        
      [#list content.images as bgrImg ]
        [#attempt]
          <img class="vgz-home-img vgz-fading" src="${damfn.getAssetLink(bgrImg)}">
        [#recover]
          <p>Not all background images published!</p>
        [/#attempt]
      [/#list]
      </div>

      [#include "../include/footer.ftl"]
    </<div>
    <!-- Alarm -->
    [#if content.alarm_text?has_content]
      <div id="modalInfo" class="uk-flex-top uk-modal uk-flex uk-open" uk-modal="">
        <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
          <button class="uk-modal-close-default uk-icon uk-close" type="button" uk-close=""><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><line fill="none" stroke="#000" stroke-width="1.1" x1="1" y1="1" x2="13" y2="13"></line><line fill="none" stroke="#000" stroke-width="1.1" x1="13" y1="1" x2="1" y2="13"></line></svg></button>
          <p>${cmsfn.decode(content).alarm_text}</p>
        </div>
      </div>      
    [/#if]
  </body>
  <script>
    document.addEventListener("DOMContentLoaded", e => {
      // set logo's z-index
      const logo = document.querySelector(".imgLogo");
      logo.style["z-index"] = 10;
      // initialize image change
      const interval = ${(content.imagesInterval!10)} * 1000;
      const imageElements = document.querySelectorAll("img.vgz-home-img");
      const indices = shuffle(Array(imageElements.length).fill().map((_, idx) => idx));
      const current = imageElements[indices[0]];
      current.style.display = "block";
      // display images (recursive call of changeImage())
      changeImage(imageElements, indices, interval, 0);
    });

    function changeImage(imageElements, indices, interval, index) {
      const current = imageElements[indices[index]];
      current.style.display = "none";
      var pointer = ++index % indices.length;
      const next = imageElements[indices[pointer]];
      next.style.display = "block";
      setTimeout(changeImage, interval, imageElements, indices, interval, pointer);
    };
    
    function shuffle(array) {
      var curId = array.length;
      while (0 !== curId) {
        var randId = Math.floor(Math.random() * curId);
        curId -= 1;
        var tmp = array[curId];
        array[curId] = array[randId];
        array[randId] = tmp;
      }
      return array;
    };
  </script>
</html>
