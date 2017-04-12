<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/WEB-INF/views/subviews/ImportBootstrap.jsp" />
<title>Inscription</title>
</head>

<body>
	<c:import url="/WEB-INF/views/subviews/Menu.jsp" />


	<div class="container">
		<c:if test="${!modification}">
			<h2>Inscription</h2>
		</c:if>
		<c:if test="${modification}">
			<h2>Modification du profil</h2>
		</c:if>

		<form class="form-horizontal" action="Inscription" method="post">

			<div class="form-group">
				<p class="control-label col-xs-2">Pr�nom :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="text" name="prenom"
							placeholder="Votre pr�nom">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="prenom"
							placeholder="${utilisateurConnecte.getPrenom()}"
							value="${utilisateurConnecte.getPrenom()}">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Nom :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="text" name="nom"
							placeholder="Votre nom">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="nom"
							placeholder="${utilisateurConnecte.getNom()}"
							value="${utilisateurConnecte.getNom()}">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">E-mail :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="text" name="email"
							placeholder="Votre e-mail">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="email"
							placeholder="${utilisateurConnecte.getEmail()}"
							value="${utilisateurConnecte.getEmail()}">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Mot de passe :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="password" name="pwd"
							placeholder="Votre mot de passe">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="password" name="pwd"
							placeholder="${utilisateurConnecte.getPwd()}"
							value="${utilisateurConnecte.getPwd()}">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Telephone :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="text" name="telephone"
							placeholder="Votre num�ro de mobile">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="telephone"
							placeholder="${utilisateurConnecte.getTelephone()}"
							value="${utilisateurConnecte.getTelephone()}">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Adresse :</p>
				<div class="col-xs-5">
					<c:if test="${!modification}">
						<input class="form-control" type="text" name="numRue" id="numRue"
							placeholder="Votre num�ro et votre rue">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="numRue" id="numRue"
							placeholder="${utilisateurConnecte.getAdresse().getNumRue()}"
							value="${utilisateurConnecte.getAdresse().getNumRue()}">
					</c:if>

					<c:if test="${!modification}">
						<input class="form-control" type="text" name="codePostal"
							id="codePostal" placeholder="Votre code postal">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="codePostal"
							id="codePostal"
							placeholder="${utilisateurConnecte.getAdresse().getCodePostal()}"
							value="${utilisateurConnecte.getAdresse().getCodePostal()}">
					</c:if>

					<c:if test="${!modification}">
						<input class="form-control" type="text" name="ville" id="ville"
							placeholder="Votre ville">
					</c:if>
					<c:if test="${modification}">
						<input class="form-control" type="text" name="ville" id="ville"
							placeholder="${utilisateurConnecte.getAdresse().getVille()}"
							value="${utilisateurConnecte.getAdresse().getVille()}">
					</c:if>


					<c:if test="${!modification}">
						<input type="hidden" name="latitude" id="latitude">
					</c:if>
					<c:if test="${modification}">
						<input type="hidden" name="latitude" id="latitude"
							value="${utilisateurConnecte.getAdresse().getCoordonnees().getLat()}">
					</c:if>

					<c:if test="${!modification}">
						<input type="hidden" name="longitude" id="longitude">
					</c:if>
					<c:if test="${modification}">
						<input type="hidden" name="longitude" id="longitude"
							value="${utilisateurConnecte.getAdresse().getCoordonnees().getLng()}">
					</c:if>


				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Vous �tes :</p>
				<div class="col-xs-2">
					<c:if test="${!modification}">
						<label><input type="radio" id="genre_homme" name="genre"
							value="homme">Un homme</label>
						<label><input type="radio" id="genre_femme" name="genre"
							value="femme">Une femme</label>
					</c:if>
					<c:if test="${modification}">
						<c:if test="${utilisateurConnecte.getGenre()=='homme'}">
							<label><input type="radio" id="genre_homme" name="genre"
								value="homme" checked="checked">Un homme</label>
							<label><input type="radio" id="genre_femme" name="genre"
								value="femme">Une femme</label>
						</c:if>
						<c:if test="${utilisateurConnecte.getGenre()=='femme'}">
							<label><input type="radio" id="genre_homme" name="genre"
								value="homme">Un homme</label>
							<label><input type="radio" id="genre_femme" name="genre"
								value="femme" checked="checked">Une femme</label>
						</c:if>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Vous �tes fumeur :</p>
				<div class="col-xs-2">
					<c:if test="${!modification}">
						<label><input type="radio" id="fumeur_oui" name="fumeur"
							value="oui">Oui</label>
						<label><input type="radio" id="fumeur_non" name="fumeur"
							value="non">Non</label>
					</c:if>
					<c:if test="${modification}">
						<c:if test="${utilisateurConnecte.getFumeur()}">
							<label><input type="radio" id="fumeur_oui" name="fumeur"
								value="oui" checked="checked">Oui</label>
							<label><input type="radio" id="fumeur_non" name="fumeur"
								value="non">Non</label>
						</c:if>
						<c:if test="${!utilisateurConnecte.getFumeur()}">
							<label><input type="radio" id="fumeur_oui" name="fumeur"
								value="oui">Oui</label>
							<label><input type="radio" id="fumeur_non" name="fumeur"
								value="non" checked="checked">Non</label>
						</c:if>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<p class="control-label col-xs-2">Vous aimez discuter :</p>
				<div class="col-xs-2">
					<c:if test="${!modification}">
						<label><input type="radio" id="blabla_oui" name="blabla"
							value="oui">Oui</label>
						<label><input type="radio" id="blabla_non" name="blabla"
							value="non">Non</label>
					</c:if>
					<c:if test="${modification}">
						<c:if test="${utilisateurConnecte.getBlabla()}">
							<label><input type="radio" id="blabla_oui" name="blabla"
								value="oui" checked="checked">Oui</label>
							<label><input type="radio" id="blabla_non" name="blabla"
								value="non">Non</label>
						</c:if>
						<c:if test="${!utilisateurConnecte.getBlabla()}">
							<label><input type="radio" id="blabla_oui" name="blabla"
								value="oui">Oui</label>
							<label><input type="radio" id="blabla_non" name="blabla"
								value="non" checked="checked">Non</label>
						</c:if>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">

					<script type="text/javascript"
						src="https://maps.google.com/maps/api/js?key=AIzaSyD8h15txIXNmhWiH3RKAZGARhONH3ZF4WU"></script>
					<script src="scripts/GeocoderScript.js"></script>
					<c:if test="${!modification}">
						<input onclick="geocodage();" class="btn btn-lg btn-success"
							type="submit" name="Inscription" value="S'incrire" />
					</c:if>
					<c:if test="${modification}">
						<input onclick="geocodage();" class="btn btn-lg btn-success"
							type="submit" name="Inscription" value="Modifier" />
					</c:if>
				</div>
			</div>
		</form>

		<button onclick="geocodage();">Test</button>
	</div>

	<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
</body>
</html>