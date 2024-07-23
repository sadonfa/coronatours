function initMap() {
  // --- <<<<<<<< --- Definiendo Variables --- >>>>>>>> ---
  let directionsService = new google.maps.DirectionsService();
  let directionsRenderer = new google.maps.DirectionsRenderer();

  let directionsServiceRet = new google.maps.DirectionsService();
  let directionsRendererRet = new google.maps.DirectionsRenderer();

  let center = new google.maps.LatLng(10.39698, - 75.50265)
  let start = document.getElementById("start");
  let end = document.getElementById("end");
  let start_ret = document.getElementById("start_ret");
  let end_ret = document.getElementById("end_ret");


  // --- <<<<<<<< --- Cree un cuadro delimitador con lados a ~150 km de distancia del punto central --- >>>>>>>> ---
  const defaultBounds = {
    north: center.lat + 0.15,
    south: center.lat - 0.15,
    east: center.lng + 0.15,
    west: center.lng - 0.15,
  };
  const start_a = document.getElementById("start_a")
  const start_b = document.getElementById("start_b")
  const start_b2 = document.getElementById("start_b2")
  const start_c = document.getElementById("start_c")
  const end_a = document.getElementById("end_a");
  const end_b = document.getElementById("end_b");
  const end_b2 = document.getElementById("end_b2");
  const end_c = document.getElementById("end_c");
  const options = {
    bounds: defaultBounds,
    componentRestrictions: { country: "co" },
    fields: ["address_components", "geometry", "icon", "name"],
    strictBounds: false,
  };

  const autocomplete_a = new google.maps.places.Autocomplete(start_a, options);
  const autocomplete_b_1 = new google.maps.places.Autocomplete(start_b, options);
  const autocomplete_b_2 = new google.maps.places.Autocomplete(start_b2, options);
  const autocomplete_c = new google.maps.places.Autocomplete(start_c, options);

  const autocomplete_a2 = new google.maps.places.Autocomplete(end_a, options);
  const autocomplete_b2_1 = new google.maps.places.Autocomplete(end_b, options);
  const autocomplete_b2_2 = new google.maps.places.Autocomplete(end_b2, options);
  const autocomplete_c2 = new google.maps.places.Autocomplete(end_c, options);

  autocomplete_a.setComponentRestrictions({
    country: ["co", "mx"],
  });
  autocomplete_b_1.setComponentRestrictions({
    country: ["co", "mx"],
  });
  autocomplete_b_2.setComponentRestrictions({
    country: ["co", "mx"],
  });
  autocomplete_c.setComponentRestrictions({
    country: ["co", "mx"],
  });


  autocomplete_a2.setComponentRestrictions({
    country: ["co", "mx"]
  })
  autocomplete_b2_1.setComponentRestrictions({
    country: ["co", "mx"]
  })
  autocomplete_b2_2.setComponentRestrictions({
    country: ["co", "mx"]
  })
  autocomplete_c2.setComponentRestrictions({
    country: ["co", "mx"]
  })

  // --- <<<<<<<< --- creando el mapa --- >>>>>>>> ---
  const map = new google.maps.Map(document.getElementById("map"), {
    center: center,
    zoom: 12,
    mapTypeControl: false,
  });


  // --- <<<<<<<< --- Autocompletador de lugares para el buscador --- >>>>>>>> ---

  autocomplete_a.bindTo("bounds", map);

  autocomplete_a.addListener("place_changed", () => {

    const info = new google.maps.place.PlaceResult()
    const place = autocomplete_a.getPlace(info);

    if (!place.geometry || !place.geometry.location) { return; }

  });

  // --- <<<<<<<< --- Marca en el mapa la ruta --- >>>>>>>> ---
  directionsRenderer.setMap(map);
  const request = {
    origin: start.innerHTML,
    destination: end.innerHTML,
    travelMode: 'DRIVING',
  };
  directionsService.route(request, response => {
    directionsRenderer.setDirections(response);
    showSteps(response)
  });

  directionsRendererRet.setMap(map2);
  const request_ret = {
    origin: start_ret.innerHTML,
    destination: end_ret.innerHTML,
    travelMode: 'DRIVING',
  };

  directionsServiceRet.route(request_ret, responseRet => {
    directionsRendererRet.setDirections(response);
    showStepsRet(responseRet)
  });

};

function showSteps(directionResult) {
  const myRoute = directionResult.routes[0].legs[0];
  let distance = myRoute.distance
  let duration = myRoute.duration
  const dista = document.getElementById("distanceId").innerHTML = distance.value;
  const durat = document.getElementById("durationId").value = duration.value;
  const d_distancia = document.getElementById("distancia-d").innerHTML = distance.text;
  const d_duracion = document.getElementById("duracion-d").innerHTML = duration.text;
  // element.innerHTML = dista



  if (typeof (Storage) !== "undefined") {
    localStorage.setItem("distancia", dista);

  } else {
    console.log("LocalStorage no soportado en este navegador")
  }

  const ti = localStorage.getItem("distancia");
  const test = document.getElementById("v-store").value = ti;
  console.log(test);
  console.log(distance);
  console.log(dista);
  console.log(durat);
}



function showStepsRet(directionResult) {
  const myRoute = directionResult.routes[0].legs[0];
  let distance = myRoute.distance
  let duration = myRoute.duration
  let dista = document.getElementById("distanceIdRet").innerHTML = distance.value;
  let durat = document.getElementById("durationIdRet").value = duration.value;
  const d_distancia = document.getElementById("distancia_ret").innerHTML = distance.text;
  const d_duracion = document.getElementById("duracion_ret").innerHTML = duration.text;
  // element.innerHTML = dista

  console.log(dista)
  console.log(distance)
  console.log(d_distancia)
  
  if (typeof (Storage) !== "undefined") {
    localStorage.setItem("distancia", dista);

  } else {
    console.log("LocalStorage no soportado en este navegador")
  }

  const ti = localStorage.getItem("distancia");
  const test = document.getElementById("v-store").value = ti;
  console.log(test);
  console.log(distance);
  console.log(dista);
  console.log(durat);
}