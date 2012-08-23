$(-> 
  $(".subscribe").click ->
    course_id = $(this).data("courseId")
    $.ajax(
      type: "POST"
      url: "/subscribe"
      data:
        course_id:course_id
      success:
        alert("subscribed")
    )
)

