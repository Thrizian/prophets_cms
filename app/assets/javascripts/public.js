function makeVisible(toggleElement) {
    var e = document.getElementById(toggleElement);
    if (e.style.opactiy != '1') {
        e.style.opacity = '1';
    }
};

function makeHidden(toggleElement) {
    var e = document.getElementById(toggleElement);
    if (e.style.opacity != '0') {
        e.style.opacity = '0';
    }
};
//
// $("nav-container").mouseout(function(){
//     $('navigation').css('visibility', 'hidden');
// });
// $("full-animation").mouseover(function(){
//     $('navigation').css('visibility', 'visible');
// });
// $( ".menu-link" ).click(function() {
//     $('waiter').removeClass( "unclicked" ).addClass('clicked');
// $('content').attr('z-index', '-2');
// $('navigation').delay( 120 ).css('visibility', 'visible');
// });
// $("waiter").click(function() {
//   $("waiter").removeClass( "clicked" ).addClass('unclicked');
// $('content').attr('z-index', '-2');
// $('navigation').delay( 120 ).css('visibility', 'visible');
// });

