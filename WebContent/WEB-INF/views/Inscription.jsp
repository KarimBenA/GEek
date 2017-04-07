<%@ page 	language="java" 
		 	contentType="text/html; charset=ISO-8859-1"
			pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<<<<<<< HEAD
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="/WEB-INF/lib/UserManagerStyle.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditUser</title>
</head>
<body>
	<c:import url="/WEB-INF/views/subviews/Menu.jsp" />


	<h2>Let's add a user !</h2>
	<form action="Inscription" method="post">
		<p>
			Prénom : <input type="text" name="prenom" placeholder="Votre prénom">
		</p>
		<p>
			Nom : <input type="text" name="nom" placeholder="Votre nom">
		</p>
		<p>
			Date de naissance : <input type="date" class="datepick" name="ddn">
		</p>

		<script type="text/javascript">
			$(document).ready(function() {
				$('.datepick').datepicker({
					dateFormat : 'dd-MM-yy'
				});
			});
		</script>

		<p>
			E-mail : <input type="text" name="email" placeholder="Votre e-mail">
		</p>

		<p>
			Mot de passe : <input type="password" name="pwd"
				placeholder="Votre mot de passe">
		</p>

		<p>
			Telephone : <input type="text" name="telephone"
				placeholder="Votre numéro de mobile">
		</p>

		<p>
			Vous êtes : <label><input type="radio" id="genre_homme"
				name="genre" value="homme">Un homme</label> <label><input
				type="radio" id="genre_femme" name="genre" value="femme">Une
				femme</label>
		</p>

		<p>
			Vous êtes fumeur : <label><input type="radio" id="fumeur_oui"
				name="fumeur" value="oui">Oui</label> <label><input
				type="radio" id="fumeur_non" name="fumeur" value="non">Non</label>
		</p>

		<p>
			Vous aimez discuter : <label><input type="radio"
				id="blabla_oui" name="blabla" value="oui">Oui</label> <label><input
				type="radio" id="blabla_non" name="blabla" value="non">Non</label>
		</p>



		<p>
			<input type="submit" name="Inscription" value="S'incrire">
		</p>


	</form>
</body>
=======
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<c:import url="/WEB-INF/views/subviews/ImportBootstrap.jsp" />
		<title>Inscription</title>
	</head>
	
	<body>
		<c:import url="/WEB-INF/views/subviews/Menu.jsp" />
		
		<!-- DATEPICKER -->
		<script type="text/javascript">$(document).ready(function(){$('.datepick').datepicker({dateFormat : 'dd-MM-yy'});});</script>
	
		
		<div class="container">
			<h2>Inscription </h2>
			
				<form class="form-horizontal" action="Inscription" method="post">
				
					<div class="form-group">
							<p class="control-label col-xs-2">Prénom : </p>
							<div class="col-xs-5">
								<input class="form-control" type="text" name="prenom" placeholder="Votre prénom">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Nom : </p>
							<div class="col-xs-5">
								<input class="form-control" type="text" name="nom" placeholder="Votre nom">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Date de naissance : </p>
							<div class="col-xs-5">
								<input class="form-control" type="date" class="datepick" name="ddn">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">E-mail : </p>
							<div class="col-xs-5">
								<input class="form-control" type="text" name="email" placeholder="Votre e-mail">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Mot de passe : </p>
							<div class="col-xs-5">
								<input class="form-control" type="password" name="pwd"	placeholder="Votre mot de passe">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Telephone : </p>
							<div class="col-xs-5">
								<input class="form-control" type="text" name="telephone" placeholder="Votre numéro de mobile">
							</div>
					</div>
					<div class="form-group">
						<p class="control-label col-xs-2">Adresse : </p>
						<div class="col-xs-5">
							<input class="form-control" type="text" name="numRue" placeholder="Votre numéro et votre rue">
							<input class="form-control" type="text" name="codePostal" placeholder="Votre code postal">
							<input class="form-control" type="text" name="ville" placeholder="Votre ville">
						</div> 
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Vous êtes : </p>
							<div class="col-xs-2">
								<label><input type="radio" id="genre_homme"	name="genre" value="homme">Un homme</label>
								<label><input type="radio" id="genre_femme" name="genre" value="femme">Une femme</label>
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Vous êtes fumeur :</p>
							<div class="col-xs-2">
								<label><input type="radio" id="fumeur_oui" name="fumeur" value="oui">Oui</label>
								<label><input type="radio" id="fumeur_non" name="fumeur" value="non">Non</label>
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Vous aimez discuter : </p>
							<div class="col-xs-2">
								<label><input type="radio" id="blabla_oui" name="blabla" value="oui">Oui</label>
								<label><input type="radio" id="blabla_non" name="blabla" value="non">Non</label>
							</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input class="btn btn-lg btn-success" type="submit" name="Inscription" value="S'incrire">
						</div>
					</div>
				</form>
		</div>
		
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
>>>>>>> refs/heads/Gaetan
</html>