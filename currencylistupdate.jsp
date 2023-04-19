<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/booking";%>
<%!String user = "root";%>
<%!String psw = "root";%>



<%
String id = request.getParameter("id");
System.out.println("id"+id);
String CurrencyName=request.getParameter("CurrencyName");
String CurrencyCode=request.getParameter("CurrencyCode");
 
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int ID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
String sql="Update addcurrency set CurrencyName=?,CurrencyCode=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, CurrencyName);
ps.setString(2, CurrencyCode);
 

int i = ps.executeUpdate();


response.sendRedirect("Currencylist.jsp");
 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>