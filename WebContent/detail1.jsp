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
<title>Details</title>
</head>
<body>
<table  cellpadding="50px" align="center" >
		<th>Home</th> 
		<th><a href="account.jsp">Account</a> </th>
		<th><a href="aboutus.jsp">About Us</a></th>
		<th><a href="contactus.jsp">Contact Us</a></th>
		<th><a href="logout">Log out</a></th>
		
	</table>
	

	<ul align="center">
		<li><a href="checkin1.jsp">Check in</a></li><br>
		<li><a href="checkout.jsp">Check Out</a></li><br>
		<li><a href="availableroom.jsp">Get Avaible Room</a></li><br>
		<li><a href="detail.jsp">Get Detail Of Person</a></li><br>
		<li><a href="roomdetail.jsp">Get Detail Of Room</a></li><br>
	</ul>
<% 	
String fname=request.getParameter("fname");
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
		String fname1=null,lname1=null,totalamount=null,paidamount=null,pendingamount=null,checkin=null,person=null,roomno1=null,checkout=null;
			if(fname !=null && lname !=null)
			{
		
				PreparedStatement pstmt=con.prepareStatement("select * from hoteldb."+hotelid+" where fname=? and lname=?");
				pstmt.setString(1,fname);
				pstmt.setString(2,lname);
				ResultSet rs=pstmt.executeQuery();
				if(rs !=null)
				{
				while(rs.next())
				{
					 fname1=rs.getString(1);
					 lname1=rs.getString(2);
					 totalamount=rs.getString(3);
					 paidamount=rs.getString(4);
					 pendingamount=rs.getString(5);
					 checkout=rs.getString(6);
					 checkin=rs.getString(7);
					 person=rs.getString(8);
					 roomno1=rs.getString(9);
				session.setAttribute("roomno",roomno1);
				
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
						<td>Check Out Date:</td>
						<td><%=checkout %></td>
					</tr>
					<tr>	
						<td>No of person:</td>
						<td><%=person %></td>
					</tr>
					<tr>	
						<td>Room No:</td>
						<td><%=roomno1 %></td>
					</tr>
				
				<%
					}
				}
				
			}
			else
				
			{
				%>
				<h2 align="center">Oops Data not Available</h2>
				<%
			}
		}
	%>

</body>
</html>