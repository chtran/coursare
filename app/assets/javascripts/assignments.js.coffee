# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $(".choice").click(->
    $(this).addClass("btn-primary")
    $(this).siblings().removeClass("btn-primary")
  )
  
  $("#submit").click(->
    question_data = []
    for question_id in gon.questions
      choice_id = $("#question_#{question_id} .choice.btn-primary").data("choiceId")
      question_data.push({
        question_id: question_id,
        choice_id: choice_id
      })
    $.ajax({
      type: "POST",
      url: "/assignments/submit",
      data: {
        question_data: question_data,
        assignment_id: gon.assignment_id
      }
      success: (data) ->
        alert("Submited!")
    })
  )
)

