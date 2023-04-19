<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
 
try 
{
	String email = request.getParameter("email");

	String password = request.getParameter("password");
	 Connection conn=null;
	 Statement st=null;
	 boolean status=false;
	 ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 st = conn.createStatement();

    rs = st.executeQuery("select id,email,password  from book where email='" + email + "' and password='" + password + "'");




while(rs.next()){
	status=true;
 if ((rs.getString("password").equals(password)) && (rs.getString("email").equals(email)))  {

	 
 System.out.println("Welcome "+email); 
System.out.println("Password "+password);
	  


 	
	 String id = rs.getString("id");
	 System.out.println("id "+id);
	 
		response.sendRedirect("index.jsp?id="+id);

  
	  

 } 
 if(status == false)
 {
	 
	System.out.println("Invalid password or username.");
	 response.sendRedirect("pages-login.jsp");
	}
 
}
}
catch (Exception e) 
{
	e.printStackTrace();
	
	//System.out.println("Invalid password or username.");
}


%>

 
