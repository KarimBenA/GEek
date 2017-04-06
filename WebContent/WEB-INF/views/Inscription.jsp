<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/WEB-INF/lib/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/WEB-INF/lib/UserManagerStyle.css" />
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
			Vous êtes : <label><input type="radio" id="genre_homme" name="genre"
				value="homme">Un homme</label> <label><input type="radio" id="genre_femme"
				name="genre" value="femme">Une femme</label>
		</p>

		<p>
			Vous êtes fumeur : 
			<label><input type="radio" id="fumeur_oui" name="fumeur" value="oui">Oui</label>
			<label><input type="radio" id="fumeur_non" name="fumeur" value="non">Non</label>
		</p>

		<p>
			Vous aimez discuter : <label><input type="radio" id="blabla_oui"
				name="blabla" value="oui">Oui</label> <label><input
				type="radio" id="blabla_non" name="blabla" value="non">Non</label>
		</p>



		<p>
			<input type="submit" name="Inscription" value="S'incrire">
		</p>


	</form>
</body>
</html>