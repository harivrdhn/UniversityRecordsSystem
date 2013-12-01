<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">
dataArrayCheckBox = [];

window.onload = function(){
	
	$.ajax({
        Type: "GET",
        url: "http://localhost:8081/UniversityRecordSystemClient/getCourseListServlet",
        data: "personId="+getCookie("personId")+"&flag="+getCookie("flag"),
        success: function (msg) {
        	var jsonObj = JSON.parse(msg);
        	var dataArray = [ ['course Id', 'course name', 'room number', 'class hours', 'credits', 'section','department','drop' ] ];
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
					$('#dropCourseTable').append('<tr onclick="getVal(this)"><td id="courseId">'+jsonObj[i].courseId
							+'</td><td id="courseName">'+jsonObj[i].courseName
							+'</td><td id="section">'+jsonObj[i].section
							+'</td><td id="classHours">'+jsonObj[i].classHours
							+'</td><td id="credits">'+jsonObj[i].credits
							+'</td><td id="departmentId">'+jsonObj[i].departmentId
							+'</td><td id="roomNumber">'+jsonObj[i].roomNumber
							+'</td><td id="selectCheckBox"><input type="checkbox">'
							+'</td></tr>');

				}
        },
        error: function (error) {
    		alert('error');
    		$('#error-message').text("Error message");
   		}
	});
};

function unenroll(){
	
	var jsonString = dataArrayCheckBox.toString();
	
	$.ajax({
			type:"GET",
			url:"http://localhost:8081/UniversityRecordSystemClient/unenrollStudentServlet",
			data:"personId="+getCookie("personId")+"&courseId="+jsonString,
			success:function(msg){
				alert('you have dropped the course successfully');
				window.parent.content.location.href="welcomeStudent.jsp";
			},
			error:function(msg){
				alert('Dropping course failed! Please try again..');
			}
		});
}

function getVal(r){
	t = document.getElementById('dropCourseTable').rows; 
	al='the text values in the clicked row are:'; 
	
	for(var i=0;i<t.length;i++){ 
		for(var j=0;j<t[i].cells.length;j++){ 
			if(r==t[i] && t[i].cells[j].id === 'courseId'){
				
				dataArrayCheckBox.push
				(
						t[i].cells[j].innerHTML 	
				);
			}
		}
	}
	alert(al);
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

</script>
<head>
<title>Drop Classes</title>
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
<h1>Class Timetable</h1>
<center>
<table id="dropCourseTable" border=1>
	<tr>
		<td  style="width: 100px;padding-left: 20px"><b>Course Id </b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Course Name</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Section</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Class Hours</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Credits</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Department Id</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Room Number</b>
		<td  style="width: 100px;padding-left: 20px"><b>Drop</b>
	</tr>
</table>
<input type="button" id="enroll" value="Drop Course" onclick="unenroll();">
<a href="classAdded.html" target="content"><input type="submit" value="Submit"></a><br />
</center>
</body>
</html>