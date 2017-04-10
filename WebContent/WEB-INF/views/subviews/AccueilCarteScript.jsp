<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyD8h15txIXNmhWiH3RKAZGARhONH3ZF4WU"></script>

<script type="text/javascript" src="googleMaps.js"></script>


<script type="text/javascript">
	var directionsService = new google.maps.DirectionsService(); // service
	// GoogleMaps
	var map, geocoder, marker3; // La carte, le service de géocodage et les
	// marqueurs
	var maison;

	/* initialise google MAP V3 */
	function init() {
		/* gestion des routes */
		directionsDisplay = new google.maps.DirectionsRenderer();
		/* emplacement par défaut de la carte (Toulouse) */
		maison = new google.maps.LatLng(48.5223562, 7.7389103);
		/* option par défaut de la carte */
		var myOptions = {
			zoom : 11,
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
</script>

<script>
	function marquer() {
		if (geocoder) {
			geocoder.geocode({
				'address' : "Les Intégrales, Bd Sébastien Brant, 67400 Illkirch-Graffenstaden"
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					/* ajoute un marqueur à l'adresse choisie */
					map.setCenter(results[0].geometry.location);
					if (marker3) {
						marker3.setMap(null);
					}
					marker3 = new google.maps.Marker({
						map : map,
						draggable : true,
						position : results[0].geometry.location
					});
					/*
					 * on remplace l'adresse par celle fournie du
					 * geocoder
					 */
					interet = results[0].formatted_address;
				}
			});
		}
	}
</script>