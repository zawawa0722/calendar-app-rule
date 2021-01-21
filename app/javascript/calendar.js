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
      right: "dayGridMonth,timeGridWeek,timeGridDay listMonth",
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
    events: '/events.json',
    
  });
  calendar.render();
});
