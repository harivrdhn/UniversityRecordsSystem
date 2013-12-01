<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
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

$(document).ready(function() {
	
	$('#submit').click(function(){
		
		var addressLine = document.getElementById('addressLine').value;
		var city = document.getElementById('city').value;
		var state = document.getElementById('state').value;
		var zip = document.getElementById('zip').value;
		
		$.ajax({
		        Type: "GET",
		        url: "http://localhost:8081/UniversityRecordSystemClient/editPersonDetailsServlet",
		        data: "addressLine="+addressLine+"&city="+city+"&state="+state+"&zip="+zip+"&personId="+getCookie("personId"),
		        success: function (msg) {
		        	$('#success-message').text("Changes saved successfully!");	
		        		        	
		        },
		    	error: function (error) {
		    		alert('Failed to save changes! please try again');
		    		$('#error-message').text("Error message");
		   		}
		  });
	});
});

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
<table>
                <tr>
		    <td style="padding-top: 20px"></td>
                    <td style="width: 100px;padding-top: 30px;"><h3>Edit Profile Data</h3></td>
                </tr>
                <tr>
                <td><label id="success-message"></label></td>
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 30px;padding-left: 20px"><b>Address Line:</b></td>
                    <td style="padding-top: 30px;padding-right: 30px">
                        <input type="text" name="addressLine" id="addressLine">  
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 20px;padding-left: 20px"><b>City:</b></td>
                    <td style="padding-top: 20px">
                        <input type="text" name="city" id="city">   
                    </td>                    
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 20px;padding-left: 20px"><b>State:</b></td>
                    <td style="padding-top: 20px">
                        <input type="text" name="state" id="state">
                    </td>                    
                </tr>
                <tr>
                    <td style="width: 100px;padding-top: 20px;padding-left: 20px"><b>Zip:</b></td>
                    <td style="padding-top: 20px">
                        <input type="text" name="zip" id="zip">  
                    </td>                    
                </tr>   
                <tr >
                    <td style="padding-top: 20px"></td>
                    <td style="padding-top: 20px">
                    	<input type="submit" value="Submit" id="submit">
                    </td>
                </tr>
                             
            </table>
</center>
</body>
</html>