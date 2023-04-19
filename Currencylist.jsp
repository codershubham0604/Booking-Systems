 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
 
<script type="text/javascript">
function onSubmit() {
alert("Are you want to Delete");
}
</script>

<script type="text/javascript">
            function Export(tableID, filename = '') {
                var downloadurl;
                var dataFileType = 'application/vnd.ms-excel';
                var tableSelect = document.getElementById(tableID);
                var tableHTMLData = tableSelect.outerHTML.replace(/ /g, '%20');
                // Specify file name
                filename = filename ? filename + '.xls' : 'export_excel_data.xls';
                // Create download link element
                downloadurl = document.createElement("a");
                document.body.appendChild(downloadurl);
                
                if (navigator.msSaveOrOpenBlob) {
                    var blob = new Blob(['\ufeff', tableHTMLData], {
                        type: dataFileType
                    });
                    navigator.msSaveOrOpenBlob(blob, filename);
                } else {
                    // Create a link to the file
                    downloadurl.href = 'data:' + dataFileType + ', ' + tableHTMLData;

                    // Setting the file name
                    downloadurl.download = filename;
                    //triggering the function
                    downloadurl.click();
            }
            }

        </script>


 <title>Currency List</title>
</head>

<body>
<jsp:include page="Header.jsp"></jsp:include>
   

<%
String Title = request.getParameter("Title");
Class.forName("com.mysql.jdbc.Driver");
Connection connc = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement st=connc.createStatement();
Connection connectionnn = null;
Statement statementtt = null;
ResultSet resultSettt = null;
%>

<br>
<br>
<br>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

 <p align="right">
<button type="button"  class="btn btn-primary" onclick="Export('export1')">Export Table</button>
   
</p>  

<h2 align="center"><font><strong> All Currency List </strong></font></h2>
<table align="center"  border="2" widht="100%"  id="export1">

<tr style="background-color: white">
<th>Name</th>
<th>Code</th>
<th>Status</th>
 
</tr>
 
<%
String id2 = request.getParameter("id2");

try{ 
Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement stm=conn1.createStatement();
String sql ="SELECT * FROM  addcurrency";

ResultSet rs = stm.executeQuery(sql);
while(rs.next()){
%>
<tr style="background-color: white">

 <td><%=rs.getString("CurrencyName") %></td>
<td><%=rs.getString("CurrencyCode") %></td>
<td>NA</td>
 
<!--
   
   <script>
	function run() {

		// Creating Our XMLHttpRequest object
		var xhr = new XMLHttpRequest();

		// Making our connection
		var url = ;
		xhr.open("GET", url, true);

		// function execute after request is successful
		xhr.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
			}
		}
		// Sending our request
		xhr.send();
	}
	run();
</script>
  -->
   
</tr>

<% 
}

} catch (Exception e)
{
e.printStackTrace();
}
%>
 
</table>
 <br>
  
<br>
    <jsp:include page="Footer.jsp"></jsp:include>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

</body>

</html>







 












