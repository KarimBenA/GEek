var directionsService = new google.maps.DirectionsService(); // service
// GoogleMaps
var map, geocoder, marker, marker2, marker3; // La carte, le service de
// géocodage et les
// marqueurs
var depart, arrivee, ptCheck; // point de départ, arrivé et de vérification
var directionDisplay;
var listePointsString;

/* initialise google MAP V3 */
function init() {
	/* gestion des routes */
	directionsDisplay = new google.maps.DirectionsRenderer();
	/* emplacement par défaut de la carte (Toulouse) */
	var maison = new google.maps.LatLng(48.5223562, 7.7389103);
	/* option par défaut de la carte */
	var myOptions = {
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		center : maison
	}
	/* creation de la map */
	map = new google.maps.Map(document.getElementById("divMap"), myOptions);
	/* connexion de la map + le panneau de l'itinéraire */
	directionsDisplay.setPanel(document.getElementById("divRoute"));
	directionsDisplay.setMap(map);
	/* intialise le geocoder pour localiser les adresses */
	geocoder = new google.maps.Geocoder();
}

function trouveRoute() {
	/* test si les variables sont bien initialisés */
	if (depart && arrivee) {
		var request = {
			origin : depart,
			destination : arrivee,
			travelMode : google.maps.DirectionsTravelMode["DRIVING"]
		};
		/* appel à l'API pour tracer l'itinéraire */
		directionsService.route(request,
				function(response, status) {
					var itineraire;
					if (status == google.maps.DirectionsStatus.OK) {
						directionsDisplay.setDirections(response);
						var monTrajet = response.routes[0];
						var listePoints = monTrajet.overview_path;
						var nombrePoints = listePoints.length;
						var point = listePoints[0];
						listePointsString = point.lat() + "," + point.lng();
						for (var i = 1; i < nombrePoints; i++) {
							point = listePoints[i];
							listePointsString = listePointsString + ","
									+ point.lat() + "," + point.lng();
						}
						console.log("ListePointsString = ");
						console.log(listePointsString);
						console.log("Longueur du String");
						console.log(listePointsString.length);
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
								/*
								 * on remplace l'adresse par celle fournie du
								 * geocoder
								 */
								document.getElementById(src).value = results[0].formatted_address;
								depart = results[0].geometry.location;
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
								/*
								 * on remplace l'adresse par celle fournie du
								 * geocoder
								 */
								document.getElementById(src2).value = results[0].formatted_address;
								arrivee = results[0].geometry.location;
								/* trace la route */
							}
							trouveRoute();
						});
	}
}

function marquer(srcBis) {
	if (geocoder) {
		geocoder
				.geocode(
						{
							'address' : document.getElementById(srcBis).value
						},
						function(results, status) {
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
								 * on remplace l'adresse par celle fournie du
								 * geocoder
								 */
								document.getElementById(srcBis).value = results[0].formatted_address;
							}
						});
	}
}