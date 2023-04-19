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
String password=request.getParameter("password");
 
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
String sql="Update book set id=?,password=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, password);
 

int i = ps.executeUpdate();
if(i > 0)
{
System.out.print("Record Updated Successfully");
response.sendRedirect("index.jsp");
}
else
{
System.out.print("There is a problem in updating Record.");
response.sendRedirect("update.jsp");
} 

}

catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>