<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room Detail</title>
</head>
<body>
	<table  cellpadding="50px" align="center" >
		<th>Home</th> 
		<th><a href="account.jsp">Account</a> </th>
		<th><a href="aboutus.jsp">About Us</a></th>
		<th><a href="contactus.jsp">Contact Us</a></th>
		
	</table>
	

	<ul align="center">
		<li><a href="checkin1.jsp">Check in</a></li><br>
		<li><a href="checkout.jsp">Check Out</a></li><br>
		<li><a href="availableroom.jsp">Get Avaible Room</a></li><br>
		<li><a href="detail.jsp">Get Detail Of Person</a></li><br>
		<li><a href="roomdetail.jsp">Get Detail Of Room</a></li><br>
	</ul>
	<form action="roomdetail1.jsp"  method="post">
		<table align="center">
				<tr>
					<td>Please Enter Room no:</td>
					<td><input type="text" name="roomno"></td>
				</tr>
		</table>
		<table align="center">
			<tr>
				<td><input type="submit" value="Get Detail"></td>
			</tr>
		</table>
	</form>
		
</body>
</html>