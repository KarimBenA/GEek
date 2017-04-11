function geocodage(adresseSaisie) {
	if (geocoder) {
		geocoder
				.geocode(
						{
							'address' : adresseSaisie
						},
						function(status, results) {
							if (status == google.maps.GeocoderStatus.OK) {
								document.getElementById("numRue").value = results[0].address_components[0].long_name;
								document.getElementById("rue").value = result[0].address_components[1].long_name;
								document.getElementById("codePostal").value = result[0].address_components[6].long_name;
								document.getElementById("ville").value = result[0].address_components[2].long_name;
								document.getElementById("pays").value = result[0].address_components[5].long_name;
								document.getElementById("coordonnees").value = results[0].geometry.location
							}
						})
	}
	;
}