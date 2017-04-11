var directionsService = new google.maps.DirectionsService();
var map, geocoder, marker, marker2, marker3;
var depart, arrivee, ptCheck;
var directionDisplay;
var listePointsString;

/* initialise google MAP V3 */
function init() {
	/* gestion des routes */
	directionsDisplay = new google.maps.DirectionsRenderer();
	/* intialise le geocoder pour localiser les adresses */
	geocoder = new google.maps.Geocoder();
}

function trouveRoute() {
	/* test si les variables sont bien initialisés */
	if (depart && arrivee) {
		var request = {
			origin : depart,
			destination : "Les Integrales, Bd Sebastien Brant, 67400 Illkirch-Graffenstaden",
			travelMode : google.maps.DirectionsTravelMode["DRIVING"]
		};
		/* appel à l'API pour tracer l'itinéraire */
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
				var monTrajet = response.routes[0];
				var listePoints = monTrajet.overview_path;
				var nombrePoints = listePoints.length;
				var point = listePoints[0];
				listePointsString = point.lat() + "," + point.lng();
				for (var i = 1; i < nombrePoints; i++) {
					point = listePoints[i];
					listePointsString = listePointsString + "," + point.lat()
							+ "," + point.lng();
				}
			}
		});
	}
}

function rechercher(src, src2) {
	// ptCheck = code; /*adresse de départ ou arrivée ? */
	if (geocoder) {
		geocoder
				.geocode(
						{
							'address' : document.getElementById(src).value
						},
						function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								document.getElementById(src).value = results[0].formatted_address;
								depart = results[0].formatted_address;
								/* trace la route */
							}
						});
		geocoder
				.geocode(
						{
							'address' : document.getElementById(src2).value
						},
						function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								document.getElementById(src2).value = results[0].formatted_address;
								arrivee = results[0].formatted_address;
								/* trace la route */
							}
							trouveRoute();
						});
	}
}