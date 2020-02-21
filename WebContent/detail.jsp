<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Detail</title>
</head>
<body>
	<% String id=(String)session.getAttribute("id");
	if(id=="" ||id==null)
	{

		out.print("Session logged out");
		RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
		dis.include(request, response);
	}
	else{%>
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
			<li>Get Detail Of Person</li><br>
		<li><a href="roomdetail.jsp">Get Detail Of Room</a></li><br>
		
	</ul>
	<form action="detail1.jsp" method="post">
		<table align="center">
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="fname">
			</tr>
			
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lname">
			</tr>
			<tr>
		
		<table align ="center">
			<tr>
				<td><input type="submit" value ="Get Detail"></td>
			</tr>
			
		</table>
		</form>	
	<%} %>
</body>
</html>