<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;  
  background-color: pink;  
}  
button {   
       background-color: #4CAF50;   
       width: 100%;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
 form {   
        border: 3px solid #f1f1f1;   
    }   
 input[type=text], input[type=password],input[type=email],input[type=tel] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
 button:hover {   
        opacity: 0.7;   
    }   
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {   
        padding: 25px;   
        background-color: lightblue;  
    }   
</style>   


</head>
<body>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
Statement st=conn.createStatement();



Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
statement=connection.createStatement();
String sql ="select * from register where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<center><h1>UPDATE EMPLOYEE DATA </h1></center>
<form method="post" action="update-process.jsp">
<div class="container">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<label>Employee I'd: </label>  
<input type="text" name="id" value="<%=resultSet.getString("id") %>">   
            <label>First Name: </label>   
            <input type="text" placeholder="Enter FirstName" name="firstname" required  value="<%=resultSet.getString("firstname") %>">  
            <label>Last Name : </label>   
            <input type="text" placeholder="Enter LastName" name="lastname" required value="<%=resultSet.getString("lastname") %>">  
            <label>Email: </label>   
            <input type="email" placeholder="Enter Email I'd" name="email" required value="<%=resultSet.getString("email") %>">  
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="password" required value="<%=resultSet.getString("password") %>">  
           
           <label>Address: </label>   
            <input type="text" placeholder="Enter Address" name="address" required value="<%=resultSet.getString("address") %>">  
            <label>Contact No: </label>   
            <input type="tel" placeholder="Enter Contact No." name="contactno" required value="<%=resultSet.getString("contactno") %>">  
           
            <button type="submit">Update</button>   
            <input type="checkbox" checked="checked"> Remember me   
            <button type="button" class="cancelbtn" onclick="window.location='update.jsp';"> Cancel</button>   
            Login: <a href="alluser.jsp"> Login user:- </a>   
        </div>   
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>


 