<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function changeCourseDetails(){
	
	var classHours = document.getElementById('classHours').value;
	var roomNumber = document.getElementById('roomNumber').value;
	
	var courseDetails = '{'
					      +'"classHours" : "'+classHours+'",'
					      +'"roomNumber"  : "'+roomNumber+'"'
					      +'}';
					       
	alert(courseDetails);
	
	$.ajax({
			type:"GET",
			url:"http://localhost:8081/UniversityRecordSystemClient/changeCourseDetailsServlet",
			data:"courseDetails="+courseDetails+"&courseId="+getCookie("courseId"),
			success:function(msg){
				alert('you have updated course details successfully');
				window.parent.content.location.href="welcomeStudent.jsp";
			},
			error:function(msg){
				alert('You do not have the privilege to edit this course!');
			}
		});
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
<title>Edit Courses</title>
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
<center>
		<table>
                <tr>
		    <td style="padding-top: 20px"></td>
                    <td style="width: 100px;padding-top: 30px;"><h3>Edit Course details</h3></td>
                </tr>
                 <tr>
                    <td style="width: 100px;padding-top: 30px;padding-left: 20px"><b>Class hours</b></td>
                    <td style="padding-top: 20px">
                        <input type="text" name="classHours" id="classHours">  
                    </td> 
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 20px;padding-left: 20px"><b>room number</b></td>
                    <td style="padding-top: 20px">
                        <input type="text" name="roomNumber" id="roomNumber">  
                    </td>                    
                </tr>
                <tr>
		    		<td style="padding-top: 20px"></td>
                    <td style="padding-top: 20px">
                    <a href="welcomeStudent.jsp" target="content"><input type="submit" value="Submit" onclick="changeCourseDetails();"></a>
                    </td>
                </tr>
          </table>
</center>
</body>
</html>