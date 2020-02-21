package com.ssec.hotelmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class checkout1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String roomno1=request.getParameter("roomno1");
		String roomno=request.getParameter("roomno");
		HttpSession session=request.getSession(false);
		String hotelid=(String)session.getAttribute("id");
		String id=(String)session.getAttribute("id");
		PrintWriter print =response.getWriter();
		response.setContentType("text/html");
		
	
		if(id=="" || id==null)
			{	
				print.print("Session logged out");
				RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
				dis.include(request, response);
			}
		else
		{
		Singleton singleton=Singleton.getsingleton();
	
		Connection con=singleton.getCon();
		String roomno2=null;
			if(fname !=null && lname !=null)
			{
		
				
				try {
					PreparedStatement pstmt=con.prepareStatement("select * from hoteldb."+hotelid+" where fname=? and lname=?");
					pstmt.setString(1,fname);
					pstmt.setString(2,lname);
					ResultSet rs=pstmt.executeQuery();
					if(rs.next())
					{
						
						 roomno2=rs.getString(9);
					}
					if(roomno2== null || roomno2=="")
					{
					RequestDispatcher dis=request.getRequestDispatcher("checkout.jsp");
					dis.include(request, response);
					print.print("Data not found try again please");
					
					}
					else
					{
						
						response.sendRedirect("checkout1.jsp");
				
					
					}
					}
		 
				catch (SQLException e)
					{
						// TODO Auto-generated catch block
						e.printStackTrace();
					
					}
			
			
			}	
			else if(roomno !=null || roomno !="")
			{
				try {
					PreparedStatement pstmt=con.prepareStatement("select * from hoteldb."+hotelid+" where roomno=?");
					pstmt.setString(1,roomno);
			
					ResultSet rs=pstmt.executeQuery();
					if(rs.next())
					{
						
						 fname=rs.getString(1);
					}
					if(fname== null || fname=="")
					{
					RequestDispatcher dis=request.getRequestDispatcher("checkout.jsp");
					dis.include(request, response);
					print.print("Data not found try again please");
					
					}
					else
					{
						
						response.sendRedirect("checkout1.jsp");
				
					
					}
					}
		 
				catch (SQLException e)
					{
						// TODO Auto-generated catch block
						e.printStackTrace();
					
					}
			}
			}
		
		
		}	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
