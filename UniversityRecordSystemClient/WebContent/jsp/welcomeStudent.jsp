<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript"></script>
<script type="text/javascript">

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

window.onload = function(){
	
	$.ajax({
        Type: "GET",
        url: "http://localhost:8081/UniversityRecordSystemClient/getCourseListServlet",
        data: "personId="+getCookie("personId")+"&flag="+getCookie("flag"),
        success: function (msg) {
        	var jsonObj = JSON.parse(msg);
        	var dataArray = [ ['course Id', 'course name', 'room number', 'class hours', 'credits', 'section','departmentId' ] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].courseId,
				                 jsonObj[i].courseName,
				                 parseInt(jsonObj[i].roomNumber),
				                 jsonObj[i].classHours,
				                 parseInt(jsonObj[i].credits),
				                 parseInt(jsonObj[i].section),
								 jsonObj[i].departmentId ]);
			}
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#courseTimeTable').append('<tr><td id="courseId">'+jsonObj[i].courseId
							+'</td><td id="courseName">'+jsonObj[i].courseName
							+'</td><td id="section">'+jsonObj[i].roomNumber
							+'</td><td id="classHours">'+jsonObj[i].classHours
							+'</td><td id="credits">'+jsonObj[i].credits
							+'</td><td id="departmentId">'+jsonObj[i].section
							+'</td><td id="roomNumber">'+jsonObj[i].departmentId+'</td></tr>');

			}
        },
        error: function (error) {
    		alert('error');
    		$('#error-message').text("Error message");
   		}
	});
};

</script>
<head>
<title>Welcome Student</title>
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
<br><br><br><br>
<center>
<div style="float: left;">
		<table id="courseTimeTable" border=1>
			<tr>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>course id</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>course name</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>room number</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>class hours</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>credits</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>section</b></td>
				<td id="mainConsoleColumn"
					style="background-color: #C3C3C3; height: 35px;"><b>department</b></td>
			</tr>
		</table>
	</div>

</center>
</body>
</html>