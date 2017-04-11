<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<c:import url="/WEB-INF/views/subviews/ImportBootstrap.jsp" />
		<title>${utilisateurConnecte.toString()}</title>
	</head>
	
	<body>
		<c:import url="/WEB-INF/views/subviews/Menu.jsp" />
	
		<div class="container">
		
			<h3 class="text-center">Informations de l'utilisateur : <strong>${utilisateurConnecte.toString()}</strong></h3>
			
				<table class="table table-striped">
						<tbody>
							<tr>
								<td class="text-right">Prénom :</td>
								<td><strong>${utilisateurConnecte.getPrenom()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">Nom :</td>
								<td><strong>${utilisateurConnecte.getNom()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">E-Mail :</td>
								<td><strong>${utilisateurConnecte.getEmail()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">Téléphone :</td>
								<td><strong>${utilisateurConnecte.getTelephone()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">Genre :</td>
								<td><strong>${utilisateurConnecte.getGenre()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">Fumeur :</td>
								<td><strong>${utilisateurConnecte.getFumeur()}</strong></td>
								<td> </td>
							</tr>
							<tr>
								<td class="text-right">Bavardage :</td>
								<td><strong>${utilisateurConnecte.getBlabla()}</strong></td>
								<td> </td>
							</tr>
						</tbody>
				</table>
			
			<div class="container text-center">
				<p>
					<a class="btn btn-lg btn-success"  href="/GEek/Inscription?type=modification">Modifier mes informations</a>
					<a class="btn btn-lg btn-warning"  href="/GEek/SupprimerCompte" onclick="return confirm('Continuer pour supprimer définitivement votre compte')">Supprimer mon compte</a>
				</p>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
	
</html>