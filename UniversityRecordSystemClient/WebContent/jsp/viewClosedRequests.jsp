<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">

window.onload=function(){
	
	$.ajax({
		type:"GET",
		url:"http://localhost:8081/UniversityRecordSystemClient/viewChangeRequestServlet",
		data:"requestType=closed",
		success:function(msg){
			
			var dataArray = [];   
			var jsonObj = [];
			jsonObj = JSON.parse(msg);
        	dataArray = [ ['Request Id', 'Instructor Id', 'Change Requested', 'Completion status', 'Date', 'Time'] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].changeRequestId,
				                 jsonObj[i].personId,
				                 parseInt(jsonObj[i].changeRequested),
				                 jsonObj[i].statusFlag,
				                 parseInt(jsonObj[i].date),
				                 parseInt(jsonObj[i].time) ]);
			}
			
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#changeRequestTable').append('<tr><td id="courseId">'+jsonObj[i].changeRequestId
							+'</td><td id="courseName">'+jsonObj[i].personId
							+'</td><td id="roomNumber">'+jsonObj[i].changeRequested
							+'</td><td id="classHours">'+jsonObj[i].statusFlag
							+'</td><td id="credits">'+jsonObj[i].date
							+'</td><td id="section">'+jsonObj[i].time
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
<h1>Pending request</h1>
<center>
<table border=2 id="changeRequestTable">
	<tr>
		<td  style="width: 50px;padding-left: 20px"><b>Request Id</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Instructor Id</b></td>
		<td  style="width: 100px;padding-left: 20px"><b>Change Requested</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Completed</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Date</b></td>
		<td  style="width: 50px;padding-left: 20px"><b>Time</b></td>
	</tr>
</table>
</center>
</body>
</html>