package com.ssec.hotelmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {
	
    
	private static final long serialVersionUID = 1L;

       
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
					String id=request.getParameter("id");
					String password=request.getParameter("password");
					PrintWriter print =response.getWriter();
					
				
						
							try {
							
							
								Singleton singleton=Singleton.getsingleton();
								Connection con =singleton.getCon();
							
								PreparedStatement pstmt=con.prepareStatement("select hotelid,password from hoteldb.hoteldetails where hotelid='"+id+"' and password='"+password+"'");
								 ResultSet result=pstmt.executeQuery();

								
								 
								 
								 if (result.next())
								 {
									 response.sendRedirect("Home.jsp");
									HttpSession httpSession = request.getSession(true);
									httpSession.setAttribute("id", id);
									
									 
									 
								 }
								 else
								 {
									 print.println("User name or Password is invalid");
									 RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
									 dis.include(request, response);
								 }
								 
								
								
								
								
								
								
								
							} 
							
							
							catch (SQLException e) {
								System.out.println("sql exception");
							}
							
							
										
	}
		
		
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
}