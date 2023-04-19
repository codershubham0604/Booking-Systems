 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Booking List</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
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
  
</head>

<body>
 <jsp:include page="Header.jsp"></jsp:include>
           <%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement sst=conn.createStatement();
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
  <%
						String id6 = request.getParameter("id");
					Connection connectionn = null;
						Statement statementt = null;
						ResultSet resultSett = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id6;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
<%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %>     

<%
String Title = request.getParameter("Title");
Class.forName("com.mysql.jdbc.Driver");
Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement st=conn.createStatement();
Connection connectionnn = null;
Statement statementtt = null;
ResultSet resultSettt = null;
%>
<br>
<br>
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
<h2 align="center"><font><strong> All Booking List </strong></font></h2>
<table align="center"  border="2" widht="100%"  id="export1">
<tr>

</tr>
<tr style="background-color: white">
 <td><b>Service</b></td>
<td><b>User Name </b></td>
<td><b>Booking Name</b></td>
<td><b>Booking Email</b></td>
<td><b>Booking Mobile</b></td>
<td><b>Date</b></td>
<td><b>Status</b></td>
 <td><b>Action</b></td>
  
 
</tr>
 
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statement=connection.createStatement();
String sql ="SELECT * FROM  Bookinglistlist";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="white">

<td><%=resultSet.getString("Service") %></td>
<td><%=resultSet.getString("Username") %></td>
<td><%=resultSet.getString("BookingName") %></td>
<td><%=resultSet.getString("BookingEmail") %></td>
<td><%=resultSet.getString("BookingMobile") %></td>
<td><%=resultSet.getString("Date") %></td>
<td><%=resultSet.getString("Status") %></td>
<td><a href="delete1.jsp?id=<%=resultSet.getString("id") %>"><button type="button"  style="background-color:red;color:white;width:70px;height:30px;"   class="delete" onclick="window.location='userlist.jsp';">Delete</button></a></td>
 <td><input type="button"  data-toggle="modal" data-target="#myModal<%=resultSet.getString("id") %>" value="Edit" style="background-color:red;color:white;width:70px;height:30px;">
 <div class="modal fade" id="myModal<%=resultSet.getString("id") %>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title">Edit Booking List</h4>
        </div>
            <div class="modal-body">
        <form action="bookinglistupdate.jsp?id=<%=resultSet.getString("id") %>" method="post">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Service:</label>
            <input type="text" class="form-control" id="recipient-name" name="Service">
          </div>        
           <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Username:</label>
            <input type="text" class="form-control" id="recipient-name" name="username">
          </div>
          
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">BookingName:</label>
            <input type="text" class="form-control" id="recipient-name" name="BookingName">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">BookingEmail:</label>
            <input type="text" class="form-control" id="recipient-name" name="BookingEmail">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">BookingMobile:</label>
            <input type="text" class="form-control" id="recipient-name" name="BookingMobile">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Date:</label>
            <input type="date" class="form-control" id="recipient-name" name="Date">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Status:</label>
            <input type="text" class="form-control" id="recipient-name" name="Status">
          </div>
      </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary"  >Save changes</button>  
        </div>
            </form>
      </div>
      
    </div>
  </div>
</td>
</tr>
 
<% 
}
} catch (Exception e)
{
e.printStackTrace();
}
%>
</table>
<br><br><br><br><br><br><br><br>
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
   <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>