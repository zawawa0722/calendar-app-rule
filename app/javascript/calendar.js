// import "bootstrap/dist/css/bootstrap.css";
// import "@fontawesome/fontawesome-free/css/all.css";

import { Calendar, startOfDay } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin, { Draggable } from "@fullcalendar/interaction";
import jaLocale from "@fullcalendar/core/locales/ja";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from "@fullcalendar/list";
import bootstrapPlugin from "@fullcalendar/bootstrap";
import '@fullcalendar/common/main.css'
import '@fullcalendar/daygrid/main.css'

document.addEventListener("DOMContentLoaded", function () {
  let calendarEl = document.getElementById("calendar");
  let draggableEl = document.getElementById('mydraggable');
  let calendar = new Calendar(calendarEl, {
    plugins: [
      dayGridPlugin,
      interactionPlugin,
      timeGridPlugin,
      listPlugin,
      bootstrapPlugin,
    ],
    draggable: true,
    initialView: "dayGridMonth",
    headerToolbar: {
      left: "prevYear,prev,next,nextYear today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,timeGridDay listMonth",
    },
    navLinks: true,
    selectable: true,
    // dateClick: function (info) {
    //   alert("clicked " + info.dateStr);
    // },
    // select: function (info) {
    //   alert("selected " + info.startStr + " to " + info.endStr);
    // },

    locale: jaLocale,
    //timezone: "Asia/Tokyo",
    height: "100vh",
    editable: true,
    // defaultDate: "local",
    dayMaxEvents: true,
    events: '/events.json',
    eventDisplay: 'block'
  });
  
  calendar.render();

  new Draggable(draggableEl);

});
