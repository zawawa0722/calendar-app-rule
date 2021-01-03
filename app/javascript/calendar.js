// import "bootstrap/dist/css/bootstrap.css";
// import "@fontawesome/fontawesome-free/css/all.css";

import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import jaLocale from "@fullcalendar/core/locales/ja";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from "@fullcalendar/list";
import bootstrapPlugin from "@fullcalendar/bootstrap";

document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");

  var calendar = new Calendar(calendarEl, {
    plugins: [
      dayGridPlugin,
      interactionPlugin,
      timeGridPlugin,
      listPlugin,
      bootstrapPlugin,
    ],
    initialView: "dayGridMonth",
    // themeSystem: "bootstrap4",
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
    navLinkDayClick: function (date, jsEvent) {
      console.log("day", date.toISOString());
      console.log("coords", jsEvent.pageX, jsEvent.pageY);
    },
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
    // events: "https://fullcalendar.io/demo-events.json?overload-day",
    events: '/events/create.json',
  });
  calendar.render();
});
