package com.ssec.hotelmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.SQLError;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String hotelname =request.getParameter("hotelname");
		String hotelid =request.getParameter("id");
		String password =request.getParameter("password");
		String address =request.getParameter("address");
		String rooms=request.getParameter("rooms");
		String ac=request.getParameter("ac");
		String wifi=request.getParameter("wifi");
		
		Singleton singleton=Singleton.getsingleton();
		Connection con = singleton.getCon();

		
		try {
			PrintWriter print =response.getWriter();
			PreparedStatement pstmt=con.prepareStatement("insert into hoteldb.hoteldetails values(?,?,?,?,?,?,?)");
			pstmt.setString(1,hotelname);
			pstmt.setString(2,hotelid);
			pstmt.setString(3,password);
			pstmt.setString(4,address);
			pstmt.setString(5,rooms);
			pstmt.setString(6,ac);
			pstmt.setString(7,wifi);
			
			
			
			try{
					Statement stmt=con.createStatement();
		
	
					String sql1 = "CREATE TABLE hoteldb."+hotelid +
	                   "(fname VARCHAR(255),lname VARCHAR(255),totalamount VARCHAR(255),paidamount VARCHAR(255),pendingamount VARCHAR(255),checkout VARCHAR(255),checkin VARCHAR(255),person VARCHAR(255),roomno VARCHAR(255))";
		
					stmt.executeUpdate(sql1);
		
				}
				catch(SQLException e)
			
				{
					System.out.println("Exception in creation table1");
				}
			
					
					try{
			 String sql2=" CREATE TABLE hoteldb."+hotelid+"room"+ 
			 "(avaibleroom VARCHAR(255))";

			 Statement stmt1=con.createStatement();
			 stmt1.executeUpdate(sql2);
			
			 
			 int totalroom=Integer.parseInt(rooms);
		
			 PreparedStatement pstmt2=con.prepareStatement("insert into hoteldb."+hotelid+"room  values(?)");
				pstmt2.setInt(1,totalroom);
				pstmt2.executeUpdate();
					}
					catch (SQLException e) {
						System.out.println("Exception in creation table2");
					}
					int i=pstmt.executeUpdate();
			if(i>=1)
			  {
				  String out="<html><body> <h1>Registered SuccessFully </h1><br>"+
						  		"<a href=\"index.jsp\">Login Please </a></body></html>";
				  print.println(out);
			  }
			  else
			  {
				  String out ="<html><body><h1>Something Went Wrong</h1></body></html>";
				  print.println(out);
			  }
			
			
		} catch (SQLException e) {
			System.out.println("Sql");
		}
		
		
		
		
	}

	private void print(String out) {
		// TODO Auto-generated method stub
		
	}

}

