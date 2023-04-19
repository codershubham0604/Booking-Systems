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
String Status=request.getParameter("Status");
System.out.println("Status"+Status);
 
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
 
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
String sql="Update Transactionlist set id=?,Status=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, Status);
 

int i = ps.executeUpdate();
if(i > 0)
{
System.out.print("Status Updated Successfully");
response.sendRedirect("Transactionlist.jsp?id="+id);

 
 


}
else
{
System.out.print("There is a problem in updating Record.");
 
} 

}

catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>