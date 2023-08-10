let map;
function initMap() {
  // Esta parte es para imprimir el mapa
  let ciudad = new google.maps.LatLng(10.39698, - 75.50265)
  map = new google.maps.Map(document.getElementById("map"), {
    center: ciudad,
    zoom: 11,
  });


  // Esta parte del codigo sirve para ingresar la ruta con la API Directions
  const directionsService = new google.maps.DirectionsService();
  const directionsRenderer = new google.maps.DirectionsRenderer();
  let start = document.getElementById('start').innerHTML;
  let end = document.getElementById('end').innerHTML;
  directionsRenderer.setMap(map);
  const request = {
    origin: start,
    destination: end,
    travelMode: 'DRIVING'
  };
  directionsService.route(request, response => {
    directionsRenderer.setDirections(response);
  });

};