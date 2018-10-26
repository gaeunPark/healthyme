<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu"> 커뮤니티</div>
	<div class="container">
		<div class="contents">
		<form action="${pageContext.request.contextPath}/user/updateMyInfo" method="post">
			<table class="w3-table w3-centered  w3-bordered">
				<tr>
					<th>BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>VIEWCNT</th>
				</tr>
				<c:forEach var="post" items="${posts}">
				<tr>	
					<td>${post.postIdx}</td>
					<td><a href="/community/read?postIdx=${post.postIdx}">${post.postTitle}</a></td>									
					<td>${post.postWriter}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${post.regDate}"/></td>
					<td><span class="badge bg-red">${post.viewCount }</span></td>
				</tr>						
				</c:forEach>	
			</table>

		</form>
		
		
		
	
		
		</div> <!-- contents -->

	<div class="side"></div>
	</div> <!-- container -->
</section>
<%@ include file="../include/footer.jsp"%>