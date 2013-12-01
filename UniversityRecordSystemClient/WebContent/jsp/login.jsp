<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript"></script>
<head>
<title>HTML Frames Example - Content</title>
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
<script>

function setCookie(personId,flag)
{
document.cookie="personId="+personId;
document.cookie="flag="+flag;
}

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
		
		var username = document.getElementById('username').value;
		var password = document.getElementById('password').value;
		
		$.ajax({
		        Type: "GET",
		        url: "http://localhost:8081/UniversityRecordSystemClient/LoginServlet",
		        data: "username="+username+"&password="+password,
		        success: function (msg) {
		        	var flag = $.parseJSON(msg).flag;
		        	//var name = $.parseJSON(msg).name;
		        	var personId = $.parseJSON(msg).personId;
		        	setCookie(personId,flag);
		        	 
		        	if(flag == "S"){
		        		
		        		window.location.href = "bottom.jsp";
		        	}
		        	else if(flag == "I"){
		        		window.location.href = "instructorBottom.jsp";
		        	}
		        	else {
		        		window.location.href = "adminBottom.jsp";
		        	}
		        },
		    	error: function (msg) {
		    		alert("incorrect login details");
		    		$('#error-message').text("incorrect login details");
		   		}
		  });
	});
});

</script>
	<center>
		<table>
                <tr>
		    <td style="padding-top: 20px"></td>
                    <td style="width: 100px;padding-top: 30px;"><h3>Login</h3></td>
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 30px;padding-left: 20px;color: red"><Label id="error-message"></Label></td>
                    
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 30px;padding-left: 20px"><b>Username:</b></td>
                    <td style="padding-top: 30px;padding-right: 30px">
                        <input type="text" name="username" id="username">  
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 20px;padding-left: 20px"><b>Password:</b></td>
                    <td style="padding-top: 20px">
                        <input type="password" name="password" id="password">  
                    </td>                    
                </tr>   
                <tr >
                    <td style="padding-top: 20px"></td>
                    <td style="padding-top: 20px">
                    <a href=""></a>
                    </td>
                </tr>
                <tr>
               		<td><input type = "button" id="submit" value="submit"></td>
                </tr>
            </table>
         </center>
	</body>
</html>