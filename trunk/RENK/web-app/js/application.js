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
});



