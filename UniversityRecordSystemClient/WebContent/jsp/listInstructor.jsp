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
		url:"http://localhost:8081/UniversityRecordSystemClient/displayAllInstructorsServlet",
		success:function(msg){
			
			var dataArray = [];   
			var jsonObj = [];
			jsonObj = JSON.parse(msg);
        	dataArray = [ ['firstName', 'lastName', 'addressLine', 'city', 'state', 'zip','department Id', 'meetingHours', 'officeRoom', 'dateOfJoining', 'numberOfClasses', 'position','personId'] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].firstName,
				                 jsonObj[i].lastName,
				                 jsonObj[i].addressLine,
				                 jsonObj[i].city,
				                 jsonObj[i].state,
				                 jsonObj[i].zip,
				                 jsonObj[i].departmentId,
				                 jsonObj[i].meetingHours,
				                 jsonObj[i].officeRoom,
				                 jsonObj[i].dateOfJoining,
				                 jsonObj[i].noOfClasses,
				                 jsonObj[i].position,
				                 parseInt(jsonObj[i].personId) ]);
			}
			
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#courseTimeTable').append('<tr><td id="courseId">'+jsonObj[i].firstName
							+'</td><td id="courseName">'+jsonObj[i].lastName
							+'</td><td id="roomNumber">'+jsonObj[i].addressLine
							+'</td><td id="classHours">'+jsonObj[i].city
							+'</td><td id="credits">'+jsonObj[i].state
							+'</td><td id="section">'+jsonObj[i].zip
							+'</td><td id="departmentId">'+jsonObj[i].departmentId
							+'</td><td id="instructor">'+jsonObj[i].meetingHours
							+'</td><td id="credits">'+jsonObj[i].officeRoom
							+'</td><td id="section">'+jsonObj[i].dateOfJoining
							+'</td><td id="departmentId">'+jsonObj[i].noOfClasses
							+'</td><td id="instructor">'+jsonObj[i].position
							+'</td><td id="instructor">'+jsonObj[i].personId
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
<h1>All Instructors are listed as follows:</h1>
<center>
<table border=2 id="courseTimeTable">
	<tr>
		<td  style="width: 100px;padding-left: 20px"><b>First Name</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Last Name</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Address Line</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>City</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>State</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Zip</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Department ID</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Meeting Hours</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Office Room</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Date of Joining</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Number of Classes</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Designation</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Instructor ID</b></td>
	</tr>
</table>
</center>
</body>
</html>