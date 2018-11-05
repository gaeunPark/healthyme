<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/fullcalendar.min.css">
<script src="${pageContext.request.contextPath}/resources/dist/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/ko.js"></script>




<section>

	<div class="container">
		<div class="contents">

			<div id="calendar"></div>
			<div><a href="${pageContext.request.contextPath}/user/myChart">차트보기</a></div>


		</div>
		<!--  class="contents" -->

		<div class="side"></div>
	</div>
	<!--  class="container" -->


</section>

<script>
	
	
	$(document).ready(function() {
		var events = [];
		$.ajax({
			type : 'post',
			url : '/user/getWeightEvents/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			success : function(data) {
				if(data != 'empty'){
					$.each(data, function(key, val){
						events.push({
							title: val.weight,
							start: val.date,
					        backgroundColor: 'orange',
					        borderColor: 'white',
					        textColor: 'black',
							flagCheckbox: true
						})
					})
				}
			}
		});
		console.log(events);
		$.ajax({
			type : 'post',
			url : '/user/getKcalEvents/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			success : function(data) {
				if(data != 'empty'){
					$.each(data, function(key, val){
						events.push({
							title: val.sumKcal,
							start: val.date,
					        backgroundColor: 'green',
					        borderColor: 'white',
					        textColor: 'white',
							flagCheckbox: true
						})
					})
				}
			}
		});
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({

			lang: "ko",
			header: {
				left: 'prev',
				center: "title",
				right: "today next"
			},
			buttonIcons: false,
			editable: true,
			defaultView: 'month',
			navLinks: true,
			navLinkDayClick: function(date, jsEvent) {
			    var date = date.format();		 	
			    location.href = "/user/myPage?date=" + date;
			},
			events: events,
			timeFormat : "HH:mm"

			
		}) /* fullCalendar */
	}); /* document.ready */
	
	
</script>

<%@ include file="../include/footer.jsp"%>