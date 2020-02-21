<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Here</title>
	<script>
		function validate()
		{
			var hotelname =document.registerform.hotelname.value;
			var hotelid =document.registerform.id.value;
			var password =document.registerform.password.value;
			var address =document.registerform.address.value;
			 if(hotelname=="" || hotelid=="" || password=="" || address=="")
				 {
				 alert("Field can not be empty")
				return false;
				 }
			 
		}


	</script>
</head>
<body>
<form action="register" method="post" name="registerform" onsubmit="return validate()">
	<table align="center">
		<tr>
		<td>Hotel Name:</td>
		<td><input type="text" name="hotelname"></td>
		</tr>
		<tr>
		<td>Hotel ID:</td>
		<td><input type="text" name="id"></td>
		</tr>
		<tr>
		<td>PassWord:</td>
		<td><input type="text" name="password"></td>
		</tr>
		<tr>
		<td>Address:</td>
		<td><input type="text" name="address"></td>
		</tr>
		<tr>
		<td>Total Rooms:</td>
		<td><input type="text" name="rooms"</td>
		</tr>
		<tr>
		<td>A.C Avaible</td>
		<td><input type="radio" value="YES" name="ac">YES</td>
		<td><input type="radio" value="NO" name="ac">NO</td>
		</tr>
		<tr>
		<td>WI-FI Avaible</td>
		<td><input type="radio" value="YES" name="wifi">YES</td>
		<td><input type="radio" value="NO" name="wifi">NO</td>
		</tr>
		
	</table>
	
	<table align="center">
		<tr>
			<td><input type="submit" value="Register" ></td>
		</tr>
	
	
	</table>
		
	
</form>
</body>
</html>