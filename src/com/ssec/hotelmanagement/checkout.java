package com.ssec.hotelmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkout
 */
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session =request.getSession();
		String id=(String) session.getAttribute("id");
		PrintWriter print=response.getWriter();
		if(id=="" || id==null)
		{	
			print.print("Session logged out");
			RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
			dis.include(request, response);
		}
		else
		{
		String roomno=(String) session.getAttribute("roomno");
		Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);  
	    String totalamount=null;
	    System.out.println(id);
	    System.out.println(roomno);
				Singleton singleton =Singleton.getsingleton();
				Connection con =singleton.getCon();
				
				try {
					PreparedStatement pstmt = con.prepareStatement("select * from  hoteldb."+id+" where roomno=?");
					pstmt.setString(1,roomno);
					ResultSet rs=pstmt.executeQuery();
					if(rs.next())
					{
						totalamount=rs.getString(3);
					}
					System.out.println("111");
					PreparedStatement pstmt1 = con.prepareStatement("update  hoteldb."+id+ "  set checkout=?,pendingamount='0',paidamount=? where roomno=? ");
					pstmt1.setString(3,roomno);
					pstmt1.setString(1,strDate);
					pstmt1.setString(2,totalamount);
					int i=pstmt1.executeUpdate();
					if(i>=0)
					{int totalroom=0;
						String msg1=("Checkout Successfully");
						request.setAttribute("msg1", msg1);
						RequestDispatcher di=request.getRequestDispatcher("checkout.jsp");
						di.include(request,response);
						PreparedStatement pstmt3=con.prepareStatement("select * from hoteldb.hoteldetails ");
						ResultSet rs1=pstmt3.executeQuery();
						if(rs1.next())
						{
							 totalroom=rs1.getInt(5);
						}
						totalroom++;
						PreparedStatement pstmt4=con.prepareStatement("update hoteldb."+id+"room set avaibleroom=?");
						pstmt4.setInt(1,totalroom);
						pstmt4.executeUpdate();
					}
					
				} 
				
				catch (SQLException e) {
					System.out.println("sql");
				}
				
						
						
						
						
		}			
						
				
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
