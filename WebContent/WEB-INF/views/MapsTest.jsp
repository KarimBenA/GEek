<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="initial-scale=1.0">

<!-- El�ment Google Maps indiquant que la carte doit �tre affich� en plein �cran et
qu'elle ne peut pas �tre redimensionn�e par l'utilisateur 
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> -->

<!--importation de l'API google MAP Version 3-->
<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyD8h15txIXNmhWiH3RKAZGARhONH3ZF4WU"></script>

<script type="text/javascript" src="googleMaps.js"></script>

	<script type="text/javascript">
		var directionsService = new google.maps.DirectionsService(); // service GoogleMaps
		var map, geocoder, marker, marker2; // La carte, le service de g�ocodage et les marqueurs
		var depart, arrivee, ptCheck; // point de d�part, arriv� et de v�rification

		/*initialise google MAP V3*/
		function init() {
			/*gestion des routes*/
			directionsDisplay = new google.maps.DirectionsRenderer();
			/*emplacement par d�faut de la carte (Toulouse)*/
			var maison = new google.maps.LatLng(43.6042600, 1.4436700);
			/*option par d�faut de la carte*/
			var myOptions = {
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				center : maison
			}
			/*creation de la map*/
			map = new google.maps.Map(document.getElementById("divMap"),
					myOptions);
			/*connexion de la map + le panneau de l'itin�raire*/
			directionsDisplay.setPanel(document.getElementById("divRoute"));
			directionsDisplay.setMap(map);
			/*intialise le geocoder pour localiser les adresses */
			geocoder = new google.maps.Geocoder();
		}

		function trouveRoute() {
			/*test si les variables sont bien initialis�s*/
			if (depart && arrivee) {
				var request = {
					origin : depart,
					destination : arrivee,
					travelMode : google.maps.DirectionsTravelMode["DRIVING"]
				};
				/*appel � l'API pour tracer l'itin�raire*/
				directionsService.route(request, function(response, status) {
					if (status == google.maps.DirectionsStatus.OK) {
						directionsDisplay.setDirections(response);
					}
				});
			}
		}

		function rechercher(src, src2) {
			// ptCheck = code; /*adresse de d�part ou arriv�e ? */
			if (geocoder) {
				geocoder
						.geocode(
								{
									'address' : document.getElementById(src).value
								},
								function(results, status) {
									if (status == google.maps.GeocoderStatus.OK) {
										/*ajoute un marqueur � l'adresse choisie*/
										map
												.setCenter(results[0].geometry.location);
										if (marker) {
											marker.setMap(null);
										}
										marker = new google.maps.Marker(
												{
													map : map,
													position : results[0].geometry.location
												});
										/*on remplace l'adresse par celle fournie du geocoder*/
										document.getElementById(src).value = results[0].formatted_address;
										depart = results[0].formatted_address;
										/*trace la route*/
									}
								});
				geocoder
						.geocode(
								{
									'address' : document.getElementById(src2).value
								},
								function(results, status) {
									if (status == google.maps.GeocoderStatus.OK) {
										/*ajoute un marqueur � l'adresse choisie*/
										if (marker2) {
											marker2.setMap(null);
										}
										marker2 = new google.maps.Marker(
												{
													map : map,
													position : results[0].geometry.location
												});
										/*on remplace l'adresse par celle fournie du geocoder*/
										document.getElementById(src2).value = results[0].formatted_address;
										arrivee = results[0].formatted_address;
										/*trace la route*/
									}
									trouveRoute();
								});
			}
		}
	</script>




</head>




<body onload="init();">
<div>
	<div id="recherche">
		<table>
			<tr>
				<td><b>D�part: </b></td>
				<td><input type="text" id="adrDep" value=""
					style="width: 300px;"></td>
			</tr>
			<tr>
				<td><b>Arriv�e: </b></td>
				<td><input type="text" id="adrArr" value=""
					style="width: 300px;"></td>
			</tr>
			<tr>
				<td><b>Transport: </b></td>
				<td><select id="mode" onchange="calcRoute();">
						<option value="DRIVING">voiture</option>
						<option value="WALKING">marche</option>
						<option value="BICYCLING">v�lo</option>
				</select></td>

			</tr>
			<tr>
				<td><input type="submit" value="Recherche"
					onclick="rechercher('adrDep','adrArr')"></td>
			</tr>
		</table>
	</div>

	<div id="divMap" style="float:left; width: 70%; height: 500px"></div>
	<div id="divRoute" style="float:right; width: 30%; height: 100%"></div>
</div>
	



</body>
</html>