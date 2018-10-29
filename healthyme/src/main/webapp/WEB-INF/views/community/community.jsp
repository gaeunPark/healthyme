<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu">커뮤니티</div>
	<div class="container">
		<div class="contents">

			<table class="w3-table w3-centered  w3-bordered">
				<tr>
					<th>BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>VIEWCNT</th>
				</tr>
				<c:forEach var="board" items="${boardVOs}">
					<tr>
						<td>${board.boardIdx}</td>
						<td><a href="/community/read${pageMaker.makeQuery(pageMaker.cri.page, 1)}&boardIdx=${board.boardIdx}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
						<td><span class="badge bg-red">${board.viewCnt}</span></td>
					</tr>
				</c:forEach>
			</table>
			<a href="/community/create?categoryIdx=1">글쓰기</a>

			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li> 
							<a href="/community/community${pageMaker.makeQuery(pageMaker.startPage - 1, 1)}">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="/community/community${pageMaker.makeQuery(idx, 1)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li> 
							<a href="/community/community${pageMaker.makeQuery(pageMaker.endPage + 1, 1)}">&raquo;</a>
						</li>
					</c:if>

				</ul>
			</div>




		</div>
		<!-- contents -->

		<div class="side"></div>
	</div>
	<!-- container -->
</section>
<%@ include file="../include/footer.jsp"%>