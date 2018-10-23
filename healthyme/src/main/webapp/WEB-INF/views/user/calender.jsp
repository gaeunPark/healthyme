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


<!-- <script type='text/javascript'>
var calendar = null;
var events = null;

events = [
    {
        title: 'Long Event',
        color: 'red',
        backgroundColor: 'yellow',
        borderColor: 'blue',
        textColor: 'green',
        uid: 'event_0003',                     //--- Customize한 속성
        flagCheckbox: true                     //--- Customize한 속성
    }
];

$(document).ready(function() {
	calendar = $('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		lang: "ko",
		selectable: true,
		selectHelper: true,
		dayClick: function(date, allDay, jsEvent, view) {
			window.alert("dayClick");
			calendar.fullCalendar('unselect');
		},
		eventClick: function(calEvent, jsEvent, view) {
			window.alert("eventClick");
		},
		select: function(start, end, allDay) {
			var title = prompt('Event Title:');
			if (title) {
				calendar.fullCalendar('renderEvent',
					{
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
			}
			calendar.fullCalendar('unselect');
		},
		eventMouseover: function( event, jsEvent, view) { 
			window.alert("eventMouseover");
		},
		eventMouseout: function( event, jsEvent, view) { 
			window.alert("eventMouseout");
		},
		eventDrop: function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) {
			window.alert("eventDrop");
		},
		eventResize:function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) { 
			window.alert("eventResize");
		},
 		editable: true,
 		events: events,
		firstDay: 0,				//---	0. 일요일
		weekends: true,
		allDaySlot: true,
		allDayText: '종일',
		axisFormat : 'hh:mm tt',
		slotMinutes: 30,
		defaultEventMinutes: 60,
		firstHour: 9,
		timeFormat: 'hh:mm tt',
		columnFormat: {month: 'ddd', week: 'M/d ddd', day: 'M/d dddd'}
	});
});
</script> -->





<script>
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
	
	$(document).ready(function() {
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