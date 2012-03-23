requirejs.config({
    paths: {
        'jquery' : 'https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min',
        'jqueryui' : 'https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min'
    },
    priority: ['jquery']
});

require(['jquery', 'tasks/manager'], function($, manager) {
    $(function() {
        $('#addTask').on('keypress', function(event) {
            if(event.which == 13) {
                manager.addTask($(this).val());
                $(this).val('');
            }
        });
    });
});
