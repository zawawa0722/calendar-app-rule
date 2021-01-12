// import "bootstrap/dist/css/bootstrap.css";
// import "@fontawesome/fontawesome-free/css/all.css";

import { Calendar, startOfDay } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import jaLocale from "@fullcalendar/core/locales/ja";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from "@fullcalendar/list";
import bootstrapPlugin from "@fullcalendar/bootstrap";

document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");
  // var select = function(start, end, allDay) {
  //   var title = window.prompt("title");
  //   var data = {event: {title: title,
  //                       start: start.format(),
  //                       end: end.format(),
  //                       allDay: allDay}};
  //   $.ajax({
  //       type: "POST",
  //       url: "/events",
  //       data: formDate,
  //       dateType: 'json',
  //       processDate: false,
  //       success: function() {
  //           calendar.fullCalendar('refetchEvents');
  //       }
  //   });
  //   calendar.fullCalendar('unselect');
  // };

  var calendar = new Calendar(calendarEl, {
    plugins: [
      dayGridPlugin,
      interactionPlugin,
      timeGridPlugin,
      listPlugin,
      bootstrapPlugin,
    ],
    initialView: "dayGridMonth",
    headerToolbar: {
      left: "prevYear,prev,next,nextYear today",
      center: "title",
      right: "addEventButton dayGridMonth,timeGridWeek,timeGridDay listMonth",
    },
    customButtons: {
      addEventButton: {
        text: "予定の追加",
        // click: function() {
        //   ('#add-event').click(function(){
        //     ('#inputScheduleForm').fadeIn();
        //   });
        
        //   ('.close-modal').click(function(){
        //     ('#inputScheduleForm').fadeOut();
        //   });
        // }
        click: function () {
          var dateStr = prompt("予定を入力してください");
          var date = new Date(dateStr + "T00:00:00");

          if (!isNaN(date.valueOf())) {
            // valid?
            calendar.addEvent({
              title: "dynamic event",
              start: date,
              allDay: true,
            });
            alert("Great. Now, update your database...");
          } else {
            alert("Invalid date.");
          }
        },
      },
    },
    navLinks: true,
    selectable: true,
    dateClick: function (info) {
      alert("clicked " + info.dateStr);
    },
    select: function (info) {
      alert("selected " + info.startStr + " to " + info.endStr);
    },

    locale: jaLocale,
    //timezone: "Asia/Tokyo",
    height: "100vh",
    editable: true,
    defaultDate: "local",
    dayMaxEvents: true, // when too many events in a day, show the popover
    eventSources: [

      // your event source
      {
        url: '/events.json',
        method: 'POST',
        color: 'yellow',   // a non-ajax option
        textColor: 'black' // a non-ajax option
      }
  
      // any other sources...
  
    ],
    events: '/events.json',
    
  });
  calendar.render();
});
