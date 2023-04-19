
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Service List</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

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
	Statement sst = conn.createStatement();

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
	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
		statement = connection.createStatement();
		String sql = "select * from book where id=" + id6;
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>









	<%
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
	</aside>
	<!-- End Sidebar-->

	<!-- End Sidebar-->

	<%
	String Title = request.getParameter("Title");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
	Statement st = conn.createStatement();

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
		<button type="button" class="btn btn-primary"
			onclick="Export('export1')">Export Table</button>

	</p>

	<h2 align="center">
		<font><strong> All Service List</strong></font>
	</h2>
	<table align="center" border="2" widht="100%" id="export1">
		<tr>

		</tr>
		<tr style="background-color: white">
			<td><b>Title</b></td>
			<br>
			<td><b>Descp</b></td>
			<td><b>Price Per (Credit)</b></td>
			<td><b>Duration</b></td>

			<td><b>Max Spot Limit</b></td>
			<td><b>Close Booking</b></td>
			<td><b>Service Type</b></td>
			<td><b>Start Date</b></td>
			<td><b>End Date</b></td>
			<td><b>Start Time</b></td>
			<td><b>End Time</b></td>

		</tr>

		<%
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
			statement = connection.createStatement();
			String sql = "SELECT * FROM  addservice";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
		%>
		<tr bgcolor="white">

			<td><%=resultSet.getString("Title")%></td>
			<td><%=resultSet.getString("Descp")%></td>
			<td><%=resultSet.getString("PriceCredit")%></td>
			<td><%=resultSet.getString("Duration")%></td>
			<td><%=resultSet.getString("MaxSpotLimit")%></td>
			<td><%=resultSet.getString("CloseBooking")%></td>
			<td><%=resultSet.getString("ServiceType")%></td>
			<td><%=resultSet.getString("StartDate")%></td>
			<td><%=resultSet.getString("EndDate")%></td>
			<td><%=resultSet.getString("StartTime")%></td>
			<td><%=resultSet.getString("EndTime")%></td>
		</tr>

		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	<br>

	<jsp:include page="Footer.jsp"></jsp:include>

</body>

</html>