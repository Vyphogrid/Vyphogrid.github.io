<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type ="text/css" href="feed.css">
</head>
<body>
	<div id="main">
	    <div class="nav"></div>
	    <br>
	    <br>
	    <br>
	    <br>
        <div id="loginBox" style="padding-left:5%; padding-right:5%; text-align: center;">
	        <form action="login" method="POST">
				Username: <input type="text" name="username" />
				<br>
				<br>
				Password: <input type="password" name="password" />
				<br>
				<br>
				<input type="submit" value="Login"/>
			</form>
        </div>    
    </div>
</body>
</html>