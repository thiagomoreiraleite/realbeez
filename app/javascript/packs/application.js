import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initAutocompleteAnnonce } from '../plugins/init_autocomplete';
import { initAutocompleteProfile } from '../plugins/init_autocomplete';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import 'plugins/init_flatpickr'
// import { notificationMethod } from './notification';

initMapbox();
initAutocomplete();
initAutocompleteAnnonce();
initAutocompleteProfile();
// notificationMethod();



// NOTIFICATION
const urlPath = origin
const url = urlPath + "/notifications.json"

// GET REQUEST
fetch(url)
 .then(response => response.json())
  .then((data) => {
    // notificationStart.innerHTML = ""
    data.forEach((result) => {
      const notificationStart = document.querySelector("#notification-start")
      const notificationMessage = `<a class="dropdown-item truncate" href="${urlPath+result.url}"> ${result.actor[0].toUpperCase() + result.actor.slice(1) +" "+ result.notifiable.type}<a>`
      notificationStart.insertAdjacentHTML("beforeend", notificationMessage)

    })
    const notificationCount = document.querySelector("#count")
    const countInput = data.length
    notificationCount.insertAdjacentHTML("beforeend", countInput)
  });


// POST REQUEST
const dropdownMenuButton = document.querySelector("#dropdownMenuButton")

dropdownMenuButton.addEventListener( "click", (event) => {
  const urlMarkAsRead = event.target.baseURI + 'notifications/mark_as_read'
  console.log(event)
  console.log(urlMarkAsRead)

  const time = { read_at: Date.now };
  fetch(urlMarkAsRead, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(time)
    })
  })

// Auto refresh every 20 seconds
document.addEventListener("DOMContentLoaded", () => {
  setInterval('window.location.reload()', 20000); // Every 1 second, the `refresh` function is called.
});








