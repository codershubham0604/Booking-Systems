<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String OnlineListName = request.getParameter("OnlineListName");
 

 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into OnlineUserList (OnlineListName) values ('" + OnlineListName + "')");
 int i = st.executeUpdate("insert into OnlineUserList (OnlineListName) values ('" + OnlineListName + "')");
 
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