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

		<div class="container text-center">
		
		<h1>Je cherche des covoitureurs...</h1> <br />
		
		<div class="row">
				<div class="container col-xs-6">
					<div class="jumbotron" style="height:500px">	
						CARTE GOOGLE MAP		
					</div>	
				</div>
				<div class="container col-xs-6">
				
					<br /><br /><br />
					<h2>Mes préférences de conduite</h2> <br />
				
					<form class="form-horizontal text-left" action="" method="post">
						<div class="form-group">
								<p class="control-label col-xs-6">Détour que j'accepte de faire : </p>
								<div class="col-xs-6">
									<input id="rayon" type="number" min="1" max="20"> km
								</div>
						</div>
						<div class="form-group">
								<p class="control-label col-xs-6">J'accepte les fumeurs :</p>
								<div class="col-xs-6">
									<label><input onchange="" type="radio" id="fumeur_oui" name="fumeur" value="oui">Oui</label>
									<label><input onchange="" type="radio" id="fumeur_non" name="fumeur" value="non">Non</label>
								</div>
						</div>
						<div class="form-group">
								<p class="control-label col-xs-6">Je veux rouler avec des :</p>
								<div class="col-xs-6">
									<label><input onchange="" type="radio" id="genre_homme" name="genre" value="homme">Hommes</label>
									<label><input onchange="" type="radio" id="genre_femme" name="genre" value="femme">Femmes</label>
									<label><input onchange="" type="radio" id="genre_neutre" name="genre" value="neutre">Qu'importe</label>
								</div>
						</div>
						<div class="form-group">
								<p class="control-label col-xs-6">Je suis bavard :</p>
								<div class="col-xs-6">
									<label><input onchange="" type="radio" id="blabla_oui" name="blabla" value="oui">oui</label>
									<label><input onchange="" type="radio" id="blabla_non" name="blabla" value="non">non</label>
								</div>
						</div>
					</form>
				</div>
		</div>
		</div>




		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
</html>