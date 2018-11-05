<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<section>

	<div class="container">
		<div class="contents">

			<div class="chart-container" style="height: auto; width: 100%">
				<div>
				<form action="/user/myChart">
					<select class="form-control" name="select_year" style="width: 100px; display:inline-block;">
						<option value="2016">2016</option>	
						<option value="2017">2017</option>
						<option value="2018" selected>2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>	
					</select> 년 &nbsp;&nbsp;&nbsp;
					<select class="form-control" name="select_month" style="width: 100px; display:inline-block;">
						<option value="">선택</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11" selected>11</option>
						<option value="12">12</option>
					</select> 월 &nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="submit" value="검색">
				</form>
				</div>
				
				<canvas id="myChartWeight"></canvas>
				<canvas id="myChartKcal"></canvas>
				<canvas id="myChartNtr"></canvas>
			</div>

		</div>
		<div class="side"></div>
	</div>
	
</section>

<script>
	var month="<%=request.getParameter("select_year")%>" + "-" + "<%=request.getParameter("select_month")%>";
	var options = [];
	var labels = []
	for (var i = 1; i <= 31; i++) {
		labels.push(String(i));
	};
	var options = {
			/* maintainAspectRatio : false,
			spanGaps : false, */
			elements : {
				line : {
					tension: 0.000001
				}
			}
			/* plugins : {
				filler : {
					propagate : false
				}
			},
			scales : {
				xAxes : [{
					ticks : {
						type : 'time',
						autoSkip : false,
						maxRotation : 0
					}
				}]
			} */
		};

	
	$(document).ready(function(){	
	var Weightdata = [];
	$.ajax({
		type : 'post',
		url : '/user/selectMonthWeight?month=' + month,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		success : function(data) {
			if (data != 'empty') {
				$.each(data, function(key, val) {
					Weightdata.push({
						x: val.date,
						y: parseFloat(val.weight)
					})
				})
			}
		}
	});
	console.log(Weightdata);
	var Kcaldata = [];
	$.ajax({
		type : 'post',
		url : '/user/selectMonthKcal?month=' + month,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		success : function(data) {
			if (data != 'empty') {
				$.each(data, function(key, val) {
					Kcaldata.push({
						x: val.date,
						y: parseFloat(val.sumKcal)
					})
				})
			}
		}
	});
	console.log(Kcaldata);
	var Ntrdata = [];
	$.ajax({
		type : 'post',
		url : '/user/avgNutri?month=' + month,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		success : function(data) {
			if (data != 'empty') {
					Ntrdata.push(data.avgCarbo)
					Ntrdata.push(data.avgProtein)
					Ntrdata.push(data.avgFat)
					Ntrdata.push(data.avgSugars)
					Ntrdata.push(data.avgSudium)
			}
		}
	});

	var ctxWeight = document.getElementById("myChartWeight").getContext('2d');
	var ctxWeight = new Chart(ctxWeight, {
		type : 'line',
		data : {
			labels : labels,
			datasets : [{
				label : month + ' 체중 변화',
				data : Weightdata,
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderWidth : 1
				/* fill: false */
			} ],

		},
		options : options
	});
	var ctxKcal = document.getElementById("myChartKcal").getContext('2d');
	var ctxKcal = new Chart(ctxKcal, {
		type : 'bar',
		data : {
			labels : labels,
			datasets : [{
				label : month + ' 칼로리 변화',
				data : [{x:'10', y:20}],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)' ],
				borderWidth : 1
			} ],
		},
		options : options
	});
	var ctxNtr = document.getElementById("myChartNtr").getContext('2d');
	var ctxNtr = new Chart(ctxNtr, {
		type : 'pie',
		data : {
			labels : ["탄수화물", "단백질", "지방", "당류", "나트륨"],
			datasets : [{
				label : month + ' ctx',
				data : Ntrdata ,
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderWidth : 1
			} ],
		},
		options : options
	});

	
	
	/* 	var options = {
	 maintainAspectRatio : false,
	 spanGaps : false,
	 elements : {
	 line : {
	 tension : 0.000001
	 }
	 },
	 plugins : {
	 filler : {
	 propagate : false
	 }
	 },
	 scales : {
	 xAxes : [ {
	 ticks : {
	 autoSkip : false,
	 maxRotation : 0,
	 beginAtZero : true
	 }
	 } ]
	 }
	 }; */
	 
	}); /* document */
</script>

<%@ include file="../include/footer.jsp"%>