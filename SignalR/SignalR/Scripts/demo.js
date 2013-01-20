(function ($) {
    $.connection.hub.start()
        .done(function () { })
        .fail(function () { alert("Could not connect!"); });
    
    $.deck('.slide');

    var isChangingSlide = false;
    
    var hub = $.connection.slide;
    hub.client.goToSlide = function (slideIndex) {
        isChangingSlide = true;
        $.deck('go', slideIndex);
    };
    
    $(document).bind('deck.change', function (event, from, to) {
        if (isChangingSlide) {
            isChangingSlide = false;
        } else {
            hub.server.goToSlide(to);
        }
    });
})(jQuery);
