<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<script type="text/javascript">
function onSubmit() {
alert("Are you want to Delete");

window.location.href = "UserVerify";
}
</script>
<%
try 
{
String email = request.getParameter("email");
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select id,email,password from book where email='" + email + "' and password='" + password + "'");
if (rs.next())
{
	 //rs.getString(password);

	 //System.out.print("JJ"+password);
	 //System.out.println("Welcome "); 
	// System.out.println("Password "+password);
	  
	// String id = request.getParameter("id");
	 //System.out.println("id "+id);
       String id1 = rs.getString("id");
	 System.out.println("id "+id1);
	 response.sendRedirect("index.jsp?id="+id1);
	 
	//out.println("Welcome "+email); 
	  
	 //out.println("Your Password is "+password); 
	 
	 //session.setAttribute("email", email);
	 
	// response.sendRedirect("Logged.jsp");
	 
 	//session.setAttribute("email",email);  
 	
 //String emaill = rs.getString("email");
 	
 	//response.sendRedirect("UserVerify?email="+email);
	 //response.sendRedirect("Logged.jsp");
 
	   }  
	  
else 
 {
	 System.out.println("Invalid password or username.");
	response.sendRedirect("pages-login.jsp");
 
 }
 
}
catch (Exception e) 
{
	e.printStackTrace();
	 
}
%>
 