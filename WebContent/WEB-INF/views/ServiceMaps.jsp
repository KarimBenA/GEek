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

<script type="text/javascript" src="scripts/ServiceMapsScript.js"></script>
<script type="text/javascript">
var depart = '${utilisateurConnecte.getAdresse().toString()}';
</script>
</head>


<body onload="initOnLoad()">


	<c:import url="/WEB-INF/views/subviews/Menu.jsp" />


	<div style="height: 500px">
		<div id="divMap" style="float: left; width: 70%; height: 100%"></div>
		<div id="divRoute" style="float: right; width: 30%; height: 100%"></div>
	</div>
	
	<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
</body>
</html>