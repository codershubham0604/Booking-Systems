package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisplayServlet() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("In do post method of Display Image servlet.");
		String imageId=request.getParameter("Id");
		int id=Integer.parseInt(imageId);

		//getting database connection (jdbc code)
				Connection connection=null;
				int Id=0;
				String imgFileName=null;
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");
					Statement stmt;
					String query="select * from image";
					stmt=connection.createStatement();
					ResultSet rs=stmt.executeQuery(query);

					while(rs.next())
					{
						if(rs.getInt("Id")==id)
						{
							Id=rs.getInt("Id");
							imgFileName=rs.getString("imageFileName");
						}
					}

				}
				catch (Exception e)
				{
					System.out.println(e);
				}

				RequestDispatcher rd;
				request.setAttribute("id",String.valueOf(Id));  //valueOf
				request.setAttribute("img",imgFileName);
				rd=request.getRequestDispatcher("displayImage.jsp");
				rd.forward(request, response);

	}

}
