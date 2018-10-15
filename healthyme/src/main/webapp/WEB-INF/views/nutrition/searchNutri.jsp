<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>



<!-- 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="resources/dist/css/main.css?after" rel="stylesheet"> -->





<div class="container">
	<div>
		<form action="/nutrition/searchNutri">
			<input type="text" style="width: 30%;" class="form-control"
				placeholder="Search" id="searchKey" name="searchKey" />
			<button type="submit" id="searchBtn">검색</button>
		</form>
	</div>
	<p><%=request.getParameter("searchKey")%>로 개가 검색되었습니다</p>
	<table id="food_table"
		style="border: 1px solid black; text-align: center; width: 60%;">
		<thead>
			<tr>
				<td class="idx" style="width: 3%;">순서</td>
				<td class="foodName" style="width: 10%;">음식명</td>
				<td class="serving_wt" style="width: 6%;">1회 제공량(g)</td>
				<td class="kcal" style="width: 6%;">열량(kcal)</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
</div>
'

<!-- 영양소Modal -->
<div class="modal fade" id="nutriModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<!--  모달 크기 조절 -->
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">영양소</h4>
			</div>
			<div class="modal-body">

				<form role="form" method="post" id="" onsubmit="return false;">
					<p>식품이름 </p>
					<p>1회제공량(g)<input type="text" id="aa"></p>
					<p>열량(kcal)</p>
					<p>탄수화물(g)</p>
					<p>단백질(g)</p>
					<p>지방(g)</p>
					<p>당류(g)</p>
					<p>나트륨(mg)</p>
					<p>콜레스테롤(mg)</p>
					<p>가공업체</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="submit" id="nutriAddBtn" class="btn btn-primary">추가하기</button>
				</form>
			</div>
		</div>
	</div>
</div>



<script>
$.ajax({
	url : '/nutrition/search?searchKey=' + "<%=request.getParameter("searchKey")%>",
		type : 'get',
		data : {
		//"searchKey" : searchKey
		},
		dataType : 'json',
		success : function(data) {
			var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
			console.log(myItem.length);

			for (var i = 0; i < myItem.length; i++) {
				var ntr = [];
				ntr.push(myItem[i].DESC_KOR);
				ntr.push(myItem[i].SERVING_WT);
				ntr.push(myItem[i].NUTR_CONT1);
				ntr.push(myItem[i].NUTR_CONT2);
				ntr.push(myItem[i].NUTR_CONT3);
				ntr.push(myItem[i].NUTR_CONT4);
				ntr.push(myItem[i].NUTR_CONT5);
				ntr.push(myItem[i].NUTR_CONT6);
				ntr.push(myItem[i].NUTR_CONT7);
				ntr.push(myItem[i].NUTR_CONT8);
				ntr.push(myItem[i].NUTR_CONT9)
				ntr.push(myItem[i].ANIMAL_PLANT);;
				
				
				text = '';
				text += '<tr>';
				text += '<td>' + (i+1) + '</td>'
				text += '<td><a data-toggle="modal" href="#nutriModal">'
						+ ntr[0] + '</a></td>';
				text += '<td>' + ntr[1] + '</td>'
				text += '<td>' + ntr[2] + '</td>'
				text += '</tr>';

				$("#food_table tbody").append(text);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status: " + textStatus);
			alert("Error: " + errorThrown);
		}
	});

	$(document).ready(function() {
		$('#searchKey').keyup(function() {
				var k = $(this).val();
				$("#food_table > tbody > tr").hide();
				var temp = $("#food_table > tbody > tr > td:nth-child(3n+1):contains('" + k + "')");
				$(temp).parent().show();
		})

		$('#nutriModal2').on("click", function() {
			
			<%-- $.ajax({
				url : '/nutrition/search?searchKey=' + "<%=request.getParameter("searchKey")%>",
				type : 'get',
				data : {
				//"searchKey" : searchKey
				}, //contentid, contentTypeid 서버로 전송
				dataType : 'json',
				success : function(data) {
					var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
					console.log(myItem.length);
					for (var i = 0; i < myItem.length; i++) {
						var ntr = [];
						ntr.push(myItem[i].DESC_KOR);
						ntr.push(myItem[i].SERVING_WT);
						ntr.push(myItem[i].NUTR_CONT1);
						ntr.push(myItem[i].NUTR_CONT2);
						ntr.push(myItem[i].NUTR_CONT3);
						ntr.push(myItem[i].NUTR_CONT4);
						ntr.push(myItem[i].NUTR_CONT5);
						ntr.push(myItem[i].NUTR_CONT6);
						ntr.push(myItem[i].NUTR_CONT7);
						ntr.push(myItem[i].NUTR_CONT8);
						ntr.push(myItem[i].NUTR_CONT9)
						ntr.push(myItem[i].ANIMAL_PLANT);;
											
						var foodName = myItem[i].DESC_KOR;
						var serving_wt = myItem[i].SERVING_WT;
						var kcal = myItem[i].NUTR_CONT1;
						
						/* text = '';
						text += '<tr>';
						text += '<td><a data-toggle="modal" href="#nutriModal">'
								+ ntr[0] + '</a></td>';
						text += '<td>' + ntr[1] + '</td>'
						text += '<td>' + ntr[2] + '</td>'
						text += '</tr>'; */
					
						$("#food_table tbody").append(text);
						
						document.getElementById('aa').value= serving_wt;
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
				}
			}); --%>
		})
	});

</script>



<%-- <script>
	 $(document).ready(function() {
		$("#searchBtn").on("click", function() {
				var searchKey = $("#searchKey").val();
				$.ajax({
					url : '/nutrition/search?searchKey=' + "<%= request.getParameter("searchKey") %>",
					type : 'get',
					data : {
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
	});
	
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
			
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
		 
		 
		})
	}); */
	
	</script>
 --%>

<%-- <script>
	$(document).ready(function() {
	var searchKey = <%= request.getParameter("searchKey") %>
	alert("Status: " + searchKey);
	$.ajax({
		url : '/nutrition/search?searchKey=' + searchKey,
		type : 'get',
		data : {
		/* 					"contentId" : "2521880",
		 "contentTypeId" : "15" */
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
	$(document).ready(function() {
		$('#searchKey').keyup(function(){
			var k = $(this).val();
			$("#food_table > tbody > tr").hide();
			var temp = $("#food_table > tbody > tr > td:nth-child(3n+1):contains('" + k + "')");
			$(temp).parent().show();
		})
	}); 
</script>
 --%>


<%@ include file="../include/footer.jsp"%>