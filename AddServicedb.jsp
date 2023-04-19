 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%


String id = request.getParameter("id");
String Title = request.getParameter("Title");
String Descp = request.getParameter("Descp");
String PriceCredit = request.getParameter("PriceCredit");
String Duration = request.getParameter("Duration");
String MaxSpotLimit = request.getParameter("MaxSpotLimit");
String CloseBooking = request.getParameter("CloseBooking");
String ServiceType = request.getParameter("ServiceType");
String StartDate = request.getParameter("StartDate");
String EndDate = request.getParameter("EndDate");
String StartTime = request.getParameter("StartTime");
String EndTime = request.getParameter("EndTime");

 
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
 Statement st = conn.createStatement();
 System.out.print("insert into AddService (Title,Descp,PriceCredit,Duration,MaxSpotLimit,CloseBooking,ServiceType,StartDate,EndDate,StartTime,EndTime) values ('" +Title + "','" + Descp + "','" + PriceCredit + "','" + Duration + "','" + MaxSpotLimit + "','" + CloseBooking + "','" + ServiceType + "','" + StartDate + "','" + EndDate + "','" + StartTime + "','" + EndTime + "')");
 int i = st.executeUpdate("insert into AddService (Title,Descp,PriceCredit,Duration,MaxSpotLimit,CloseBooking,ServiceType,StartDate,EndDate,StartTime,EndTime) values ('" +Title + "','" + Descp + "','" + PriceCredit + "','" + Duration + "','" + MaxSpotLimit + "','" + CloseBooking + "','" + ServiceType + "','" + StartDate + "','" + EndDate + "','" + StartTime + "','" + EndTime + "')");
 
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