<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="container">
		<div>
			<form action="/nutrition/searchNutri">
				<input type="text" style="width: 30%; display: inline-block;" class="form-control"
					placeholder="Search" id="searchKey" name="searchKey" />
				<input class="btn btn-default" type="submit" id="searchBtn" value="검색">
			</form>
		</div>
		<h3>
			<span><%=request.getParameter("searchKey")%></span>(으)로 <span
				class="food_total"></span>개 검색 되었습니다.
		</h3>
		<table class="w3-table w3-centered w3-hoverable w3-bordered" id="food_table">
			<thead class="color">
				<tr>
					<th class="idx" style="width: 3%;">순서
					</th>
					<th class="foodName" style="width: 10%;">음식명
					</th>
					<th class="serving_wt" style="width: 6%;">1회 제공량(g)
					</th>
					<th class="kcal" style="width: 6%;">열량(kcal)
					</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li> 
							<a href="/community/community${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="searchNutri?searchKey=<%=request.getParameter("searchKey")%>&pageNo=${idx}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li> 
							<a href="/community/community${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
		
	</div>
	

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
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<table id="food_modal"
						style="border: 1px solid black; text-align: center; width: 60%;">
						<tr>
							<th>식품이름</th>
							<td id="foodName">
							<td>
						</tr>
						<tr>
							<th>1회제공량(g)</th>
							<td id="servingWt">
							<td>
						</tr>
						<tr>
							<th>열량(kcal)</th>
							<td id="kcal">
							<td>
						</tr>
						<tr>
							<th>탄수화물(g)</th>
							<td id="carbo">
							<td>
						</tr>
						<tr>
							<th>단백질(g)</th>
							<td id="protein">
							<td>
						</tr>
						<tr>
							<th>지방(g)</th>
							<td id="fat">
							<td>
						</tr>
						<tr>
							<th>당류(g)</th>
							<td id="sugars">
							<td>
						</tr>
						<tr>
							<th>나트륨(mg)</th>
							<td id="sodium">
							<td>
						</tr>
						<th>가공업체</th>
						<td id="enterprise">
						<td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<c:if test="${!empty sessionScope.username}">
					<button type="submit" id="nutriAddBtn" class="btn btn-primary">추가하기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>



	<script>
	$.ajax({
		url : '/nutrition/search?searchKey=' + "<%=request.getParameter("searchKey")%>" + '&pageNo=1',
		contentType: 'application/json',
		type : 'get',
		dataType : 'json',
		success : function(data) {
			var totalCount = data.response.body.totalCount;
			console.log(totalCount);
			var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
			$(".food_total").html(myItem.length);
			
			for (var i = 0; i < myItem.length; i++) {
				var ntr = [];
				ntr.push(myItem[i].DESC_KOR);
				ntr.push(myItem[i].SERVING_WT);
				ntr.push(myItem[i].NUTR_CONT1);
				ntr.push(myItem[i].NUTR_CONT2);

				text = '';
				text += '<tr>';
				text += '<td>' + (i+1) + '</td>'
				text += '<td class="food_td" data-fName="' + ntr[0] + '"><a class="c" data-toggle="modal" href="#nutriModal">'
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
		
		$("#food_table").on("click", ".food_td a", function(){
			var food = $(this).parent();
			var fName = food.attr("data-fName");

			$(".modal-title").html(fName);
			$.ajax({
				url : '/nutrition/search?searchKey=' + fName,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var myItem = data.response.body.items.item;
						var foodName = myItem.DESC_KOR;
						var servingWt = myItem.SERVING_WT;
						var kcal = myItem.NUTR_CONT1;
						var carbo = myItem.NUTR_CONT2;
						var protein = myItem.NUTR_CONT3;
						var fat = myItem.NUTR_CONT4;
						var sugars = myItem.NUTR_CONT5;
						var sodium = myItem.NUTR_CONT6;
						var enterprise = myItem.ANIMAL_PLANT;
						
						$("#foodName").html(foodName);
						$("#servingWt").html(servingWt);
						$("#kcal").html(kcal);
						$("#carbo").html(carbo);
						$("#protein").html(protein);
						$("#fat").html(fat);
						$("#sugars").html(sugars);
						$("#sodium").html(sodium);
						$("#enterprise").html(enterprise);
				}
			});
		});
		
		
		
		$("#nutriAddBtn").on("click", function(){
			var foodName = $("#foodName").html();
			var servingWt = $("#servingWt").html();
			var kcal = $("#kcal").html();
			var carbo = $("#carbo").html();
			var protein = $("#protein").html();
			var fat = $("#fat").html();
			var sugars = $("#sugars").html();
			var sodium = $("#sodium").html();
			var enterprise = $("#enterprise").html()
			
			$.ajax({
				type : 'POST',
				url : '/user/addNutri/',
				contentType : "application/json; charset=UTF-8",
				dataType : 'text',
				data : JSON.stringify({
					foodName : foodName,
					kcal : kcal,
					carbo : carbo,
					servingWt : servingWt,
					protein : protein,
					fat : fat,
					sugars : sugars,
					sodium : sodium,
					enterprise : enterprise
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						location.href = "/user/myPage";
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("Status: " + textStatus);
					alert("Error: " + errorThrown);
				}
			});
		});
		
		$('#searchKey').keyup(function() {
				var k = $(this).val();
				$("#food_table > tbody > tr").hide();
				var temp = $("#food_table > tbody > tr > td:nth-child(3n+1):contains('" + k + "')");
				$(temp).parent().show();
		})

	});

</script>

</section>


	<%@ include file="../include/footer.jsp"%>