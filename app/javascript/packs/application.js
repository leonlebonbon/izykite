import "bootstrap";
import "../plugins/flatpickr";
// import "../search/search";
// import "../search/xp-address";

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { updatePrice } from '../plugins/booking';
import { initSweetalert } from '../plugins/init_sweetalert'
import { loadDynamicBannerText } from '../plugins/banner';

if(document.getElementById("booking_number_of_kiters")){
 updatePrice();
}

initSweetalert();
initAutocomplete();
initMapbox();
loadDynamicBannerText();
