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
						<td style="text-align:right;">목표체중 앞으로 -kg</td>
					</tr>
					<tr>
						<th>식단칼로리</th>
						<td colspan="3">
							<div class="progress">
								<div
									class="progress-bar progress-bar-success progress-bar-striped active"
									role="progressbar" aria-valuenow="5" aria-valuemin="0"
									aria-valuemax="100" style="min-width: 2em; width: 2%;">2%</div>
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
				
				<div class="circleDiv">아침</div>
				<div class="circleDiv">점심</div>
				<div class="circleDiv">저녁</div>
				<div class="circleDiv">운동</div>
			</div>

		</div>
		<div class="side"></div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>