<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript"></script>
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
<h1>Content</h1>
<h2>Replacing the Contents of the Current Frame</h2>
<p>Clicking on these links will open the new page within the current frame.</p>
<ul>
	<li><a href="white.html" target="content">Load white page</a></li>
	<li><a href="green.html" target="content">Load green page</a></li>
</ul>

<h2>Replacing the Whole Frameset</h2>
<p>When you click on any of the following links, the whole frameset is replaced with the new website. This is because we're using <code>target="_top"</code> in the anchor links.</p>
<ul>
	<li><a href="http://www.quackit.com" target="_top">Quackit</a></li>
	<li><a href="http://www.quackit.com/html/templates/frames/" target="_top">HTML Frames Templates</a></li>
	<li>Learn more about frames with the <a href="http://www.quackit.com/html/tutorial/html_frames.cfm" target="_top">frames tutorial</a><//li>
</ul>

<h2>Open a New Window</h2>
<p>These links open in a new browser window. This is because we use <code>target="_blank"</code>.</p>
<ul>
	<li><a href="http://www.code-generator.net" target="_blank">Code Generator</a></li>
	<li><a href="http://www.zappyhost.com" target="_blank">ZappyHost</a></li>
	<li><a href="http://www.natural-environment.com" target="_blank">Natural Environment</a></li>
	<li><a href="http://www.great-workout.com" target="_blank">Great Workout</a></li>
</ul>

</body>
</html>