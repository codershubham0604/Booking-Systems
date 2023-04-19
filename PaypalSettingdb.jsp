 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id= request.getParameter("id");
String PaymentMode = request.getParameter("PaymentMode");
String SendBox = request.getParameter("SendBox");
String Client = request.getParameter("Client");
String SendBoxSecret = request.getParameter("SendBoxSecret");
String LineClient = request.getParameter("LineClient");
String LiveSecret = request.getParameter("LiveSecret");
 
 
 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into paypalsetting (PaymentMode,SendBox,Client,SendBoxSecret,LineClient,LiveSecret) values ('" + PaymentMode + "','" + SendBox + "','" + Client + "','" + SendBoxSecret + "','" + LineClient + "','" + LiveSecret + "')");
 int i = st.executeUpdate("insert into paypalsetting (PaymentMode,SendBox,Client,SendBoxSecret,LineClient,LiveSecret) values ('" + PaymentMode + "','" + SendBox + "','" + Client + "','" + SendBoxSecret + "','" + LineClient + "','" + LiveSecret + "' )");
 
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