<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>





<div class="container">
	<div>
		<div>
			<form action="/nutrition/searchNutri">
				<input type="text" style="width: 30%; display: inline-block;" class="form-control"
					placeholder="Search" id="searchKey" name="searchKey" />
				<input class="btn btn-default" type="submit" id="searchBtn" value="검색">
			</form>
		</div>
		<p>음식 검색어 순위</p>
		<table class="w3-table w3-centered w3-hoverable w3-bordered" id="food_table">
			<thead class="color">
				<tr>
					<th style="width: 10%;">순위</th>
					<th class="foodName" style="width: 30%;">음식명</th>
					<th class="serving_wt" style="width: 20%;">1회 제공량(g)</th>
					<th class="kcal" style="width: 20%;">열량(kcal)</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div></div class="side">
</div>


<%@ include file="../include/footer.jsp"%>