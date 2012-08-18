# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

(->

  swfobject.embedSWF("http://www.youtube.com/watch?v=PojLL3E-zk0", "homepage-video", 840, 472, "8", null, null, {allowScriptAccess: "always"}, {id: "ytvideo"})
 )
