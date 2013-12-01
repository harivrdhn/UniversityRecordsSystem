<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">

window.onload = function(){
	
	$.ajax({
        Type: "GET",
        url: "http://localhost:8081/UniversityRecordSystemClient/searchForClassesServlet",
        data: "personId="+getCookie("personId"),
        success: function (msg) {
        	var jsonObj = JSON.parse(msg);
        	var dataArray = [ ['course Id', 'course name', 'room number', 'class hours', 'credits', 'section','department' ] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].courseId,
				                 jsonObj[i].courseName,
				                 parseInt(jsonObj[i].section),
				                 jsonObj[i].classHours,
				                 parseInt(jsonObj[i].credits),
				                 parseInt(jsonObj[i].departmentId),
								 jsonObj[i].roomNumber ]);
			}
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#courseTimeTable').append('<tr><td id="mainConsoleColumn">'+jsonObj[i].courseId
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].courseName
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].section
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].classHours
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].credits
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].departmentId
							+'</td><td id="mainConsoleColumn">'+jsonObj[i].roomNumber+'</td></tr>');
// fix radoit buttons
				} 
        	
        },
        error: function (error) {
    		alert('error');
    		$('#error-message').text("Error message");
   		}
	});
};




</script>
<title>View Classes</title>
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
<h1>Class List Result</h1>
<center>
<table border=2>
	<tr>
		<td  style="width: 100px;padding-left: 20px"><b>Course Id</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Course Name</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Room Number</b></td>		
		<td  style="width: 100px;padding-left: 20px"><b>Class Hours</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Credits</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Section</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>department Id</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>department Name</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Instructor</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Availability</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>"Check box for selecting"</b></td>
	</tr>
</table>
<br /><br />
<table>
	<tr>
		<td  style="width: 100px;padding-left: 20px"><a href="searchClass.html" target="content"><input type="submit" value="New Search"></a></td>
		<td  style="width: 100px;padding-left: 20px"><a href="classAdded.html" target="content"><input type="submit" value="Submit"></a><br />
</table>
</center>
</body>
</html>