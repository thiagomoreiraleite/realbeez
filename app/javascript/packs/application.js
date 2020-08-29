import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initAutocompleteAnnonce } from '../plugins/init_autocomplete';
import { initAutocompleteProfile } from '../plugins/init_autocomplete';
import { initAutocompleteProfileVille } from '../plugins/init_autocomplete';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import 'plugins/init_flatpickr'
import { notificationMethod } from './notification';
import { messageMethod } from './message';
import { initStarRating } from '../plugins/init_star_rating';
import { ajouterLocataire } from './locataire';
import { supprimerLocataire } from './locataire';
import { ajouterDocument } from './document';
import { supprimerDocument } from './document';

initMapbox();
initAutocomplete();
initAutocompleteAnnonce();
initAutocompleteProfile();
initAutocompleteProfileVille();
notificationMethod();
messageMethod();
initStarRating();
ajouterLocataire();
supprimerLocataire();
ajouterDocument();
supprimerDocument();

// Auto refresh every 10 seconds
// document.addEventListener("DOMContentLoaded", () => {
// setInterval('window.location.reload(false)', 1000);
// });


const emailProprio = document.querySelector("#email_proprio")





