function initMap() {
  // --- <<<<<<<< --- Definiendo Variables --- >>>>>>>> ---
  let directionsService = new google.maps.DirectionsService();
  let directionsRenderer = new google.maps.DirectionsRenderer();
  let center = new google.maps.LatLng(10.39698, - 75.50265)
  let start = document.getElementById("start");
  let end = document.getElementById("end");

  
  // --- <<<<<<<< --- Cree un cuadro delimitador con lados a ~150 km de distancia del punto central --- >>>>>>>> ---
  const defaultBounds = {
    north: center.lat + 0.15,
    south: center.lat - 0.15,
    east: center.lng + 0.15,
    west: center.lng - 0.15,
  };
  const startP = document.getElementById("start_p");
  const endP = document.getElementById("end_p");
  const options = {
    bounds: defaultBounds,
    componentRestrictions: { country: "co" },
    fields: ["address_components", "geometry", "icon", "name"],
    strictBounds: false,
  };

  const autocomplete = new google.maps.places.Autocomplete(startP, options);
  const autocomplete2 = new google.maps.places.Autocomplete(endP, options);

  autocomplete.setComponentRestrictions({
    country: ["co","mx"],
  });

  autocomplete2.setComponentRestrictions({
    country: ["co", "mx"]
  })

  // --- <<<<<<<< --- creando el mapa --- >>>>>>>> ---
  const map = new google.maps.Map(document.getElementById("map"), {
    center: center,
    zoom: 12,
    mapTypeControl: false,
  });

  // --- <<<<<<<< --- Autocompletador de lugares para el buscador --- >>>>>>>> ---
  
  autocomplete.bindTo("bounds", map);

  autocomplete.addListener("place_changed", () => {

    const info = new google.maps.place.PlaceResult()
    const place = autocomplete.getPlace(info);

    if (!place.geometry || !place.geometry.location) {return;}

  });

  // --- <<<<<<<< --- Marca en el mapa la ruta --- >>>>>>>> ---
  const {DistanceMatrixElementStatus} = google.maps.importLibrary("routes")
  directionsRenderer.setMap(map);
  const dista = DirectionsRoutes();
  console.log(DistanceMatrixElementStatus);
  // directionsRenderer.setPanel(document.getElementById("directionsPanel"));
  const request = {
    origin: start.innerHTML,
    destination: end.innerHTML,
    travelMode: 'DRIVING',
    // unitySystem: google.maps.UnitySystem.METRIC
  };
  directionsService.route(request, response => {
    directionsRenderer.setDirections(response);
  });

};


//  -------------

/**
 * Bocagrande             lat : 10.4101185, lng : -75.5505696.
 * Crespo                 Lat : 10.4454451, Lng : -75.5176517. 
 * Ciudad Amurallada      lat : 10.4231546, lng : -75.55021649999999.
 * Castillo Grande        lat : 10.3942723, lng : -75.55168789999999.
 * Manga                  Lat : 10.4119699, Lng : -75.5349485.
 * La Boquilla            Lat : 10.471126,  lng : -75.49687.
 * Marbella               Lat : 10.4357484, lng : -75.536103.
 * Mamonal                Lat : 10.31258,   Lng : -75.50099.
 */