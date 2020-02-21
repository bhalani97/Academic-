<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management</title>
	<script>
		function validate()
		{
			var hotelid=document.loginform.id.value;
			var password=document.loginform.password.value;
				if(hotelid=="" || password =="" )
					{
						alert("Field can not be empty");
						return false;
					}
		}
	
	
	
	</script>
</head>
<body>
	<h1 align="center">Hotel Management</h1>
	<form action="login" method="post" name = "loginform" onsubmit ="return validate()">
	<table align="center">
		<tr>
			<td>Hotel ID :</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>PassWord::</td>
			<td><input type="password" name="password"></td>
		</tr>
	</table>
	
	<table align="center">
	<th><input type="submit" value="Login"></th>
	</table>
	
	<table align="center">
		<th> 
			<a href="Register.jsp">Register Here</a> 
		</th>
	</table>
	</form>
	
</body>
</html>