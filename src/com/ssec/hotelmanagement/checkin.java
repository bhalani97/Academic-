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

/**
 * Servlet implementation class checkin
 */
public class checkin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=" . ";
		System.out.println(msg);
		String fname =request.getParameter("fname");
		String lname=request.getParameter("lname");
		String totalamount=request.getParameter("totalamount");
		String paidamount=request.getParameter("paidamount");
		String checkin=request.getParameter("checkin");
		String roomno=request.getParameter("roomno");
		String totalperson=request.getParameter("totalperson");
		int t=Integer.parseInt(totalamount);
		int p=Integer.parseInt(paidamount);
		int pendingamount=t-p;
		HttpSession session =request.getSession();
		String hotelid=(String) session.getAttribute("id");
		
		Singleton singleton =Singleton.getsingleton();
		Connection con= singleton.getCon();
		request.setAttribute("msg", msg);
		try {
			PrintWriter print=response.getWriter();
			PreparedStatement pstmt = con.prepareStatement("insert into hoteldb."+hotelid+" (fname,lname,totalamount,paidamount,pendingamount,checkin,roomno,person) values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1,fname);
			pstmt.setString(2,lname);
			pstmt.setString(3,totalamount);
			pstmt.setString(4,paidamount);
			pstmt.setInt(5,pendingamount);
			pstmt.setString(6,checkin);
			pstmt.setString(7,roomno);
			pstmt.setString(8,totalperson);
			int i=pstmt.executeUpdate();
			
				if(i==1)
				{	int totalroom=0;
					 msg ="Check In Successfully";
					request.setAttribute("msg", msg);
					RequestDispatcher dis=request.getRequestDispatcher("checkin1.jsp");
					dis.forward(request, response);
					PreparedStatement pstmt1=con.prepareStatement("select *  from hoteldb."+hotelid+"room ");
					ResultSet rs=pstmt1.executeQuery();
					if(rs.next())
					{
						 totalroom=rs.getInt(1);
						 System.out.println(totalroom);
					}
					totalroom=totalroom-1;
					PreparedStatement pstmt2=con.prepareStatement("update hoteldb."+hotelid+"room set avaibleroom=?");
					pstmt2.setInt(1,totalroom);
					pstmt2.executeUpdate();
					System.out.println(totalroom);
				}			
				else
				{	print.println("Oooops Something Went Wrong Please Try again");
					RequestDispatcher dis=request.getRequestDispatcher("checkin1.jsp");
					dis.include(request, response);
							}
			
			
		} catch (SQLException e) {
			System.out.println("sql exception");
		}
				
		
		
			
		
		
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
