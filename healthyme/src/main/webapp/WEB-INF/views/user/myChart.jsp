<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<section>

	<div class="container">
		<div class="contents">
			
			<div class="chart-container" style="height: auto; width: 100%">
				<canvas id="myChartWeight"></canvas>
				<canvas id="myChartKcal"></canvas>
			</div>

		</div>
		<div class="side"></div>
	</div>
	</div>
</section>

<script>
	var ctxWeight = document.getElementById("myChartWeight").getContext('2d');
	
	var Weightdata = [ 12, 19, 3, 3, 2, 3 ];
	var ctxWeight = new Chart(ctxWeight, {
		type : 'line',
		data : {
			labels : [ 1, 31, 1 ],
			datasets : [ {
				label : '체중 변화',
				data : Weightdata,
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)' ],
				borderWidth : 1
			} ],

		},
		options : options
	});

	var options = {
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
	};
	
	
	


	var ctxKcal = document.getElementById("myChartKcal").getContext('2d');
	
	var Kcaldata = [ 12, 19, 3, 3, 2, 3 ];
	var ctxKcal = new Chart(ctxKcal, {
		type : 'bar',
		data : {
			labels : [ 1, 31, 1 ],
			labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '그래프 테스트',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }],

		},
		options : options
	});

	var options = {
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
	};
</script>

<%@ include file="../include/footer.jsp"%>