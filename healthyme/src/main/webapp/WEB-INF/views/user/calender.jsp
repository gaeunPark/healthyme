<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/jsCalendar.min.css">
<script
	src="${pageContext.request.contextPath}/resources/dist/js/jsCalendar.min.js"></script>



<section>

	<div class="container">
		<div class="contents">

			<input id="my-input-a"><br> 
			Month change : <br> <input id="my-input-b"><br>

			<div id="my-calendar" class="material-theme orange" ></div>

		</div>
		<!--  class="contents" -->

		<div class="side"></div>
	</div>
	<!--  class="container" -->


</section>

<script type="text/javascript">
    // Create the calendar
    var element = document.getElementById("my-calendar");
    var myCalendar = jsCalendar.new(element);

    var inputA = document.getElementById("my-input-a");
    var inputB = document.getElementById("my-input-b");
    // Add events
    myCalendar.onDateClick(function(event, date){
        inputA.value = date.toString();
    });
    myCalendar.onMonthChange(function(event, date){
        inputB.value = date.toString();
    });
    
    var b = document.getElementsByClassName("jsCalendar-current");
 	b.innerHTML='a';
	$(".jsCalendar-current").text("a<br>a");
	
    
</script>

<%@ include file="../include/footer.jsp"%>