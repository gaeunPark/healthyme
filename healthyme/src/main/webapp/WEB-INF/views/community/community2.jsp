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
						<td><a
							href="/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&boardIdx=${board.boardIdx}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${board.regDate}" /></td>
						<td><span class="badge bg-red">${board.viewCnt}</span></td>
					</tr>
				</c:forEach>
			</table>

			<a href="/community/create?categoryIdx=${pageMaker.cri.categoryIdx}">글쓰기</a>

			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="/community/community${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="/community/community${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="/community/community${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
						</li>
					</c:if>

				</ul>
			</div>
			<select id="a" name="searchType">
				<option value="n"
					<c:if test="${pageMaker.cri.searchType == 'n'}">selected</c:if>>
					---</option>
				<option value="t"
					<c:if test="${pageMaker.cri.searchType == 't'}">selected</c:if>>					
					Title</option>
				<option value="c"
					<c:if test="${pageMaker.cri.searchType == 'c'}">selected</c:if>>
					Content</option>
				<option value="w"
					<c:if test="${pageMaker.cri.searchType == 'w'}">selected</c:if>>
					Writer</option>
				<option value="tc"
					<c:if test="${pageMaker.cri.searchType == 'tc'}">selected</c:if>>
					Title OR Content</option>
				<option value="cw"
					<c:if test="${pageMaker.cri.searchType == 'cw'}">selected</c:if>>
					Content OR Writer</option>
				<option value="tcw"
					<c:if test="${pageMaker.cri.searchType == 'tcw'}">selected</c:if>>
					Title OR Content OR Writer</option>
			</select> 
			<input type="text" name='keyword' id="keywordInput"
				value='${pageMaker.cri.keyword}'>
			<button id='searchBtn'>Search</button>

		</div>
		<!-- contents -->

		<div class="side"></div>
	</div>
	<!-- container -->
</section>

<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "community"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("#a option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			}); /* document */
</script>



<%@ include file="../include/footer.jsp"%>