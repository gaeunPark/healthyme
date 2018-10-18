<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/jsCalendar.css">
<script src="${pageContext.request.contextPath}/resources/dist/js/jsCalendar.js"></script>
<script src="jsCalendar.lang.de.js"></script>



<section>

	<div class="container">
		<div class="contents">
			<div class="auto-jsCalendar material-theme orange" style="width: 80%;"></div>


		</div>

		
	</div>
	<div class="side"></div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>