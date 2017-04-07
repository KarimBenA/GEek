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
	
		<div class="container">
			<div class="starter-template">
			
			<header class="bd-pageheader text-center">
				<h1>get GEeK'ed</h1>
			</header>
				
				
				<div class="jumbotron">
					CARTEGOOGLEMAP
				</div>
				
				<div class="well">
					<h4>Lorem Ipsum</h4>
					<p>	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras laoreet mollis dui, quis 
						convallis velit consectetur vitae. Integer congue porttitor odio nec rutrum. Pellentesque 
						et libero in metus congue sodales. Suspendisse volutpat nulla non nunc porttitor, pulvinar
					 	dictum augue tincidunt. Etiam ante lacus, consectetur et felis et, viverra feugiat turpis. 
					 	Ut quis ipsum non enim euismod suscipit vel ac urna. Etiam mattis eget leo id elementum. 
					 </p>
				</div>
				
				<c:if test="${error != \"\" }">${error}</c:if>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/subviews/Footer.jsp" />
	</body>
</html>