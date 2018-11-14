<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu"> 회원정보 정보수정</div>
	<div class="container">
		<div class="contents">
		<form action="${pageContext.request.contextPath}/user/myInfo" method="post">
			<table class="w3-table w3-centered  w3-bordered">
				<tr><td><input type="hidden" name="userIdx" value="${userVO.userIdx}"></td></tr>
				<tr>
					<th>이름</th>
					<td><input class="w3-input w3-border" type="text" name="username" value="${userVO.username}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="w3-input w3-border" type="text" name="email" value="${userVO.email}"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="w3-input w3-border" type="text" name="userpw" value="${userVO.userpw}"></td>
				</tr>
				<tr>
					<th>키</th>
					<td><input class="w3-input w3-border" type="text" name="height" value="${userVO.height}"></td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td><input class="w3-input w3-border" type="text" name="goalWeight" value="${userVO.goalWeight}"></td>
				</tr>
		</table>
		<input class="btn btn-default" type="submit" value="저장">
		</form>

		</div> <!-- contents -->

	<div class="side"></div>
	</div> <!-- container -->
</section>


<%@ include file="../include/footer.jsp"%>