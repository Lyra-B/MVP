$(document).ready(function(){
  setTimeout(function(){
    $('.calendar').fullCalendar( 'refetchSessions' );
  }, 20000);

  $('.assignment').find('.accept').click(function(){
    $( this ).parent().slideUp(); // removes the assignment from the DOM after it accept or decline is clicked
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