$(document).ready(function(){
  $('.assignment').find('.accept').click(function(){
    $( this ).parent().slideUp();
    $('.calendar').fullCalendar( 'refetchSessions' );
  });

  $('.assignment').find('.decline').click(function(){
    $( this ).parent().slideUp();
    $('.calendar').fullCalendar( 'refetchSessions' );
  });
});