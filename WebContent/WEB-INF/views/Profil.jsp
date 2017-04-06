<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>GEek - Détail de l'utilisateur</title>
	</head>
	
	<body>
	
		<h3>Détails de l'utilisateur : ${utilisateurConnecte.toString()}</h3>
	
		<ul>
			<li>Prénom : ${utilisateurConnecte.getPrenom()}</li>
			<li>Nom : ${utilisateurConnecte.getNom()}</li>
			<li>E-Mail : ${utilisateurConnecte.getEmail()}</li>
			<li>Date de naissance : ${utilisateurConnecte.getDdnToString()}</li>
			<li>Téléphone : ${utilisateurConnecte.getTelephone()}</li>
			<li>Genre : ${utilisateurConnecte.getGenre()}</li>
			<li>Fumeur : ${utilisateurConnecte.getFumeur()}</li>
			<li>Bavardage : ${utilisateurConnecte.getBlabla()}</li>
		</ul>
		
		<a href="#">Modifier mes informations</a> <br />
		<a href="#">Supprimer mon compte</a> <br />
		
	</body>
	
</html>