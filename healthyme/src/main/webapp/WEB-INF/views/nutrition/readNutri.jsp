<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>





<div class="container">
	<div>
		<div>
			<form action="/nutrition/searchNutri">
				<input type="text" style="width: 30%;" class="form-control"
					placeholder="Search" id="searchKey" name="searchKey" />
				<button type="submit" id="searchBtn">검색</button>
			</form>
		</div>
		<p>음식 검색어 순위</p>
		<table id="food_table"
			style="border: 1px solid black; text-align: center; width: 60%;">
			<thead>
				<tr>
					<td style="width: 10%;">순위</td>
					<td class="foodName" style="width: 30%;">음식명</td>
					<td class="serving_wt" style="width: 20%;">1회 제공량(g)</td>
					<td class="kcal" style="width: 20%;">열량(kcal)</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div></div class="side">
</div>


<!-- <script>
	/* $(document).ready(function() {
		$("#searchBtn").on("click", function() {
				var searchKey = $("#searchKey").val();
				$.ajax({
					url : '/nutrition/',
					type : 'get',
					data : {
							"searchKey" : searchKey
					}, //contentid, contentTypeid 서버로 전송
					dataType : 'json',
					success : function(data) {
						var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
						console.log(myItem.length);
						
						for (var i=0; i<myItem.length; i++) {
							var foodName = myItem[i].DESC_KOR;
							var serving_wt = myItem[i].SERVING_WT;
							var kcal = myItem[i].NUTR_CONT1;
							
							text = '';
							text += '<tr>';
							text += '<td>' + foodName + '</td>';
							text += '<td>' + serving_wt + '</td>'
							text += '<td>' + kcal + '</td>'
							text += '</tr>';
				
							$("#food_table tbody").append(text);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
					}
				});
			
		});
	}); */
	
	/* $(document).ready(function() {
		$("#searchBtn").on("click", function() {
		var searchKey = $("#searchKey").val();
		 $.ajax({
			url : '/nutrition/search',
			type : 'get',
			data : {
				"searchKey" : searchKey
			}, //contentid, contentTypeid 서버로 전송
			dataType : 'json', */
			/* success :  function(data) {
				var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
				console.log(myItem.length);
				
				for (var i=0; i<myItem.length; i++) {
					var foodName = myItem[i].DESC_KOR;
					var serving_wt = myItem[i].SERVING_WT;
					var kcal = myItem[i].NUTR_CONT1;
					
					text = '';
					text += '<tr>';
					text += '<td>' + foodName + '</td>';
					text += '<td>' + serving_wt + '</td>'
					text += '<td>' + kcal + '</td>'
					text += '</tr>';
		
					$("#food_table tbody").append(text);
				}
				alert("검색!");
			}, */
		/* 	error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		}); */
		 
		 
		//})
	// });
	
	
		 $(document).ready(function() {
			$('#searchKey').keyup(function(){
				var k = $(this).val();
				$("#food_table > tbody > tr").hide();
				var temp = $("#food_table > tbody > tr > td:nth-child(3n+1):contains('" + k + "')");
				$(temp).parent().show();
			})
		});  

	</script>
 -->


<%@ include file="../include/footer.jsp"%>