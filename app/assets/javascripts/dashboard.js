$(document).ready(function(){
  $("#new_session").click(function(event){
    FullcalendarEngine.Form.display();
    event.preventDefault();
  });
  $('.calendar').fullCalendar(full_calendar_options);
});



