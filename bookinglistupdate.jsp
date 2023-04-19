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
String Service=request.getParameter("Service");
String username=request.getParameter("username");
String BookingName=request.getParameter("BookingName");
String BookingEmail=request.getParameter("BookingEmail");
String BookingMobile=request.getParameter("BookingMobile");
String Date=request.getParameter("Date");
String Status=request.getParameter("Status");
 

 
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int ID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
String sql="Update bookinglistlist set Service=?,username=?,BookingName=?,BookingEmail=?,BookingMobile=?,Date=?,Status=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, Service);
ps.setString(2, username);
ps.setString(3, BookingName);
ps.setString(4, BookingEmail);
ps.setString(5, BookingMobile);
ps.setString(6, Date);
ps.setString(7, Status);
 
 

int i = ps.executeUpdate();


out.print("Record Delete");
 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>