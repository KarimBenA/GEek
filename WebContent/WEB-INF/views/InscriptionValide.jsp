<%@ page 	language="java" 
			contentType="text/html; charset=ISO-8859-1"
			pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<c:import url="/WEB-INF/views/subviews/ImportBootstrap.jsp" />
		<title>Accueil</title>
		
	</head>
	
	<body>
		<c:import url="/WEB-INF/views/subviews/Menu.jsp" />
	
		<div class="container alert alert-success fade in alert-dismissable" style="margin-top:18px;">
			<strong>Inscription réussie.</strong>
			<a class="btn btn-lg btn-success" href="/GEek">Retour à l'accueil</a>
		</div>
		
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
</html>