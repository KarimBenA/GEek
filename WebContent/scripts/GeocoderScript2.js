function geocodage() {

	var geocoder = new google.maps.Geocoder();
	var numRue = document.getElementById("numRue").value;
	var codePostal = document.getElementById("codePostal").value;
	var ville = document.getElementById("ville").value;
	var adresseSaisie = numRue + " " + codePostal + " " + ville;
	var lat, lng;
	var myResults;

	alert(adresseSaisie);
	alert(geocoder);

	if (geocoder) {

		alert("entrée géocodeur");

		geocoder
				.geocode(
						{
							'address' : adresseSaisie
						},
						function(results, status) {

							alert("entrée function");
							alert("statut :" + status);
							alert(results[0].address_components[0].long_name);
							// if (status == google.maps.GeocoderStatus.OK) {


//							document.getElementById("numRue").value = results[0].address_components[0].long_name
//									+ results[0].address_components[1].long_name;
//							document.getElementById("codePostal").value = results[0].address_components[6].long_name;
//							document.getElementById("ville").value = results[0].address_components[2].long_name;
//							document.getElementById("latitude").value = results[0].geometry.location.lat;
//							document.getElementById("longitude").value = results[0].geometry.location.lng;
//							lat = results[0].geometry.location.lat;
//							lng = results[0].geometry.location.lng;
							// }

						})
	}
	;
}