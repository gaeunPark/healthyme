<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu"> 회원정보 정보수정</div>
	<div class="container">
		<div class="contents">
			<table class="w3-table w3-centered  w3-bordered" id="">
				<tr>
					<th class="idx">이름
					</th>
					<td><input class="w3-input w3-border" type="text"></td>
				</tr>
				<tr>
					<th class="foodName">이메일
					</th>
					<td><input class="w3-input w3-border" type="text"></td>
				</tr>
				<tr>
					<th class="serving_wt" >비밀번호
					</th>
					<td><input class="w3-input w3-border" type="text"></td>
				</tr>
				<tr>
					<th class="kcal">키
					</th>
					<td><input class="w3-input w3-border" type="text"></td>
				</tr>
				<tr>
					<th class="kcal">몸무게
					</th>
					<td><input class="w3-input w3-border" type="text"></td>
				</tr>
			<tbody>
			</tbody>
		</table>
		
		
		
		
		
		
		
		
		
		
		</div> <!-- contents -->

	<div class="side"></div>
	</div> <!-- container -->
</section>

<script>
	$(document).ready(function() {

		$("#addWeightBtn").on("click", function() {
			var weight = $("#weight").val();
			$.ajax({
				type : 'post',
				url : '/user/addWeight/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					date : "<%=request.getParameter("date")%>
	",
					weight : weight,
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
					}
				}
			});

		});

	}); //document.ready
</script>
<%@ include file="../include/footer.jsp"%>