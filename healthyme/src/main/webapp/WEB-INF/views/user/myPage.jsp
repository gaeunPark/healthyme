<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<section>

	<div class="container">
		<div class="contents">
			<div class="date-wrap">
				<div class="date-inner">< 2018.10.15 ></div>
			</div>

			<div class="content-wrap">
				<table class="mypage-table">
					<tr>
						<th>체성분</th>
						<td>몸무게</td>
						<td>입력칸</td>
						<td style="text-align: right;">목표체중 앞으로 -kg</td>
					</tr>
					<tr>
						<th>식단칼로리</th>
						<td colspan="3">
							<div class="progress">
								<div
									class="progress-bar progress-bar-success progress-bar-striped active"
									role="progressbar" aria-valuenow="5" aria-valuemin="0"
									aria-valuemax="100" style="min-width: 2em; width:50%;">${sumNutri.sumKcal}</div>
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
						<td colspan="3">gdf</td>

					</tr>
				</table>

				<script>
				alert("${sumNutri.sumKcal}");
				</script>
				<%-- <div class="circleDiv">
					<a href="${pageContext.request.contextPath}/nutrition/readNutri">아침</a>
				</div>
				<div class="circleDiv">점심</div>
				<div class="circleDiv">저녁</div>
				<div class="circleDiv">운동</div> --%>


				<div role="tabpanel">

					<!-- Nav tabs -->
					<div class="nav nav-tabs" role="tablist">
						<div role="presentation" class="circleDiv active"><a href="#아침"
							aria-controls="아침" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>아침</a></div>
						<div class="circleDiv" role="presentation"><a href="#점심"
							aria-controls="점심" role="tab" data-toggle="tab">점심</a></div>
						<div class="circleDiv" role="presentation"><a href="#저녁"
							aria-controls="messages" role="tab" data-toggle="tab">저녁</a></div>
						<div class="circleDiv" role="presentation"><a href="#간식"
							aria-controls="settings" role="tab" data-toggle="tab">간식</a></div>
						<div class="circleDiv" role="presentation"><a href="#운동"
							aria-controls="settings" role="tab" data-toggle="tab">운동</a></div>
					</div>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="아침">aaaa..</div>
						
						<div role="tabpanel" class="tab-pane" id="점심">.bbbb.</div>
						
						<div role="tabpanel" class="tab-pane" id="저녁">ccccc...</div>
						
						<div role="tabpanel" class="tab-pane" id="간식">..dddd.</div>
						
						<div role="tabpanel" class="tab-pane" id="운동">..fffff.</div>
						
					</div>

				</div>
			</div>
		</div>
		<div class="side"></div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>