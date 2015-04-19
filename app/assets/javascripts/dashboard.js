$(document).ready(function(){
  $("#new_session").click(function(event){
    FullcalendarEngine.Form.display();
    event.preventDefault();
  });
  //set additional options for sessions
  var options = {
    sessionRender: function(session, element) {
      element.data("session_id", session.id);
    }
  };
  //include these options to the gem's settings
  $.extend(full_calendar_options, options);
  $('.calendar').fullCalendar(full_calendar_options);

  // wrap ul element
  var coaches = $("#drop1");

  //make every coach draggable
  $("li", coaches).draggable({
    revert: "invalid", // the object goes back to default position if not dropped
    helper: "clone", // duplicates the element to use in both places
    start: function(event, ui){
      var sessions = $(".fc-session"); // sessions
      var coachId = $(this).data("coach-id");
      console.log("hello");
      sessions.droppable({
        accept: "#drop1 > li",
        activeClass: "ui-state-highlight",
        drop: function(event, ui) {
          // console.log("");
          var sessionId = $(this).data("session_id");
          $.ajax({
            method:"PUT",
            url: "/calendar/sessions/" + sessionId + "/assign_coach/" + coachId,
            success: function(){
              alert("Dropped");
            }
          });
        }
      });
    }


  });

});





