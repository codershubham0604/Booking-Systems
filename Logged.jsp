<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
  
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Success</title>
	</head>
	<body>
		<%
		
				String email = (String)session.getAttribute("email");
				if (email != null)
				{
					
					System.out.println("Hello"+email);
		%> 
				<jsp:forward page="index.jsp?id=1"/>
		<%	
				}
				else
				{
					System.out.println("Hey"+email);
					%>
					 
					<jsp:forward page="pages-login.jsp"/>
				<%}
		%> 
	</body>
</html>
