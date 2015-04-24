$(document).ready(function(){
  $("#new_session").click(function(event){
    FullcalendarEngine.Form.display();
    event.preventDefault();
  });

  // refresh the sessions constantly so as to monitor state changes
  setInterval(function(){
    $('.calendar').fullCalendar( 'refetchSessions' );
  }, 30000);

  //set additional options for sessions
  var options = {
    sessionRender: function(session, element) {
      element.data("session_id", session.id);
      element.data("coach_id", session.coachId);
      element.data("coach", session.coach);
      element.css({backgroundColor: session.color});
      element.find('.fc-session-inner').append("<div id='fc-session-coach-name'> Assigned to:" + session.coach + "</div>");
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
      var coachId = $(this).data("coach-id"); //retrieve coach id from the data attribute
      coachFirstName = $(this).data("firstname");
      coachLastName = $(this).data("lastname");

      sessions.droppable({
        accept: "#drop1 > li",
        activeClass: "ui-state-highlight",
        drop: function(event, ui) {
          var _this = this;
          var sessionId = $(this).data("session_id"); //retrieve session id from the data attribute
          var sessionCoachId = $(this).data("coach_id");
          var load_modal = function(message){
            $('#assign-modal').find(".content").replaceWith("<h2 class='content'>" + message + "</h2>");
          };
          $.ajax({
            method:"PUT",
            url: "/calendar/sessions/" + sessionId + "/assign_coach/" + coachId, //the url derives from routes nesting of the sessions
            success: function(response){
              //Check coach availability
              if(response === true){ // response decides about the availability of a coach
                load_modal("Successfully assigned session to " + coachFirstName + " " + coachLastName);
              }
              else {
                if(coachId == sessionCoachId) {
                  load_modal(coachFirstName + " " + coachLastName + " is already assigned to this session!");
                }
                else {
                  load_modal(coachFirstName + " " + coachLastName + " is not available at this period");
                }
              }
              $('a.reveal-link').trigger('click');
              $('.calendar').fullCalendar( 'refetchSessions' );
              //refetch sessions so as to see the state of the session just assigned to a coach
            }
          });
        }
      });
    }
  });
  $('.fc-header-title').hide(); // hid the title in favor of design
});





