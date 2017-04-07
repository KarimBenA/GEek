<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer class="bd-footer text-muted">
	<div class="container">
		 <p> SESSION ID : <%= pageContext.getSession().getId() %> </p>
		 <p> DATE : <%=new java.util.Date()%></p>
	</div>
</footer>
