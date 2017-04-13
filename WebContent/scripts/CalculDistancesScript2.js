// LES FONCTIONS MATHEMATIQUES POUR LE CALCUL DES DISTANCES

// Ajoutés// service GoogleMaps
var directionsService = new google.maps.DirectionsService();
var candidats = [];

function toRad(degrees) {
	var radians;
	radians = degrees * Math.PI / 180;
	return radians;
};

function toDeg(radians) {
	var degres;
	degres = (radians * 180) / Math.PI;
	return degres;
}

function distanceCalc(lat1Deg, lng1Deg, lat2Deg, lng2Deg) {
	var earthRadius = 6378137; // meters
	var lat1 = toRad(lat1Deg);
	var lat2 = toRad(lat2Deg);
	var lng1 = toRad(lng1Deg);
	var lng2 = toRad(lng2Deg);
	var dLng = lng2 - lng1;
	var distRad = Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1)
			* Math.cos(lat2) * Math.cos(dLng));
	var distance = earthRadius * distRad;
	return distance;
};

// UNE FONCTION RECHERCHANT SI UN TABLEAU CONTIENT UNE VALEUR DONNEE
function contains(array, object) {
	for (var i = 0; i < array.length; i++) {
		if (array[i] === object) {
			return true;
		}
	}
	return false;
};

/*
 * <script type="text/javascript">
 * 
 * function Candidat(nom, prenom, genre, email, adresse, lat, lng, fumeur,
 * blabla){ this.nom = nom; this.prenom = prenom; this.genre=genre;
 * this.email=email; this.adresse=adresse; this.lat=lat; this.lng=lng;
 * this.fumeur=fumeur; this.blabla=blabla; }
 * 
 * var tableauGlobal = []; <c:forEach items="${listeUtilisateurs}" var="user">
 * tableauGlobal.push(new Candidat('${user.getNom()}', '${user.getPrenom()}',
 * '${user.getGenre()}', '${user.getEmail}', '${user.getAdresseString()}',
 * '${user.getLat()}', '${user.getLng}', '${user.getFumeur}',
 * '${user.getBlabla}')); </c:forEach>
 * 
 * creerListePointsString(tableauGlobal); </script>
 */

// ON CREE LA LISTE DE POINTS DECRIVANT LE TRAJET
// RENSEIGNER src = adresse du départ (domicile)
// ON RECUPERER LA LISTE STRING
function creerListePointsString(tableau) {

	// for (var i = 0; i < tableau.length; i++) {
	// var utilisateurCandidat = tableau[i];
	// var depart;
	// geocoder = new google.maps.Geocoder();
	// if (geocoder) {
	// geocoder.geocode({
	// 'address' : utilisateurCandidat.adresse
	// }, function(results, status) {
	// if (status == google.maps.GeocoderStatus.OK) {
	// depart = results[0].geometry.location;
	// }
	// });
	// }
	//
	// var request = {
	// origin : depart,
	// destination : "Les Integrales, Bd Sebastien Brant, 67400
	// Illkirch-Graffenstaden",
	// travelMode : google.maps.DirectionsTravelMode["DRIVING"]
	// };
	//
	// // sorties de la fonction route qui suit
	// var latitudesDegres = [];
	// var longitudesDegres = [];
	//
	// directionsService.route(request, function(response, status) {
	// var itineraire;
	// if (status == google.maps.DirectionsStatus.OK) {
	// directionsDisplay.setDirections(response);
	// var monTrajet = response.routes[0];
	// var listePoints = monTrajet.overview_path;
	// var nombrePoints = listePoints.length;
	//
	// for (var j = 0; j < nombrePoints; j++) {
	// var point = listePoints[j];
	// latitudesDegres.push(point.lat());
	// longitudesDegres.push(point.lng());
	// }
	// }
	// });
	//
	// // bougés au JSP
	// // var PointConnecte = utilisateurConnecte.getAdresse().getPoint();
	// // var LatConnecte = PointConnecte.lat;
	// // var LngConnecte = PointConnecte.lng;
	//
	// // var candidats = []; (déplacée en global)
	// // ajout de = [] sur les 2 suivants
	// var latitudesRadians = [];
	// var longitudesRadians = [];
	//
	// for (var j = 0; j < latitudesDegres.length; j++) {
	// latitudesRadians.push(toRad(latitudesDegres[j]));
	// }
	// ;
	//
	// for (var j = 0; j < longitudesDegres.length; j++) {
	// longitudesRadians.push(toRad(longitudesDegres[j]));
	// }
	// ;
	//
	// // for (var j = 0; j < latitudesRadians.length; j++) {
	// // var distance = distanceCalc(LatConnecte, LngConnecte,
	// // latitudesRadians[j], longitudesRadians[j]);
	// //
	// // // if (distance < 1000
	// // // && contains(candidats, utilisateurCandidat) == false) {
	// // candidats.push({
	// // 'prenom' : utilisateurCandidat.prenom,
	// // 'nom' : utilisateurCandidat.nom,
	// // 'genre' : utilisateurCandidat.genre,
	// // 'email' : utilisateurCandidat.email,
	// // 'adresse' : utilisateurCandidat.adresse,
	// // 'fumeur' : utilisateurCandidat.fumeur,
	// // 'blabla' : utilisateurCandidat.blabla,
	// // 'latitudeTrajet' : toDeg(latitudesRadians[j]),
	// // 'longitudeTrajet' : toDeg(longitudesRadians[j])
	// // });
	// // //}
	// // }
	// }
	;
	marquerTous();
}

function marquerTous() {

	var infowindow = new google.maps.InfoWindow();

	candidats = tableauGlobal;
	var contentString = [ candidats.length ];

	for (var i = 0; i < candidats.length; i++) {

		contentString[i] = '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">'
				+ '<div class="containter">'
				+ '<p>Nom :'
				+ candidats[i].nom
				+ '</p>'
				+ '<p>Prénom :'
				+ candidats[i].prenom
				+ '</p>'
				+ '<p>Email :'
				+ candidats[i].email
				+ '</p>'
				+ '<button>Contacter</button>';
		var myLatLng = {
			lat : parseFloat(candidats[i].lat),
			lng : parseFloat(candidats[i].lng)
		};

		// if (marker) {
		// marker.setMap(null);
		// }

		var marker = new google.maps.Marker({
			map : map,
			position : myLatLng
		});

		marker.data = contentString[i];

		// google.maps.event.addListener(marker, 'click', function(map,marker) {
		// //infowindow.close();
		// infowindow.setContent(contentString);
		// infowindow.open(map, marker);
		// });

		marker.addListener('click', function() {
			// infowindow.close();
			infowindow.setContent(this.data);
			infowindow.open(map, this);
		});

		;

	}
}