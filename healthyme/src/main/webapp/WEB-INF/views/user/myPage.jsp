<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>

	<div class="container">
		<div class="contents">
			<div class="date-wrap">
				<div class="date-inner"><%=request.getParameter("date")%></div>
			</div>

			<div class="content-wrap">
				<table class="w3-table w3-centered w3-bordered" id="mypage-table">
					<tr>
						<th>체성분</th>
						<td>몸무게</td>
						<td>
							<input type="text" name="weight" value="${weight}" id="weight">
							<input type="submit" id="addWeightBtn" value="저장"></td>
						<td style="text-align: right;">목표체중 앞으로 -${login.goalWeight}kg</td>
					</tr>
					<tr>
						<th>식단칼로리</th>
						<td colspan="3">
							<div class="progress">
								<div
									class="progress-bar progress-bar-success progress-bar-striped active"
									role="progressbar" aria-valuenow="5" aria-valuemin="0"
									aria-valuemax="100" style="min-width: 2em; width: 50%;">${sumNutri.sumKcal}</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>운동칼로리</th>
						<td colspan="3">
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									style="width: 35%">
									<span class="sr-only">35% Complete (success)</span>
								</div>
								<div
									class="progress-bar progress-bar-warning progress-bar-striped"
									style="width: 20%">
									<span class="sr-only">20% Complete (warning)</span>
								</div>
								<div class="progress-bar progress-bar-danger" style="width: 10%">
									<span class="sr-only">10% Complete (danger)</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>영양소</th>
						<td colspan="3"></td>

					</tr>
				</table>

				<%-- <div role="tabpanel">

					<!-- Nav tabs -->
					<div class="nav nav-tabs" role="tablist">
						<div role="presentation" class="circleDiv active">
							<a href="#아침" aria-controls="아침" role="tab" data-toggle="tab">아침</a>
							<br>
							<span class="glyphicon glyphicon-plus" aria-hidden="true">추가하기</span>
						</div>
						<div class="circleDiv" role="presentation">
							<a href="#점심" aria-controls="점심" role="tab" data-toggle="tab">점심</a>
						</div>
						<div class="circleDiv" role="presentation">
							<a href="#저녁" aria-controls="messages" role="tab"
								data-toggle="tab">저녁</a>
						</div>
						<div class="circleDiv" role="presentation">
							<a href="#운동" aria-controls="settings" role="tab"
								data-toggle="tab">운동</a>
						</div>
					</div>

					<!-- Tab panes -->
					<div class="tab-content">


						<div role="tabpanel" class="tab-pane active" id="아침">
							<table>
								<tr>
									<td>칼로리</td>
									<td>아침</td>
								</tr>
								<c:forEach var="dietList" items="${dietLists}">
									<c:if test="${dietList.timeslot == 0}">
										<tr>
											<td>${dietList.foodName}</td>
											<td>${dietList.kcal}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>

						<div role="tabpanel" class="tab-pane" id="점심">
							<table>
								<tr>
									<td>칼로리</td>
									<td>점심</td>
								</tr>
								<c:forEach var="dietList" items="${dietLists}">
									<c:if test="${dietList.timeslot == 1}">
										<tr>
											<td>${dietList.foodName}</td>
											<td>${dietList.kcal}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>

						<div role="tabpanel" class="tab-pane" id="저녁">
							<table>
								<tr>
									<td>칼로리</td>
									<td>저녁</td>
								</tr>
								<c:forEach var="dietList" items="${dietLists}">
									<c:if test="${dietList.timeslot == 2}">
										<tr>
											<td>${dietList.foodName}</td>
											<td>${dietList.kcal}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>

						<div role="tabpanel" class="tab-pane" id="운동">
							<table>
								<tr>
									<td>칼로리</td>
									<td>운동</td>
								</tr>
							</table>
						</div>
					</div> --%>
					
					<div>
						<c:forEach var="dietList" items="${dietLists}">
							<c:if test="${dietList.timeslot == 1}">
								<tr>
									<td>${dietList.foodName}</td>
									<td>${dietList.kcal}</td>
								</tr>
							</c:if>
						</c:forEach>
					</div>
					
					<div>
						<a href="${pageContext.request.contextPath}/user/calender">달력</a>
					</div>


				</div>
			</div>
		</div> <!-- contents -->
		<div class="side"></div>
	</div> <!-- container -->
</section>

<script>
	$(document).ready(function() {

		$("#addWeightBtn").on("click", function() {
			var weight = $("#weight").val();
			$.ajax({
				type : 'post',
				url : '/user/addWeight/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					date : "<%=request.getParameter("date")%>",
					weight : weight,
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
					}
				}
			});
			
		});
	
	
	}); //document.ready

</script>
<%@ include file="../include/footer.jsp"%>