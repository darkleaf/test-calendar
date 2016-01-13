$(function(){
    $('#calendar').fullCalendar({
        lang: 'ru',
        events: '/web_api/event_objects'
    });
});
