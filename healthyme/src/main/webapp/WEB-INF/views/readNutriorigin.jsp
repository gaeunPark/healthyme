<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="resources/dist/css/main.css?after" rel="stylesheet">

</head>
<body>



	<div>
		<div>
		<form role="form">
			<input type="text" style="width:30%;" class="form-control" placeholder="Search" id="searchKey"  name="searchKey"/>
			<button type="submit" id="searchBtn">검색</button>
			</form>
		</div>

		<table id="food_table" style="border: 1px solid black; text-align: center; width: 60%;">
			<thead>
			<tr>
				<td class="foodName" style="width: 10%;">음식명</td>
				<td class="serving_wt" style="width: 6%;">1회 제공량(g)</td>
				<td class="kcal" style="width: 6%;">열량(kcal)</td>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	
	
	<script>
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
	
	$(document).ready(function() {
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
		 
		 
		})
	});
	
	
		 $(document).ready(function() {
			$('#searchKey').keyup(function(){
				var k = $(this).val();
				$("#food_table > tbody > tr").hide();
				var temp = $("#food_table > tbody > tr > td:nth-child(3n+1):contains('" + k + "')");
				$(temp).parent().show();
			})
		});  

	</script>


</body>
</html>