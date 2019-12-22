$("#animator").mouseover(function(){
    $('#navigation').css('visibility', 'visible');
});
$("#nav-container").mouseout(function(){
    $('#navigation').css('visibility', 'hidden');
});
$("#full-animation").mouseover(function(){
    $('#navigation').css('visibility', 'visible');
});
$( ".menu-link" ).click(function() {
    $('#waiter').removeClass( "unclicked" ).addClass('clicked');
$('#content').attr('z-index', '-2');
$('#navigation').delay( 120 ).css('visibility', 'visible');
});
$("#waiter").click(function() {
  $("#waiter").removeClass( "clicked" ).addClass('unclicked');
$('#content').attr('z-index', '-2');
$('#navigation').delay( 120 ).css('visibility', 'visible');
});

