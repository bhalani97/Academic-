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
<title>Account</title>
</head>
<body>
	
	<%
	 String id=(String)session.getAttribute("id");
	if(id=="" || id==null)
	{	
		out.print("Session logged out");
		RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
		dis.include(request, response);
	}
	else
	{
		String hotelname=null,hotelid=null,address=null,rooms=null,ac=null,wifi=null;
	Singleton singleton=Singleton.getsingleton();
	Connection con=singleton.getCon();
	PreparedStatement pstmt=con.prepareStatement("select * from hoteldb.hoteldetails where hotelid=?");
	pstmt.setString(1,id);
	ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			hotelname=rs.getString(1);
			hotelid=rs.getString(2);
			address=rs.getString(4);
			rooms=rs.getString(5);
			ac=rs.getString(6);
			wifi=rs.getString(7);
		}
	
	
	%>
	<h2 align="right">Hotel Id:<%= session.getAttribute("id") %></h2>
	<table  cellpadding="50px" align="center" >
		<th><a href="Home.jsp"">Home</a></th> 
		<th>Account</th>
		<th><a href="aboutus.jsp">About Us</a></th>
		<th><a href="contactus.jsp">Contact Us</a></th>
		<th><a href="logout">Log out</a></th>
	</table>
	<table align="center" border=1 cellpadding="10px">
		
		<tr>
			<td>Hotel Name:</td>
			<td><%=hotelname %></td>
		</tr>
			<tr>
			<td>Hotel Id:</td>
			<td><%=hotelid %></td>
		</tr>	<tr>
			<td>Address:</td>
			<td><%=address %></td>
		</tr>	<tr>
			<td>Rooms:</td>
			<td><%=rooms %></td>
		</tr>	<tr>
			<td>A.C:</td>
			<td><%=ac %></td>
		</tr>	<tr>
			<td>WI-FI:</td>
			<td><%=wifi %></td>
			
		</tr>
	
	</table>
	<%} %>
	
</body>
</html>