# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  showQuiz = (video_id)->
    $.ajax(
      type: "POST"
      url: "/videos/#{video_id}/quizzes"
      success: (data) ->
        alert("wtf")
        console.log(data)
        $("#video").hide()
        $("#quiz").show()
        quiz = data[0]
        $("#quiz #prompt").text(quiz.prompt)
        for choice in quiz.choices
          $("#choices").append(
            "<button class='row-fluid btn each_choice' data-choice-id='#{choice.id}'>
              <div class='span2 choice_letter'>#{choice.choice_letter}</div>
              <div class='span8 choice_content'>#{choice.content}</div>
            </button>"
          )

    )

  $(".video_link").click(->
    video_id = $(this).attr("data-video-id")
    video_url = $(this).attr("data-video-url")
    video_title = $(this).attr("data-video-title")


    showQuiz(video_id)
    window.onYouTubePlayerReady = ->
      ytplayer = $("#ytvideo").get(0)
      ytplayer.addEventListener("onStateChange", "ytplayerStateChange")

    window.ytplayerStateChange = (state) ->
      console.log(state)
      if state==0
        showQuiz(video_id)

    swfobject.embedSWF("http://www.youtube.com/v/4TSJhIZmL0A?enablejsapi=1&version=3", "video", 840, 472, "8", null, null, {allowScriptAccess: "always"}, {id: "ytvideo"})

    $("#video-modal .modal-header h3").text(video_title)
    $("#video-modal").modal("show")
  )
)

