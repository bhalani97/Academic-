<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ssec.hotelmanagement.Singleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
</head>
<body>

	<% 	String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String roomno=request.getParameter("roomno");
		String hotelid=(String)session.getAttribute("id");
		String id=(String)session.getAttribute("id");
		if(id=="" || id==null)
		{	
			out.print("Session logged out");
			RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
			dis.include(request, response);
		}
		else 
		{
		Singleton singleton=Singleton.getsingleton();
	
		Connection con=singleton.getCon();
		String fname1=null,lname1=null,totalamount=null,paidamount=null,pendingamount=null,checkin=null,person=null,roomno1=null;
			if(fname !=null && lname !=null || fname !="" && lname !="")
			{
		
				PreparedStatement pstmt=con.prepareStatement("select * from hoteldb."+hotelid+" where fname=? and lname=?");
				pstmt.setString(1,fname);
				pstmt.setString(2,lname);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					 fname1=rs.getString(1);
					 lname1=rs.getString(2);
					 totalamount=rs.getString(3);
					 paidamount=rs.getString(4);
					 pendingamount=rs.getString(5);
					 checkin=rs.getString(7);
					 person=rs.getString(8);
					 roomno1=rs.getString(9);
				}
				if(roomno1== null || roomno1=="")
				{
						
					RequestDispatcher dis=request.getRequestDispatcher("checkout.jsp");
					dis.include(request, response);
					
						out.print("Data not found try again please");
						
				
				}
				else
				{
					
							
					session.setAttribute("roomno1",roomno1);
					
					%>
					
					<table align="center" border=1 cellpadding="2px">
						<tr>	
							<td>First Name:</td>
							<td><%=fname1 %></td>
						</tr>
						<tr>	
							<td>Last Name:</td>
							<td><%=lname1 %></td>
						</tr>
						<tr>	
							<td>Total Amount:</td>
							<td><%=totalamount %></td>
						</tr>
						<tr>	
							<td>Paid Amount:</td>
							<td><%=paidamount %></td>
						</tr>
						<tr>	
							<td>Pending Amount:</td>
							<td><%=pendingamount %></td>
						</tr>
						<tr>	
							<td>Check In Date:</td>
							<td><%=checkin %></td>
						</tr>
						<tr>	
							<td>No of person:</td>
							<td><%=person %></td>
						</tr>
						<tr>	
							<td>Room No:</td>
							<td><%=roomno1 %></td>
						</tr>
					</table>
					<form action="checkout" method="post">
					<table align="center">
						<tr>
							<td><input type="submit" value ="Check Out"> 
						</tr>
					</table>
						<%	int peamo=Integer.parseInt(pendingamount);
						if(peamo>0)
						{%>
						<h2>Please Collect <%=pendingamount %></h2>	
					<%	}
				}
					
			}	
			
			else if(roomno !=null || roomno !="")
		
			{
				session.setAttribute("roomno",roomno);
				PreparedStatement pstmt=con.prepareStatement("select * from hoteldb."+hotelid+" where roomno=?");
				pstmt.setString(1,roomno);
				
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					 fname1=rs.getString(1);
					 lname1=rs.getString(2);
					 totalamount=rs.getString(3);
					 paidamount=rs.getString(4);
					 pendingamount=rs.getString(5);
					 checkin=rs.getString(7);
					 person=rs.getString(8);
					 roomno1=rs.getString(9);
				}
				if(roomno1== null || roomno1=="")
				{
						
					RequestDispatcher dis=request.getRequestDispatcher("checkout.jsp");
					dis.include(request, response);
					
						out.print("Data not found try again please");
						
				
				}
				else
				{
					
							
				
					
					%>
					
					<table align="center" border=1 cellpadding="2px">
						<tr>	
							<td>First Name:</td>
							<td><%=fname1 %></td>
						</tr>
						<tr>	
							<td>Last Name:</td>
							<td><%=lname1 %></td>
						</tr>
						<tr>	
							<td>Total Amount:</td>
							<td><%=totalamount %></td>
						</tr>
						<tr>	
							<td>Paid Amount:</td>
							<td><%=paidamount %></td>
						</tr>
						<tr>	
							<td>Pending Amount:</td>
							<td><%=pendingamount %></td>
						</tr>
						<tr>	
							<td>Check In Date:</td>
							<td><%=checkin %></td>
						</tr>
						<tr>	
							<td>No of person:</td>
							<td><%=person %></td>
						</tr>
						<tr>	
							<td>Room No:</td>
							<td><%=roomno1 %></td>
						</tr>
					</table>
					<form action="checkout" method="post">
					<table align="center">
						<tr>
							<td><input type="submit" value ="Check Out"> 
						</tr>
					</table>
						<%	int peamo=Integer.parseInt(pendingamount);
						if(peamo>0)
						{%>
						<h2>Please Collect <%=pendingamount %></h2>	
					<%	}
				}
			
					%>
				</form>
			
			
			<%}
			}%>


</body>
</html>