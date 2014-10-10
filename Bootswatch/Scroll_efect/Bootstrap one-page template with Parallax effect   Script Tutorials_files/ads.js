jQuery(function($){
  var js = '\
<style>\
  #bsaHolder{right: 25px;position: fixed;bottom: 25px;min-width: 180px;z-index: 10;}\
  #bsaHolder span{text-shadow:1px 1px 0 #fff;}\
  #bsap_aplink,\
  #bsap_aplink:visited{bottom: 10px;color: #aaa;font: 11px arial, sans-serif;position: absolute;right: 14px;border:none;}\
  #bsaHolder .bsa_it_p{display:none;}\
  #bsaHolder{background: -moz-linear-gradient(#F3F3F3, #FFFFFF, #F3F3F3) repeat scroll 0 0 transparent; background: -webkit-gradient(linear,0% 0%,0% 100%,color-stop(0, #f3f3f3),color-stop(0.5, #fff),color-stop(1, #f3f3f3)); background-color:#f4f4f4;\
              border-color: #fff;overflow: hidden;padding: 10px 10px 0;box-shadow: 0 0 2px #999;border-radius: 2px;}\
  #bsaHolder img{display:block;border:none;}\
  #bsa_closeAd{width:15px;height:15px;overflow:hidden;position:absolute;top:10px;right:11px;border:none !important;z-index:1;\
              text-decoration:none !important;background:url("http://www.script-tutorials.com/assets/close_icon.png") no-repeat;}\
  #bsa_closeAd:hover{background-position:left bottom;}\
</style>\
<script type="text/javascript">\
(function(){\
  var bsa = document.createElement("script");\
     bsa.type = "text/javascript";\
     bsa.async = true;\
     bsa.src = "http://s3.buysellads.com/ac/bsa.js";\
  (document.getElementsByTagName("head")[0]||document.getElementsByTagName("body")[0]).appendChild(bsa);\
})();\
</script>\
<div id="bsaHolder">\
<a id="bsa_closeAd" href="" title="Hide this ad!"></a>\
<div id="bsap_1288470" class="bsarocks bsap_b3aa54b8b4711892fe59f3c4427b7387"></div>\
</div>\
';
  $('body').prepend(js);

  $('#bsa_closeAd').click(function(){
    $(this).parent().remove();
    return false;
  });
});