$(function(){
    $('#calendar').fullCalendar({
        events: '/web_api/event_objects'
    });
});
