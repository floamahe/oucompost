// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers"
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import { initChatroomCable } from '../channels/chatroom_channel';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  if (document.querySelector("#map")) initMapbox();
  if (document.querySelector("#search_query") || document.querySelector("#garden_address")) initAutocomplete();
  if (document.querySelector("#appointment_date")) initFlatpickr();

  const calendarEl = document.querySelector('.gardenCalendar');
  if (calendarEl) {
    const events = JSON.parse(calendarEl.dataset.events)
    const calendar = new Calendar(calendarEl, {
      plugins: [dayGridPlugin],
      events: events,
      firstDay: 1,
      eventOrder: "start"
      });
      calendar.render();
  }
  initChatroomCable();
});
