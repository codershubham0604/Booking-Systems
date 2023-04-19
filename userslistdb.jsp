<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String UsersListName = request.getParameter("UsersListName");
 

 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into UsersList (UsersListName) values ('" + UsersListName + "')");
 int i = st.executeUpdate("insert into UsersList (UsersListName) values ('" + UsersListName + "')");
 
 if ( i>0 )
 {
 //out.println("Thank you for register ! Please <a href='login.jsp'>Login</a> to continue.");
 response.sendRedirect("pages-login.jsp");
 }
 else
 {
	 //out.println("Try Again");
	 response.sendRedirect("index.jsp");
 }
}
catch (Exception e) 
{
 System.out.print(e);
 e.printStackTrace();
}
%>