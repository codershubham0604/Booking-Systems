 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String id = request.getParameter("id");
String CurrencyName = request.getParameter("CurrencyName");
String CurrencyCode = request.getParameter("CurrencyCode");


 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into AddCurrency (CurrencyName,CurrencyCode) values ('" + CurrencyName + "','" + CurrencyCode + "')");
 int i = st.executeUpdate("insert into AddCurrency (CurrencyName,CurrencyCode) values ('" + CurrencyName + "','" + CurrencyCode + "')");
 
 if ( i>0 )
 {
 //out.println("Thank you for register ! Please <a href='login.jsp'>Login</a> to continue.");
 response.sendRedirect("index.jsp?id="+id);
 }
 else
 {
	 //out.println("Try Again");
	 response.sendRedirect("index.jsp?id="+id);
 }
}
catch (Exception e) 
{
 System.out.print(e);
 e.printStackTrace();
}
%>