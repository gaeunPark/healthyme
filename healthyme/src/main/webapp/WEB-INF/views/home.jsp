<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/dist/css/main.css">

<style>
body {
	width: 100%;
	padding-top: 140px;
}

html, body {
	height: 100%;
}
</style>

</head>


<body>	
	<div id="nav">
		<%@ include file="include/nav.jsp" %>
	</div>


	<div style="width: 100%; border: 2px solid black">
		<div
			style="border: solid 1px black; margin: auto; width: 80%; height: 600px;">
			${username} 반갑습니다.</div>
	</div>
</body>
</html>
