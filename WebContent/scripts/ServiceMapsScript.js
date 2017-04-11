// service GoogleMaps
var directionsService = new google.maps.DirectionsService();
// La carte, le service de géocodage et les marqueurs
var map, geocoder, marker, marker2, marker3;
// point de depart, arrive et de verification
var depart, arrivee, ptCheck;
var directionDisplay;

function initOnLoad() {
	init();
	trouveRoute();
}

/* initialise google MAP V3 */
function init() {
	/* gestion des routes */
	directionsDisplay = new google.maps.DirectionsRenderer();
	/* emplacement par d�faut de la carte (Toulouse) */
	var maison = new google.maps.LatLng(48.5223562, 7.7389103);
	/* option par d�faut de la carte */
	var myOptions = {
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		center : maison
	}
	/* creation de la map */
	map = new google.maps.Map(document.getElementById("divMap"), myOptions);
	/* connexion de la map + le panneau de l'itin�raire */
	directionsDisplay.setPanel(document.getElementById("divRoute"));
	directionsDisplay.setMap(map);
	/* intialise le geocoder pour localiser les adresses */
	geocoder = new google.maps.Geocoder();

}

function trouveRoute() {
	var request = {
		origin : depart,
		destination : "Les Integrales, Bd Sebastien Brant, 67400 Illkirch-Graffenstaden",
		travelMode : google.maps.DirectionsTravelMode["DRIVING"]
	};
	/* appel � l'API pour tracer l'itin�raire */
	directionsService.route(request, function(response, status) {
		var itineraire;
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
			var monTrajet = response.routes[0];
			var listePoints = monTrajet.overview_path;
			var nombrePoints = listePoints.length;
			var latitudes = [];
			var longitudes = [];
			for (var i = 0; i < nombrePoints; i++) {
				var point = listePoints[i];
				latitudes.push(point.lat());
				longitudes.push(point.lng());
				console.log("Lat: " + latitudes[i] + " // Long:"
						+ longitudes[i]);
			}

			toRad = function(degrees) {
				return degrees * Math.PI / 180;
			};

			function distanceConvert(lat1Deg, lng1Deg, lat2Deg, lng2Deg) {
				var earthRadius = 6378137; // meters
				var lat1 = toRad(lat1Deg);
				var lat2 = toRad(lat2Deg);
				var lng1 = toRad(lng1Deg);
				var lng2 = toRad(lng2Deg);

				var dLng = lng2 - lng1;

				var distRad = Math.acos(Math.sin(lat1) * Math.sin(lat2)
						+ Math.cos(lat1) * Math.cos(lat2) * Math.cos(dLng));
				var distance = earthRadius * distRad;
				return distance;
			}

			for (var i = 0; i < nombrePoints - 1; i++) {
				console.log(distanceConvert(latitudes[i], longitudes[i],
						latitudes[i + 1], longitudes[i + 1]));
			}

			console.log("Distance a vol d'oiseau : "
					+ distanceConvert(latitudes[0], longitudes[0],
							latitudes[nombrePoints - 1],
							longitudes[nombrePoints - 1]));
		}
	});
}