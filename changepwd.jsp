<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%

String id = request.getParameter("id");
System.out.println("id"+id);



String password = request.getParameter("password");
String newpass = request.getParameter("newpassword");
String conpass = request.getParameter("conpassword");


Connection con = null;
Statement st = null;
String pass = "";
//int id = 0;




try {
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/booking";
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
st = con.createStatement();
ResultSet rs = st.executeQuery("select * from book where password= '"+ password + "'");
if (rs.next()) { 
pass = rs.getString("password");
} 
if(newpass.equals(conpass))
{
if (pass.equals(password)) {
st = con.createStatement();
int i = st.executeUpdate("update book set password='"+ newpass + "' where id="+id);
response.sendRedirect("index.jsp?id="+id);
 
 



} else {
out.println("Old Password doesn't match");
}
 
}
} catch (Exception e) {
out.println(e);
}
%>