<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function getCookie(personId)
	{
		var c_value = document.cookie;
		var c_start = c_value.indexOf(" " + personId + "=");
		if (c_start == -1)
		{
		c_start = c_value.indexOf(personId + "=");
		}
		if (c_start == -1)
		{
		c_value = null;
	}
	else
	{
		c_start = c_value.indexOf("=", c_start) + 1;
		var c_end = c_value.indexOf(";", c_start);
		if (c_end == -1)
		{
		c_end = c_value.length;
		}
		c_value = unescape(c_value.substring(c_start,c_end));
	}
return c_value;
}

$(document).ready(function() {
	
	$('#submit').click(function(){

	var confirmpassword = document.getElementById('confirmpassword').value;
	var personId = getCookie("personId");
	alert(personId);
	
	$.ajax({
			Type: "GET",
		    url: "http://localhost:8081/UniversityRecordSystemClient/changePasswordServlet",
		    data:"personId="+personId+"&confirmPassword="+confirmpassword,
		    success: function (msg) {
		    	window.parent.content.location.href="passwordChanged.jsp";
				},
		    error: function (error) {
				alert('error');
				$('#error-message').text("Error message");
				}
		});
	});
});

</script>
<head>
<title>Change Password</title>
<style type="text/css">
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:30px;
	background-color:#FFFAF0;
	}
</style>
</head>
<body>
<h1>Change Password</h1>
<br><br><br>
<center>Old Password:       
<input type="password" name="oldpassword" id="oldpassword"><br>
New Password:<input type="password" name="newpassword" id="newpassword"><br>
Confirm Password:<input type="password" name="confirmpassword" id="confirmpassword"><br>
<br><br>
<input type="submit" value="Submit" id="submit"><br />
</center>
</body>
</html>