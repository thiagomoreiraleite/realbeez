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
import { notificationMethod } from './notification';
import { initStarRating } from '../plugins/init_star_rating';

initMapbox();
initAutocomplete();
initAutocompleteAnnonce();
initAutocompleteProfile();
notificationMethod();
initStarRating();

 const urlPath = origin
  const url = urlPath + "/conversations.json"

  // GET REQUEST
  fetch(url)
   .then(response => response.json())
    .then((data) => {
      console.log(data)
      console.log(data.length)
      // notificationStart.innerHTML = ""
      // data.forEach((result) => {
      //   const notificationStart = document.querySelector("#notification-start")
      //   const notificationMessage = `<a class="dropdown-item truncate" style="color:rgba(0, 0, 0, 0.5);" href="${urlPath+result.url}"> ${result.actor[0].toUpperCase() + result.actor.slice(1) +" "+ result.notifiable.type}<a>`
      //   notificationStart.insertAdjacentHTML("beforeend", notificationMessage)

      // })
      const messageCount = document.querySelector("#message-count")
      const countInput = data.length
      messageCount.insertAdjacentHTML("beforeend", countInput)
    });








