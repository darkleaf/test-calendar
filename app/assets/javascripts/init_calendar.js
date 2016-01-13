$(function(){
    var $calendar = $('#calendar');
    var FILTER_ALL = 'all';
    var FILTER_MY = 'my';
    $calendar.fullCalendar({
        lang: 'ru',
        events: '/web_api/event_objects',

        customButtons: {
            allEvents: {
                text: 'Все события',
                click: function() {
                    $calendar.data('filter', FILTER_ALL);
                    $calendar.fullCalendar('rerenderEvents');
                }
            },
            myEvents: {
                text: 'Мои события',
                click: function() {
                    $calendar.data('filter', FILTER_MY);
                    $calendar.fullCalendar('rerenderEvents');
                }
            }
        },
        header: {
            left: 'title ',
            center: 'allEvents myEvents',
            right: 'today prev,next'
        },
        eventRender: function(event, element, view) {
            var filterValue = $calendar.data('filter');
            if (filterValue == FILTER_MY) {
                const user_id = $calendar.data('user-id');
                return event.user_id == user_id;
            } else {
                return true;
            }
        }
    });
});
