<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 
 <%@page import="com.admin.*"%>
 <%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Currency List</title>
        
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
        
        
         <style>
        body{
            padding: 50px;
        }
    </style>     
         
    </head>
   
    <body>
    
    <jsp:include page="Header.jsp"></jsp:include> 
    <br>
    <br>
    
 <p align="right">
 
 <a href="Currencylist.jsp?id=1"><button type="button"  class="btn btn-primary" >Export All Data</button>
   </a>
<button type="button"  class="btn btn-primary" onclick="Export('export1')">Export Table</button>

</p>  

       <%@page import="java.sql.*,java.util.* "%>
       
       <table id="export1">
       
       <tr>
        <%  
        String spageid=request.getParameter("page");  
        int pageid=Integer.parseInt(spageid);  
        int total=5;
        if(pageid!=1){  
            pageid=pageid-1;  
            pageid=pageid*total+1;  
        }  
        List<Emp> list=EmpDao.getRecords(pageid,total);  
        out.print("<h5>Page No: "+spageid+"</h5>");  
        out.print("<table border='1' cellpadding='4' width='60%' >");  
        out.print("<tr><th>Id</th><th>CurrencyName</th><th>CurrencyCode</th>");  
        for(Emp e:list){  
            out.print("<tr><td>"+e.getId()+"</td><td>"+e.getCurrencyName()+"</td><td>"+e.getCurrencyCode()+"</td></tr>");  
        }  
        out.print("</table>");  
        %>  
        <br>
          </tr>
  
  </table>    
      <%
try
{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","root");     
    Statement st=con.createStatement();
    st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM AddCurrency");
    rs = st.executeQuery("SELECT COUNT(*) FROM AddCurrency");
     
    rs.next();
    double rowCount = rs.getInt(1);
    System.out.println(rowCount);
int j= 1;
    double i = rowCount/5;
    double x = i- Math.floor(i);
    System.out.println("Hello"+i);
    System.out.println("YYYY"+x);
     
    
   for(j=1; j<=i; j++)
   {
	   System.out.println("VNS India"+j);%>
	   
	   
	     		 
<a href="view.jsp?id=1&page=<%=j%>"><%=j%></a>	     
  <%  
  }
  if(x>0.0)
  {%>
	  <a href="view.jsp?id=1&page=<%=j%>"><%=j%></a> <br>  	   
<% }
  %>    
<%
}
catch (Exception e){
    e.printStackTrace();
  }
  %>   
  <br>
  <br>
  <br>
  <br>  
    <jsp:include page="Footer.jsp"></jsp:include>
        
    </body>
</html>