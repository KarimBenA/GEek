<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p>Veuillez vous connecter en saisissant votre email et votre mot de
	passe</p>

<%= pageContext.getSession().getId() %>
<%--= pageContext.getSession().getAttribute("error") --%>
<c:if test="${error != \"\" }">${error}</c:if>


<form method="post" action="Connection" class="col-lg-3">

	<p>
		Email : <input type="email" name="email"
			placeholder="email@domain.com" class="form-control">
	</p>

	<p>
		Mot de passe : <input type="password" name="pwd" placeholder="pwd"
			class="form-control">
	</p>

	<br /> <input type="submit" value="Connexion"
		class="btn btn-lg btn-success" /> <br />

	<%--  <p class="${statusOK ? 'succes' : 'erreur'}">${statusMessage}</p>   --%>
</form>