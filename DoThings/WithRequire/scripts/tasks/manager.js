define([
    'jquery',
    'tasks/task'
], function ($, Task) {
    $('#taskList').sortable({
       axis: 'y',
       containment: 'window',
       update: function() {
       }
    });
    return {
        addTask: function(description) {
            var task = new Task();
            task.description = description;
            task.appendTo($('#taskList'));
        }
    }
});
