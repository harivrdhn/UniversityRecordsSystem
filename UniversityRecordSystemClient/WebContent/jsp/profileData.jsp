<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">

window.onload = function(){ 
	
	var urlString= "";
	
	if(getCookie("flag") == 'S')
		{
			alert('student');
			urlString = "http://localhost:8081/UniversityRecordSystemClient/getStudentDetailsServlet";
		}
	else if(getCookie("flag") == 'I')
		{
			alert('Instructor');
			urlString = "http://localhost:8081/UniversityRecordSystemClient/getInstructorDetailsServlet";
		}
	else if(getCookie("flag") == 'A')
	{
		alert('Instructor');
		urlString = "http://localhost:8081/UniversityRecordSystemClient/getInstructorDetailsServlet";
	}
	
	
	$.ajax({
        Type: "GET",
        url: urlString,
        data: "personId="+getCookie("personId"),
        success: function (msg) {
        	var jsonObj = JSON.parse(msg);
        	var dataArray = [ ['First Name', 'Last Name', 'address line', 'state', 'city','zip','emailId','departmentId', 'admit semester', 'current semester', 'degree pursuing', 'year of graduation','GPA' ] ];
			for ( var i = 0; i < 1; i++) {
				dataArray.push([ jsonObj.firstName,
				                 jsonObj.lastName,
				                 parseInt(jsonObj.addressLine),
				                 jsonObj.state,
				                 parseInt(jsonObj.city),
				                 parseInt(jsonObj.zip),
								 jsonObj.emailId,
								 parseInt(jsonObj.departmentId),
				                 jsonObj.admitSemester,
				                 parseInt(jsonObj.currSemester),
				                 jsonObj.degreePursuing,
				                 parseInt(jsonObj.estimateGradutationYear),
				                 parseInt(jsonObj.gpa)
				                 ]);
			}
		 	for ( var i = 0; i < 1; i++) {
					$('#profileDataTable').append('<tr><td><b>Profile details</b></td></tr><tr><td id="firstName" style="width: 200px;padding-top: 30px;padding-left: 20px">First Name</td><td id="firstName">'+jsonObj.firstName
							+'</td></tr><tr><td id="lastName" style="width: 200px;padding-top: 20px;padding-left: 20px">Last Name:</td><td id="lastName">'+jsonObj.lastName
							+'</td></tr><tr><td id="addressLine"  style="width: 200px;padding-top: 20px;padding-left: 20px">Address Line:</td><td id="addressLine">'+jsonObj.addressLine
							+'</td></tr><tr><td id="state" style="width: 200px;padding-top: 20px;padding-left: 20px">State:</td><td id="state">'+jsonObj.state
							+'</td></tr><tr><td id="city" style="width: 200px;padding-top: 20px;padding-left: 20px">City:</td><td id="city">'+jsonObj.city
							+'</td></tr><tr><td id="zip" style="width: 200px;padding-top: 20px;padding-left: 20px">Zip:</td><td id="zip">'+jsonObj.zip
							+'</td></tr><tr><td id="emailId" style="width: 200px;padding-top: 30px;padding-left: 20px">Email Id</td><td id="emailId">'+jsonObj.emailId
							+'</td></tr><tr><td id="departmentId" style="width: 200px;padding-top: 20px;padding-left: 20px">Department Id</td><td id="departmentId">'+jsonObj.departmentId
							+'</td></tr><tr><td id="admitSemester" style="width: 200px;padding-top: 20px;padding-left: 20px">Semester Admitted:</td><td id="admitSemester">'+jsonObj.admitSemester
							+'</td></tr><tr><td id="currSemester" style="width: 200px;padding-top: 20px;padding-left: 20px">Current Semester:</td><td id="currSemester">'+jsonObj.currSemester
							+'</td></tr><tr><td id="degreePursuing" style="width: 200px;padding-top: 20px;padding-left: 20px">Degree Pursuing:</td><td id="degreePursuing">'+jsonObj.degreePursuing
							+'</td></tr><tr><td id="estimateGradutationYear" style="width: 200px;padding-top: 20px;padding-left: 20px">Estimated Year of Gradutation:</td><td id="estimateGradutationYear">'+jsonObj.estimateGradutationYear
							+'</td></tr><tr><td id="gpa" style="width: 200px;padding-top: 20px;padding-left: 20px">GPA:</td><td id="gpa">'+jsonObj.gpa
							+'<br><tr><td><input type="button" id="editDetails" value="Change Data" onclick="editData();"></td></tr>');

			}
        },
        error: function (error) {
    		alert('error');
    		$('#error-message').text("Error message");
   		}
	});
};

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

function editData(){
	
	window.parent.content.location.href="changeProfile.jsp";
	
}

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
<center>
<table id="profileDataTable">
                   
                
               
</table>
</center>
</body>
</html>