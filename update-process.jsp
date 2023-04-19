 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/employee";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("id");
String email=request.getParameter("email");
String password=request.getParameter("password");
String FirstName=request.getParameter("FirstName");
String LastName=request.getParameter("LastName");

//String address=request.getParameter("address");
//String contactno=request.getParameter("contactno");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
String sql="Update register set id=?,email=?,password=?,FirstName=?,LastName=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);

ps.setString(1, email);
ps.setString(2, password);
ps.setString(3, FirstName);
ps.setString(4, LastName);
 

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