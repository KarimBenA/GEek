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
	
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyD8h15txIXNmhWiH3RKAZGARhONH3ZF4WU"></script>

<script src="scripts/RechercheMapsScript.js"></script>

</head>


<body onload="init()">

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

		<div>
			<div id="divMap" style="float: left; width: 70%; height: 500px"></div>
			<div id="divRoute" style="float: right; width: 30%; height: 100%"></div>
		</div>


		<div>
			<table>
				<tr>
					<td><b>Afficher un point d'intérêt : </b></td>
					<td><input type="text" id="adrBis" value=""
						style="width: 300px;"></td>
					<td><input type="submit" value="Marquer"
						onclick="marquer('adrBis')"></td>

				</tr>
			</table>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
</body>
</html>