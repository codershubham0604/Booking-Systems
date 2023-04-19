 




<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page import="java.sql.*,java.util.*"%>



<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("path");
   String SiteTittle = null;
   String Address =null;
   String FirstName =null;
   String EmbedMapIframe = null;
   String Email = null;
   String MobileNo = null;
   String Facebook = null;
   String Twitter = null;
   String Linkedin = null;
   String GooglePlus = null;
   String image = null;

    
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      
      factory.setSizeThreshold(maxMemSize);
      
      
      factory.setRepository(new File("c:\\temp"));

       
      ServletFileUpload upload = new ServletFileUpload(factory);
      
       
      upload.setSizeMax( maxFileSize );
      
      try { 
         
         List fileItems = upload.parseRequest(request);

         
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               
               
               
               if( fileName.lastIndexOf("C:\\t") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
                  
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               System.out.println("Uploaded Filename: " + filePath + 
               fileName + "<br>");
               
            }else{
            	 String fieldName = fi.getFieldName();
            	if(fieldName.equalsIgnoreCase("SiteTittle")){
            		SiteTittle=fi.getString();
              	   
                }
            	else if(fieldName.equalsIgnoreCase("Address")){
            		Address=fi.getString();
               	   
                 }else if(fieldName.equalsIgnoreCase("FirstName")){
                	 FirstName=fi.getString();
                   	   
                     }
                 else if(fieldName.equalsIgnoreCase("EmbedMapIframe")){
                	 EmbedMapIframe=fi.getString();
                 }
                 else if(fieldName.equalsIgnoreCase("Email")){
                	 Email=fi.getString();
                 }else if(fieldName.equalsIgnoreCase("MobileNo")){
                	 MobileNo=fi.getString();
                 }else if(fieldName.equalsIgnoreCase("Facebook")){
                	 Facebook=fi.getString();
                 }else if(fieldName.equalsIgnoreCase("Twitter")){
                	 Twitter=fi.getString();
                 }else if(fieldName.equalsIgnoreCase("Linkedin")){
                	 Linkedin=fi.getString();
                 }else if(fieldName.equalsIgnoreCase("GooglePlus")){
                	 GooglePlus=fi.getString();
                 }
            	
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } 
   else 
   {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
   
   
   String id1 = request.getParameter("id");
   try 
   {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking", "root", "root");
    Statement st = conn.createStatement();
    System.out.print("insert into generalsetting (SiteTittle,Address,EmbedMapIframe,Email,MobileNo,Facebook,Twitter,Linkedin,GooglePlus,image) values ('" + SiteTittle + "','" + Address + "','" + EmbedMapIframe + "','" + Email + "','" + MobileNo + "','" + Facebook + "','" + Twitter + "','" + Linkedin + "','" + GooglePlus + "','" + image + "')");
     st.executeUpdate("insert into generalsetting (SiteTittle,Address,EmbedMapIframe,Email,MobileNo,Facebook,Twitter,Linkedin,GooglePlus,image) values ('" + SiteTittle + "','" + Address + "','" + EmbedMapIframe + "','" + Email + "','" + MobileNo + "','" + Facebook + "','" + Twitter + "','" + Linkedin + "','" + GooglePlus + "','" + image + "')");
    
   }
   catch (Exception e) 
   {
    System.out.print(e);
    e.printStackTrace();
   } 
    
   response.sendRedirect("index.jsp?id="+id1);
   
   
%>



















 

 
 
 