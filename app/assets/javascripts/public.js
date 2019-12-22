function makeVisible(firstElement, secondElement) {
    var f = document.getElementById(firstElement);
    var s = document.getElementById(secondElement);
    if (f.style.opactiy != '1') {
        f.style.opacity = '1';
    }
    if (s.style.opactiy != '1') {
        s.style.opacity = '1';
    }
};

function makeHidden(firstElement, secondElement) {
    var f = document.getElementById(firstElement);
    var s = document.getElementById(secondElement);
    if (f.style.opactiy != '0') {
        f.style.opacity = '0';
    }
    if (s.style.opactiy != '0') {
        s.style.opacity = '0';
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

