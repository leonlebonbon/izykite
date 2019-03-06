import "bootstrap";
import "../plugins/flatpickr";
// import "../search/search";
// import "../search/xp-address";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from "../plugins/init_autocomplete"
initAutocomplete()
initMapbox();
