<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!--importation de l'API google MAP Version 3-->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?
sensor=false"></script>
<script type="text/javascript" src="googleMaps.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9JzmpGlm0eUmt4_NIfVSmuFP96VAU7rA&callback=initMap"
	type="text/javascript"></script>
</head>
<body onload="init();">
	<div>
		<table>
			<tr>
				<td><b>D�part: </b></td>
				<td><input type="text" id="adrDep" value=""
					style="width: 300px;"></td>
				<!-- <b>Transport: </b>
<select id="mode" onchange="calcRoute();">
<option value="DRIVING">voiture</option>
<option value="WALKING">marche</option>
<option value="BICYCLING">v�lo</option>
</select></td></tr> -->
			<tr>
				<td><b>Arriv�e: </b></td>
				<td><input type="text" id="adrArr" value=""
					style="width: 300px;"></td>
				<td><input type="button" value="Recherche"
					onclick="rechercher('adrDep','adrArr')"></td>
			</tr>
		</table>
	</div>
	<div id="divMap" style="float: left; width: 70%; height: 80%"></div>
	<div id="divRoute" style="float: right; width: 30%;height 80%"></div>
	<br />
</body>
</html>