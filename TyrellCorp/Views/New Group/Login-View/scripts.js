



function toggleMenu(el){
    $("#triangle-up").toggleClass("turn");
    if($('#menu').hasClass("visible")){
        $('#menu').addClass("fadeOut")
        setTimeout(function () {
            $('#menu').removeClass("fadeOut")
        }, 1000);
    }
    setTimeout(function () {
        $('#menu').toggleClass("visible")
    }, 500);



}
