<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>


<section>

	<div class="container" style="width: 100%; border: 2px solid black; padding:0 10%;">
		<div class="contents" style="border: solid 1px black; height: 600px; float: left; width: 75%;">
			${username} 반갑습니다.
		</div>
		<div class="side" style="border: 1px solid green; height:600px; float: right;  width: 20%; ">
		
		</div>
	</div>
</section>

<%@ include file="include/footer.jsp"%>