<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String id1 = request.getParameter("id");

System.out.println("id "+id1);
String CurrencyCode = request.getParameter("CurrencyCode");
String PricePercredit = request.getParameter("PricePercredit");
 
 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into paymentsetting (CurrencyCode,PricePercredit) values ('" + CurrencyCode + "','" + PricePercredit + "')");
 int i = st.executeUpdate("insert into paymentsetting (CurrencyCode,PricePercredit) values ('" + CurrencyCode + "','" + PricePercredit + "' )");
 
 if ( i>0 )
 {
 //out.println("Thank you for register ! Please <a href='login.jsp'>Login</a> to continue.");
	 response.sendRedirect("index.jsp?id="+id1);
 }
 else
 {
	 //out.println("Try Again");
	 response.sendRedirect("index.jsp?id="+id1);
 }
}
catch (Exception e) 
{
 System.out.print(e);
 e.printStackTrace();
}
%>