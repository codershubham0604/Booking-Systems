<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%> 
    
    
    
 <html>
<head>
<title> Validate the Password </title>
</head>
<script language="javascript">
function fncSubmit()
{

if(document.ChangePasswordForm.password.value == "")
{
alert('Please input Old password');
document.ChangePasswordForm.password.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input Password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>

<body>


							<%
						String id = request.getParameter("id");
					Connection connection = null;
						Statement statement = null;
						ResultSet resultSet = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
 

 
 
     
   <form onsubmit ="return validateForm()" action="changepassworddb.jsp">
                         <input type="text" placeholder="Enter FirstName" name="id" class="form-control" id="password" required  value="<%=resultSet.getString("id") %>">
    					    
                     
                     
                         <td> Create Password* </td>
<input name="password" type = "password" id = "pswd1" value = ""> 
<span id = "message1" style="color:red"> </span> <br><br>

 
<td> Confirm Password* </td>
<input type = "password" id = "pswd2" value = ""> 
<span id = "message2" style="color:red"> </span> <br><br>

<!-- Click to verify valid password -->
<input type = "submit" value = "Submit">

<!-- Click to reset fields -->

                    
                  </form>
                  
                  
                  
                  <form name="ChangePasswordForm" method="post" action="changepwd.jsp" OnSubmit="return fncSubmit();">

<table border="1" align="center" bgcolor="#2B60DE">

<tr>
<td>OLD PASSWORD</td>
<TD><input name="password" type="password" id="OLDpwd" size="20"></td>
</tr>
<tr>
<td>NewPassword</td>
<td><input name="newpassword" type="password" id="newpassword">
</td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input name="conpassword" type="password" id="conpassword">
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Save"></td>
</tr>
<button type = "reset" value = "Reset" >Reset</button>
</table>
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






    
                              

 
 