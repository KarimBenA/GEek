<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/"/>">Acceuil</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value="/AllUsers"/>">Afficher les
						utilisateurs</a></li>
				<li><a href="<c:url value="/MapsTest"/>">Page de test
						MAPS</a></li>
				<li><a href="<c:url value="/AddUser"/>">Créer un nouvel
						utilisateur</a></li>
				<c:if test="${!connecte }"><li><a href="<c:url value="/Connection"/>">Se connecter</a></li></c:if>
				<c:if test="${connecte }">
				<li><a href="<c:url value="/Profil"/>">${utilisateurConnecte.getPrenom()} ${utilisateurConnecte.getNom()}</a></li>
				<li><a href="<c:url value="/Deconnection"/>">Se déconnecter</a></li>
				</c:if>
			</ul>
		</div>
		<%--/.nav-collapse --%>
	</div>

</nav>

