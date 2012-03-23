define([
    'jquery',
    'jqueryui'
], function ($) {
    var Task = function() {

    };

    Task.prototype = {
        description: '',
        appendTo: function(list) {
            var taskItem = $('<li>' + this.description + '</li>');
            list.append(taskItem);
            taskItem.effect("highlight", {}, 1500);
        }
    }

    return Task;
});
