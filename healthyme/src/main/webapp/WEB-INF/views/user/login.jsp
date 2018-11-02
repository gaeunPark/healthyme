<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../include/nav.jsp"%>


<section class="content">
	<div class="container">
		<div class="contents">
		
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/user/loginPOST"
					method="post" onsubmit="return confirm('로그인 하시겠습니까?')">
					
					<div class="form-group">
						<label for="username-email">이메일 or 아이디</label> <input
							name="userid" placeholder="E-mail or Username"
							type="text" class="form-control" onkeyup="" />
					</div>
					<div class="form-group">
						<label for="userpw">비밀번호</label> <input name="userpw"
							placeholder="Password" type="password" class="form-control" />
					</div>
					<div class="form-group">
						<button type="submit"
							class="btn btn-default btn-login-submit btn-block m-t-md"
							value="Login">로그인</button>
					</div>
					<span class='text-center'><a
						href="/bbs/index.php?mid=index&act=dispMemberFindAccount"
						class="text-sm">비밀번호 찾기</a></span>
						  <input type="checkbox" name="useCookie"> Remember Me
					<hr />
				</form>
			</div>
			
			


		</div>
		<!--  class="contents" -->

		<div class="side"></div>
	</div>
	<!--  class="container" -->
</section>

<%@include file="../include/footer.jsp"%>