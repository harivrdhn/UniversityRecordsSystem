<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">

window.onload = function(){
	
	$.ajax({
		type:"GET",
		url:"http://localhost:8081/UniversityRecordSystemClient/displayCoursesServlet",
		success:function(msg){
			
			var dataArray = [];   
			var jsonObj = [];
			jsonObj = JSON.parse(msg);
        	dataArray = [ ['course Id', 'course name', 'room number', 'class hours', 'credits', 'section','department Id','Instructor'] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].courseId,
				                 jsonObj[i].courseName,
				                 parseInt(jsonObj[i].roomNumber),
				                 jsonObj[i].classHours,
				                 parseInt(jsonObj[i].credits),
				                 parseInt(jsonObj[i].section),
				                 parseInt(jsonObj[i].departmentId),
								 jsonObj[i].instructor ]);
			}
			
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#courseTimeTable').append('<tr><td id="courseId">'+jsonObj[i].courseId
							+'</td><td id="courseName">'+jsonObj[i].courseName
							+'</td><td id="roomNumber">'+jsonObj[i].roomNumber
							+'</td><td id="classHours">'+jsonObj[i].classHours
							+'</td><td id="credits">'+jsonObj[i].credits
							+'</td><td id="section">'+jsonObj[i].section
							+'</td><td id="departmentId">'+jsonObj[i].departmentId
							+'</td><td id="instructor">'+jsonObj[i].instructor
							+'</td></tr>');
			}
		},
		error:function(msg){
		alert('error');	
		}
	});
};

</script>
<head>
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
<table border=1 id="courseTimeTable">
	<tr>
		<td  style="width: 50px;padding-left: 20px"><b>Course Number</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Class Name</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Room Number</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Section</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Class Hours</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Credits</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Availability</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Instructor</b></td>
	</tr>
</table>
</center>
</body>
</html>