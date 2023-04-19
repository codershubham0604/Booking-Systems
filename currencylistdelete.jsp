<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String id2=request.getParameter("id2");

System.out.println("hhhhh"+id2);
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM addcurrency WHERE id="+id);
//out.println("Data Deleted Successfully!");
 out.print("record Deleted");
//response.sendRedirect("index.jsp" );
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>