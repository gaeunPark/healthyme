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


<%@ include file="../include/footer.jsp"%>