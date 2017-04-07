<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
qu'elle ne peut pas être redimensionnée par l'utilisateur 
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> -->

<!--importation de l'API google MAP Version 3-->


<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyD8h15txIXNmhWiH3RKAZGARhONH3ZF4WU"></script>

<script type="text/javascript" src="googleMaps.js"></script>


<script type="text/javascript">
	var directionsService = new google.maps.DirectionsService(); // service
	// GoogleMaps
	var map, geocoder, marker, marker2; // La carte, le service de géocodage et les
	// marqueurs
	var depart, arrivee, ptCheck; // point de départ, arrivé et de vérification
	var directionDisplay;

	/* initialise google MAP V3 */
	function init() {
		/* gestion des routes */
		directionsDisplay = new google.maps.DirectionsRenderer();
		/* emplacement par défaut de la carte (Toulouse) */
		var maison = new google.maps.LatLng(43.6042600, 1.4436700);
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
							var latitudes = [];
							var longitudes = [];
							for (var i = 0; i < nombrePoints; i++) {
								var point = listePoints[i];
								latitudes.push(point.lat());
								longitudes.push(point.lng());
								console.log("Lat: " + latitudes[i]
										+ " // Long:" + longitudes[i]);
							}

							toRad = function(degrees) {
								return degrees * Math.PI / 180;
							};

							function distanceConvert(lat1Deg, lng1Deg, lat2Deg,
									lng2Deg) {
								var earthRadius = 6378137; //meters
								var lat1 = toRad(lat1Deg);
								var lat2 = toRad(lat2Deg);
								var lng1 = toRad(lng1Deg);
								var lng2 = toRad(lng2Deg);

								var dLng = lng2 - lng1;

								var distRad = Math.acos(Math.sin(lat1)
										* Math.sin(lat2) + Math.cos(lat1)
										* Math.cos(lat2) * Math.cos(dLng));
								var distance = earthRadius * distRad;
								return distance;
							}

							for (var i = 0; i < nombrePoints - 1; i++) {
								console.log(distanceConvert(latitudes[i],
										longitudes[i], latitudes[i + 1],
										longitudes[i + 1]));
							}

							console.log("Distance à vol d'oiseau : "
									+ distanceConvert(latitudes[0],
											longitudes[0],
											latitudes[nombrePoints - 1],
											longitudes[nombrePoints - 1]));
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
									/* ajoute un marqueur à l'adresse choisie */
									if (marker2) {
										marker2.setMap(null);
									}
									marker2 = new google.maps.Marker({
										map : map,
										position : results[0].geometry.location
									});
									/*
									 * on remplace l'adresse par celle fournie du
									 * geocoder
									 */
									document.getElementById(src2).value = results[0].formatted_address;
									arrivee = results[0].formatted_address;
									/* trace la route */
								}
								trouveRoute();
							});
		}
	}
</script>

</head>


<body onload="init();">

<c:import url="/WEB-INF/views/subviews/Menu.jsp" />

	<div>
		<div id="recherche">
			<table>
				<tr>
					<td><b>Départ: </b></td>
					<td><input type="text" id="adrDep" value=""
						style="width: 300px;"></td>
				</tr>
				<tr>
					<td><b>Arrivée: </b></td>
					<td><input type="text" id="adrArr" value=""
						style="width: 300px;"></td>
				</tr>
				<tr>
					<td><b>Transport: </b></td>
					<td><select id="mode" onchange="calcRoute();">
							<option value="DRIVING">voiture</option>
							<option value="WALKING">marche</option>
							<option value="BICYCLING">vélo</option>
					</select></td>

				</tr>
				<tr>
					<td><input type="submit" value="Recherche"
						onclick="rechercher('adrDep','adrArr')"></td>
				</tr>
			</table>
		</div>

		<div id="divMap" style="float: left; width: 70%; height: 500px"></div>
		<div id="divRoute" style="float: right; width: 30%; height: 100%"></div>
	</div>

</body>
</html>