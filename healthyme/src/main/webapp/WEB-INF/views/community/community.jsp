<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu"><h3>커뮤니티</h3></div>
	<div class="container">
		<div>
			<table class="w3-table w3-centered w3-bordered">
				<thead class="color">
					<tr>
						<th></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<c:forEach var="board" items="${boardVOs}">
					<tr>
						<td>${board.boardIdx}</td>
						<td><a href="/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&boardIdx=${board.boardIdx}">${board.title}
						<span style="color: blue;">[${board.replyCnt}]</span></a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
						<td><span class="badge bg-red">${board.viewCnt}</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="create">
			<a class="createBtn" href="/community/create?categoryIdx=${pageMaker.cri.categoryIdx}">글쓰기</a>
		</div>
		
		<div>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li> 
							<a href="/community/community${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="/community/community${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li> 
							<a href="/community/community${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>	
			<div>
			<select id="searchType" name="searchType">
						<option value="t"
							<c:out value="${pageMaker.cri.searchType eq 't'?'selected':''}"/>>
							제목 
						</option>
						<option value="c"
							<c:out value="${pageMaker.cri.searchType eq 'c'?'selected':''}"/>>
							내용
						</option>
						<option value="w"
							<c:out value="${pageMaker.cri.searchType eq 'w'?'selected':''}"/>>
							작성자
						</option>
						<option value="tc"
							<c:out value="${pageMaker.cri.searchType eq 'tc'?'selected':''}"/>>
							제목+내용
						</option>
						<option value="cw"
							<c:out value="${pageMaker.cri.searchType eq 'cw'?'selected':''}"/>>
							내용+작성자
						</option>
						<option value="tcw"
							<c:out value="${pageMaker.cri.searchType eq 'tcw'?'selected':''}"/>>
							전체
						</option>
				</select>
					
					<input type="text" name='keyword' id="keywordInput"
										value='${pageMaker.cri.keyword}'>
					<button id='searchBtn'>Search</button>
					<input class="btn btn-default" type="submit" id="searchBtn" value="검색">
			</div>
	</div>
	<!-- container -->
</section>



<script>
	$(document).ready(function() {
		$('#searchBtn').on("click", function(event) {
			self.location = "community"
							+ '${pageMaker.makeQuery(1)}'
							+ "&categoryIdx=" + ${pageMaker.cri.categoryIdx}
							+ "&searchType="
							+ $("#searchType option:selected").val()
							+ "&keyword=" + $('#keywordInput').val();
		});


	});
</script>
<%@ include file="../include/footer.jsp"%>