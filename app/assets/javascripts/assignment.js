$(document).ready(function(){
  $('.assignment').find('.accept').click(function(){
    $( this ).parent().slideUp();
    setTimeout(function(){
      $('.calendar').fullCalendar( 'refetchSessions' );
    }, 3000);

  });

  $('.assignment').find('.decline').click(function(){
    $( this ).parent().slideUp();
    setTimeout(function(){
      $('.calendar').fullCalendar( 'refetchSessions' );
    }, 3000);

  });
});