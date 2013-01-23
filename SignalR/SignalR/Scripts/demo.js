(function ($) {
    $('body').on('touchmove', function (e) {
        e.preventDefault(); // avoid iPad bouncing during slideshow
    });

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

    var isShowDraw = false;
    $('#drawbox').on('show hide', function (event) {
        if (isShowDraw) {
            isShowDraw = false;
        } else {
            hub.server.showDraw(event.type);
        }
    });

    hub.client.showDraw = function (action) {
        isShowDraw = true;
        $('#drawbox').modal(action);
    };

    var clickX = new Array();
    var clickY = new Array();
    var clickDrag = new Array();
    var isPainting;

    var canvas = $('#canvas');
    var context = canvas[0].getContext('2d');

    function addClick(x, y, isDragging) {
        addClickInternal(x, y, isDragging);
        hub.server.addClick(x, y, isDragging);
    }
    
    function addClickInternal(x, y, isDragging) {
        clickX.push(x);
        clickY.push(y);
        clickDrag.push(isDragging);
    }

    hub.client.addClick = function (x, y, isDragging) {
        isPainting = false;
        addClickInternal(x, y, isDragging);
        redraw();
    };

    canvas.on('mousedown touchstart', function (e) {
        isPainting = true;

        var coordinates = getCoordinates(e);
        addClick(coordinates.x, coordinates.y, false);
        redraw();
    });
    
    function getCoordinates(e) {
        var x = e.offsetX;
        var y = e.offsetY;

        var originalEvent = e.originalEvent;
        if (originalEvent.targetTouches) {
            x = originalEvent.targetTouches[0].pageX - canvas.offset().left;
            y = originalEvent.targetTouches[0].pageY - canvas.offset().top;
        }

        return { x: x, y: y };
    }
    
    canvas.on('mousemove touchmove', function (e) {
        e.preventDefault(); // Keep the iPad from elastic scrolling
        if (isPainting) {
            var coordinates = getCoordinates(e);
            addClick(coordinates.x, coordinates.y, true);
            redraw();
        }
    });

    canvas.on('mouseup touchend', function (e) {
        isPainting = false;
    });
    
    canvas.on('mouseleave touchcancel', function (e) {
        isPainting = false;
    });
    
    function redraw() {
        context.clearRect(0, 0, canvas.width(), canvas.height());

        context.strokeStyle = "#df4b26";
        context.lineJoin = "round";
        context.lineWidth = 5;

        context.beginPath();
        for (var i = 0; i < clickX.length; i++) {
            if (clickDrag[i] && i) {
                context.moveTo(clickX[i - 1], clickY[i - 1]);
            } else {
                context.moveTo(clickX[i] - 1, clickY[i]);
            }
            context.lineTo(clickX[i], clickY[i]);
        }
        context.stroke();
    }

    hub.client.clearCanvas = function () {
        clickX = new Array();
        clickY = new Array();
        clickDrag = new Array();
        redraw();
    };

    $(window).on('shake', function (e) {
        hub.server.clearCanvas();
    });
})(jQuery);
