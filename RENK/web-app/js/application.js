if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}

$(document).ready(function() {
    $('.form-group select').addClass("form-control");


    $(window).resize(function() {
        drawChart();
    });
    
    $('[data-toggle]').on('click',function(){
        var target = $(this).attr('data-toggle');
        $(target).toggle(300);
        $(this).toggleClass('active');
    });
    
});
