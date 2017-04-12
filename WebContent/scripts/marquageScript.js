var directionsService = new google.maps.DirectionsService(); // service
// GoogleMaps
var map, geocoder, marker, marker2, marker3; // La carte, le service de
// géocodage et les
// marqueurs
var depart, arrivee, ptCheck; // point de départ, arrivé et de vérification
var directionDisplay;

/* initialise google MAP V3 */
function init() {
	/* gestion des routes */
	directionsDisplay = new google.maps.DirectionsRenderer();
	/* emplacement par défaut de la carte (Toulouse) */
	var markedMap = new google.maps.LatLng(marquage);
	/* option par défaut de la carte */
	var myOptions = {
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		center : markedMap
	}
	/* creation de la map */
	map = new google.maps.Map(document.getElementById("divMap"), myOptions);
	directionsDisplay.setMap(map);
	/* intialise le geocoder pour localiser les adresses */
	geocoder = new google.maps.Geocoder();
}

function marquer(srcBis) {
	if (geocoder) {
		geocoder.geocode({
			'address' : "Paris"
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				/* ajoute un marqueur à l'adresse choisie */
				map.setCenter(results[0].geometry.location);
				if (marker) {
					marker.setMap(null);
				}
				marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				/*
				 * on remplace l'adresse par celle fournie du geocoder
				 */
				// document.getElementById(srcBis).value =
				// results[0].formatted_address;
				marquage = results[0].geometry.location;
			}
		});
	}
}