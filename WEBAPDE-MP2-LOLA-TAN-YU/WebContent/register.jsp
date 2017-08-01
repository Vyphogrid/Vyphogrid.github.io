<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type ="text/css" href="feed.css">
</head>
<body>
	<div id="main">
	    <div class="nav"></div>
	    <br>
	    <br>
	    <br>
	    <br>
        <div id="registerBox" style="padding-left:5%; padding-right:5%; text-align: center;">
	        <form action="register" method="POST">
				Username: <input type="text" name="username" />
				<br>
				<br>
				Password: <input type="password" name="password" />
				<br>
				<br>
				Description: <input type="text" name="description" />
				<br>
				<br>
				<input type="submit" value="Register"/>
			</form>
        </div>    
    </div>
</body>
</html>