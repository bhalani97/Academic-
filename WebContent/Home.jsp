<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>

	<%
	String id =(String) session.getAttribute("id");
	if(id=="" || id==null)
	{	
		out.print("Session logged out");
		RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
		dis.include(request, response);
	}
	else
	{
	%>
		<h2 align="right">Hotel Id:<%=id  %></h2>
		
	
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
	
	<%} %>








</body>
</html>