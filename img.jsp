 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 
 


<%
String SiteTittle = request.getParameter("SiteTittle");
out.print("hiii"+SiteTittle);
String Address = request.getParameter("Address");
String EmbedMapIframe = request.getParameter("EmbedMapIframe");
String Email = request.getParameter("Email");
String MobileNo = request.getParameter("MobileNo");
String Facebook = request.getParameter("Facebook");
String Twitter = request.getParameter("Twitter");
String Linkedin = request.getParameter("Linkedin");
String GooglePlus = request.getParameter("GooglePlus");
String image = request.getParameter("image");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%> 

<h2 align="center"><font><strong> All Date Data </strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
   
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statement=connection.createStatement();
String sql ="SELECT * FROM  generalsetting";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
 
//SELECT StartDate, name, title FROM addservice LEFT JOIN tt ON addservice.StartDate = tt.StarttoDate
 

while(resultSet.next()){
%>


 <tr bgcolor="#DEB887">
 
<td><%=resultSet.getString("image") %></td>
 
 
</tr>
 

<% 
}

} catch (Exception e)
{
e.printStackTrace();
}
%>













 
 
