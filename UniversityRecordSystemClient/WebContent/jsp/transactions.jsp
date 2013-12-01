<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	
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
	
	var personIdNew = getCookie("personId");
	
	$.ajax({
        Type: "GET",
        url: "http://localhost:8081/UniversityRecordSystemClient/viewPastTransactionsServlet",
        data: "personId="+personIdNew,
        success: function (msg) {
        	var jsonObj = JSON.parse(msg);
        	var dataArray = [ ['transaction Id', 'amount', 'transaction Date', 'time', 'creditOrDebit', 'bankAccountNum','creditCardNum' ] ];
			for ( var i = 0; i < jsonObj.length; i++) {
				dataArray.push([ jsonObj[i].transactionId,
				                 jsonObj[i].amount,
				                 parseInt(jsonObj[i].transactionDate),
				                 jsonObj[i].time,
				                 parseInt(jsonObj[i].creditOrDebit),
				                 parseInt(jsonObj[i].bankAccountNum),
								 jsonObj[i].creditCardNum ]);
				
			}
		 	for ( var i = 0; i < jsonObj.length; i++) {
					$('#transactionTable').append('<tr onclick="getVal(this)"><td id="courseId">'+jsonObj[i].transactionId
							+'</td><td id="courseName">'+jsonObj[i].amount
							+'</td><td id="section">'+jsonObj[i].transactionDate
							+'</td><td id="classHours">'+jsonObj[i].time
							+'</td><td id="credits">'+jsonObj[i].creditOrDebit
							+'</td><td id="departmentId">'+jsonObj[i].bankAccountNum
							+'</td><td id="roomNumber">'+jsonObj[i].creditCardNum
							+'</td></tr>');
			}
        },
        error: function (msg) {
    		alert('error');
    		$('#error-message').text("Error message");
   		}
	});
};

</script>

<head>
<title>transaction</title>
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
		<table id="transactionTable" border=1>
			<tr>
				<td><b>Transaction Id </b></td>
				<td><b>Amount</b></td>
				<td><b>Transaction Date</b></td>
				<td><b>Time</b></td>
				<td><b>creditOrDebit</b></td>
				<td><b>Account Number</b></td>
				<td><b>Credit Card Number</b>
			</tr>
		</table>
	</div>
</center>
</body>
</html>