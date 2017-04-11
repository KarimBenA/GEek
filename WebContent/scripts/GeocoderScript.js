function geocodage() {
	
	var numRue = document.getElementById("numRue").value;
	var codePostal = document.getElementById("codePostal").value;
	var ville = document.getElementById("ville").value;
	var adresseSaisie = numRue + " " + codePostal + " " + ville;
	
    if (geocoder) {
        geocoder
                .geocode(
                        {
                            'address' : adresseSaisie
                        },
                        function(status, results) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                document.getElementById("numRue").value = results[0].address_components[0].long_name + result[0].address_components[1].long_name;
                                document.getElementById("codePostal").value = result[0].address_components[6].long_name;
                                document.getElementById("ville").value = result[0].address_components[2].long_name;
                                document.getElementById("latitude").value = results[0].geometry.location.lat;
                                document.getElementById("longitude").value =results[0].geometry.location.lng;
                            }
                        })
    }
    ;
}