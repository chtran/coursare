# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  showQuiz = (quiz_id)->
    if quiz_id
      $.ajax(
        type: "GET"
        url: "/quizzes/#{quiz_id}"
        success: (data) ->
          $("#video").hide()
          $("#quiz").html(data).show()
          $(".choices").addClass("active")
          $("#confirm").show()
      )

  showExplanation = (correct_id,chosen_id) ->
    $(".choice").addClass("disabled").removeClass("btn-primary")
    $(".choice[data-choice-id=#{chosen_id}]").addClass("btn-danger")
    $(".choice[data-choice-id=#{correct_id}]").addClass("btn-success")

  $(".active .choice").live("click",->
    $(this).siblings().removeClass("btn-primary")
    $(this).addClass("btn-primary")
  )

  $("#confirm").live("click",->
    $("#choices").removeClass("active")
    $("#confirm").hide()
    quiz_choice_id = $(".choice.btn-primary").data("choiceId")
    $.ajax(
      type: "POST"
      data:
        quiz_choice_id: quiz_choice_id
      url: "/quizzes/confirm"
      success: (data) ->
        showExplanation(data.correct_id,data.chosen_id)
        if window.quiz_stack.length>0
          $("#next").show()
    )
  )

  $("#next").live("click", ->
    showQuiz(window.quiz_stack.pop())
  )

  $(".video-link").click(->
    video_id = $(this).data("videoId")
    video_url = $(this).data("videoUrl")
    video_title = $(this).data("videoTitle")
    window.quiz_stack = $(this).data("videoQuizzes")


    window.onYouTubePlayerReady = ->
      ytplayer = $("#video").get(0)
      ytplayer.addEventListener("onStateChange", "ytplayerStateChange")

    window.ytplayerStateChange = (state) ->
      if state==0
        showQuiz(window.quiz_stack.pop())

    swfobject.embedSWF("http://www.youtube.com/v/#{video_url}?enablejsapi=1&version=3", "video", 840, 472, "8", null, null, {allowScriptAccess: "always"}, {id: "video"})

    $("#video-modal .modal-header h3").text(video_title)
    $("#video-modal").modal("show")
  )

  $("#video-modal").on("hidden", ->
    $("#video").empty()
    $("#quiz").empty()
    $(this).find("h3").empty()
  )
)

