<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript"></script>
<script>
function setCookie(personId)
{
document.cookie=personId + "=" + c_value;
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

function viewClasses(){
	window.parent.content.location.href="welcomeStudent.jsp";
}
function enrollClasses(){
	window.parent.content.location.href="searchClass.jsp";
	
}
function dropClasses(){
	window.parent.content.location.href="dropClasses.jsp";
}

function editStudentDetails(){
	window.parent.content.location.href="profileData.jsp";
}

function makePayment(){
	window.parent.content.location.href="makePayment.jsp";
}

function viewPastPayments(){
	window.parent.content.location.href="transactions.jsp";
}

function changePassword(){
	window.parent.content.location.href="changePassword.jsp";
	
}
function logout(){
	window.parent.location.href="logout.jsp";
	
}
</script>
<head>
<title>Student Menu</title>
<style type="text/css">
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:10px;
	background-color:#FAF0E6;
	}
</style>
</head>
<body>
<h3>Welcome Student!</h3>

<h4>Account Options</h4>
<a id="viewClasses" onclick="viewClasses();">View Classes</a><br />
<a id="enrollClasses" onclick="enrollClasses();">Enroll Classes</a><br />
<a id="dropClasses" onclick="dropClasses();">Drop Classes</a><br />
<a id="editStudentDetails" onclick="editStudentDetails();">Edit Profile Details</a><br />
<a id="makePayment" onclick="makePayment();">Make Payment</a><br />
<a id="viewPastPayments" onclick="viewPastPayments();">View Past Payments</a><br />
<a id="changePassword" onclick="changePassword();">Change Password</a><br />
<a id="logout" onclick="logout();" >Logout</a><br />
</body>
</html>