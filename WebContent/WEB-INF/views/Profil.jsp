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
		
			<h3>Informations de l'utilisateur : ${utilisateurConnecte.toString()}</h3>
			
				<table class="table table-striped">
						<tbody>
							<tr>
								<td>Prénom :</td>
								<td><strong>${utilisateurConnecte.getPrenom()}</strong></td>
							</tr>
							<tr>
								<td>Nom :</td>
								<td><strong>${utilisateurConnecte.getNom()}</strong></td>
							</tr>
							<tr>
								<td>E-Mail :</td>
								<td><strong>${utilisateurConnecte.getEmail()}</strong></td>
							</tr>
							
							<tr>
								<td>Téléphone :</td>
								<td><strong>${utilisateurConnecte.getTelephone()}</strong></td>
							</tr>
							<tr>
								<td>Genre :</td>
								<td><strong>${utilisateurConnecte.getGenre()}</strong></td>
							</tr>
							<tr>
								<td>Fumeur :</td>
								<td><strong>${utilisateurConnecte.getFumeur()}</strong></td>
							</tr>
							<tr>
								<td>Bavardage :</td>
								<td><strong>${utilisateurConnecte.getBlabla()}</strong></td>
							</tr>
						</tbody>
				</table>
			
			<div class="container">
				<div class="row">
					<div class="col">
						<a class="btn btn-lg btn-success"  href="#">Modifier mes informations</a>
					</div>
					<div class="col">
						<a class="btn btn-lg btn-warning"  href="#">Supprimer mon compte</a>
					</div>
					<br /><br />
				</div>
			</div>
		
		</div>
		
		
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
	
</html>