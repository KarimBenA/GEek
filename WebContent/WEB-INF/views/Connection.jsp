<%@ page 	language="java" 
			contentType="text/html; charset=ISO-8859-1"
    		pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<c:import url="/WEB-INF/views/subviews/ImportBootstrap.jsp" />
		<title>Connexion</title>
	</head>
	
	<body>
	<c:if test="${wrongIDS==true}">
		<script>alert("Erreur d'identifiants, essayez à nouveau")</script>
		<c:set var="wrongIDS" scope="session" value="${false}"></c:set>
	</c:if>
	
		<c:import url="/WEB-INF/views/subviews/Menu.jsp" />
		
			<div class="container">
				<h2>Connexion</h2>
				<br /><br />
				
				<form class="form-horizontal" method="post" action="Connection" >
				
					<div class="form-group">
							<p class="control-label col-xs-2">Email :</p>
							<div class="col-xs-5">
								<input class="form-control" type="email" name="email" placeholder="email@domain.com">
							</div>
					</div>
					<div class="form-group">
							<p class="control-label col-xs-2">Mot de passe : </p>
							<div class="col-xs-5">
								<input class="form-control" type="password" name="pwd" placeholder="pwd" class="form-control">
							</div>
					</div>

					<br />
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input class="btn btn-lg btn-success"  type="submit" value="Connexion"/>
						</div>
					</div>
					
					<br /><br /><br /><br />
				</form>
				
			</div>
	
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
</html>