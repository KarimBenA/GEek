function split(listePointsString) {
	var listePointsTableau;
	listePointsTableau = listePointsString.split(",");
	return listePointTableau;
};

function setLat(listePointTableau) {
	var latitudes = [];
	for (var i = 0; i < listePointsTableau.length; 2 * i) {
		latitudes.push(listePointsTableau[i * 2]);
	}
	return latitudes;
};

function setLng(listePointTableau) {
	var latitudes = [];
	var longitudes = [];
	for (var i = 0; i < listePointsTableau.length; 2 * i) {
		longitudes.push(listePointsTableau[(i * 2) + 1]);
	}
};

function toRad(degrees) {
	var radians;
	radians = degrees * Math.PI / 180;
	return radians;
};

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

function contains(array, object) {
	for (var i = 0; i < array.length; i++) {
		if (array[i] === object) {
			return true;
		}
	}
	return false;
};

// TableauGlobal = [ {utilisateur : user1, liste : listePointsString1},
// {utilisateur : user2, liste : listePointsString2},
// ...
// {utilisateur : usern, liste : listePointsStringn} ]

// Pour chaque utilisateur, ListePointsString = TableauGlobal[i].liste

function afficherCandidats(utilisateurConnecte) {

	var PointConnecte = utilisateurConnecte.getAdresse().getPoint();
	var LatConnecte = PointConnecte.lat;
	var LngConnecte = PointConnecte.lng;

	var candidats = [];

	for (var i = 0; i < TableauGlobal.length; i++) {
		var ListePointsString = TableauGlobal[i].liste;
		var utilisateurCandidat = TableauGlobal[i].utilisateur;
		var ListePointTableau = split(listePointsString);

		var latitudesDegres = setLat(listePointTableau);
		var latitudesRadians = [];

		for (var j = 0; j < latitudesDegres.length; j++) {
			latitudesRadians.push(toRad(latitudesDegres[j]));
		}
		;

		var longitudesDegres = setLng(listePointTableau);
		var longitudesRadians = [];

		for (var j = 0; j < longitudesDegres.length; j++) {
			longitudesRadians.push(toRad(longitudesDegres[j]));
		}
		;

		for (var j = 0; j < latitudesRadians.length; j++) {
			var distance = distanceCalc(LatConnecte, LngConnecte,
					latitudesRadian[j], longitudesRadians[j]);

			if (distance < 1000
					&& contains(candidats, utilisateurCandidat) == false) {
				candidats.push(utilisateurCandidat);
			}
		}
		;
	}
	;

	return candidats;
};