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
						<td><a href="/community/read?boardIdx=${board.boardIdx}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${board.regDate}" /></td>
						<td><span class="badge bg-red">${board.viewCnt}</span></td>
					</tr>
				</c:forEach>
			</table>
			<a href="/community/create?categoryIdx=1">글쓰기</a>

			<div class="text-center">
				<ul class="pagination">

					<c:if test="${pageMaker.blPrev}">
						<li>
							<!-- 
									...276p.↓.
									<a href="/board/listPage?page=250">&laquo;</a>
									<a href="/board/listPage?page=${pageMaker.startPage - 1}">&laquo;</a>
									
									...288p.↓.페이지정보를 유지하게 함.
									...★'?page='가 필요없음에 주의할 것.
									<a href="/board/listPage?page=?page=250&perPageNum=10">&laquo;</a>									
									<a href="/board/listPage?page=${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a>
								 --> <a
							href="/board/listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a>
							<!-- startPage : ${pageMaker.makeQuery(pageMaker.startPage - 1)} -->
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<!-- 
									...277p.↓.li태그내의 서식을 동적으로 표현함.
									${pageMaker.cri.page}를 이용해서 getCriteria(), getPage()를 호출하여
									현재 페이지 번호만을 강조시킴.
								 -->
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<!-- 
									...277p.↓.
									<a href="listPage?page=${idx}">${idx}</a>
									...287p.↓.
									<a href="/board/listPage?page=251&perPageNum=10">251</a>
									<a href="/board/listPage${pageMaker.makeQuery(idx)}">${idx}</a>
								 --> <a href="/board/listPage${pageMaker.makeQuery(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.blNext && pageMaker.endPage > 0}">
						<li>
							<!-- 
									...276p.↓.
									<a href="/board/listPage?page=250">&laquo;</a>
									<a href="/board/listPage?page=${pageMaker.endPage + 1}">&laquo;</a>
									
									...288p.↓.페이지정보를 유지하게 함.
									...★'?page='가 필요없음에 주의할 것.
									<a href="/board/listPage?page=31&perPageNum=10">&raquo;</a>
									<a href="/board/listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
								 --> <a
							href="/board/listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
							<!-- endPage : ${pageMaker.next}, ${pageMaker.endPage } -->
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