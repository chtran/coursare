# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $(".video_link").click(->
    video_url = $(this).attr("data-video-url")
    video_title = $(this).attr("data-video-title")
    $("#video .modal-body").html(
      "<iframe width='840' height='472' src='#{video_url}' frameborder='0' allowfullscreen></iframe>"
    )
    $("#video .modal-header h3").text(video_title)
    $("#video").modal("show")
  )
)

