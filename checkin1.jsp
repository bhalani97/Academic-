<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check In</title>
</head>
<body>
<%String msg=(String)request.getAttribute("msg"); 
 	if(msg !=null)
 	{%>
 		<h4><%=msg %></h4>
 		<%
 	}%>

	
<table  cellpadding="50px" align="center" >
		<th>Home</th> 
		<th><a href="account.jsp">Account</a> </th>
		<th><a href="aboutus.jsp">About Us</a></th>
		<th><a href="contactus.jsp">Contact Us</a></th>
		<th><a href="logout">Log out</a></th>
		
	</table>
	
	
	<ul align="center">
		<li>Check in</li><br>
		<li><a href="checkout.jsp">Check Out</a></li><br>
		<li><a href="availableroom.jsp">Get Avaible Room</a></li><br>
		<li><a href="detail.jsp">Get Detail Of Person</a></li><br>
	</ul>
	<form method="post" action="checkin">
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
			<td>Total Amount:</td>
			<td><input type="text" name="totalamount"> 
		</tr>
		<tr>
			<td>Paid Amount:</td>
			<td><input type="text" name="paidamount"> 
		</tr>
		
		<tr>
			<td>Check In Date:</td>
			<td><input type="text" name="checkin"> 
		</tr>
		<tr>
			<td>Room No:</td>
			<td><input type="text" name="roomno"> 
		</tr>
		<tr>
			<td>Total Person:</td>
			<td><input type="text" name="totalperson"> 
		</tr>
		
		<table align="center">
			<tr>
			<td><input type="submit" value="Check In"></td>
			</tr>
		</table>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</table>

</body>
</html>