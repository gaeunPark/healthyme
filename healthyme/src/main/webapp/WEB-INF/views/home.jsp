<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/dist/css/main.css">

<style>
body {
	width: 100%;
	padding-top: 140px;
}

html, body {
	height: 100%;
}

</style>

</head>


<body>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid p-3 mb-2 bg-success text-white">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> <img alt="Brand" src="..."></a>
				<a class="navbar-brand" href="#">헬미!</a>
				<p class="navbar-text">Healthy me</p>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">


				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a data-toggle="modal" href="#loginModal">로그인</a></li>
					<li><a data-toggle="modal" href="#joinModal">회원가입</a></li>
					<li><a href="join">즐겨찾기</a></li>
				</ul>
			</div>




			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1 ">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">음식정보 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">트레이닝</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="true">커뮤니티</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
						</ul></li>
					<li><a href="#">SHOP</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>




	<!-- 로그인Modal -->
	<center>
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<!--  모달 크기 조절 -->
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">로그인</h4>
					</div>
					<div class="modal-body">


						<%-- <form role="form" method="post" id="loginForm">
						<div class="form-group has-feedback">
							<input type="email" class="form-control form-text-height"
								id="loginId" placeholder="이메일 주소"> <span
								class="glyphicon glyphicon-envelope form-control-feedback"></span>
							<div></div>
						</div>
						<div class="form-group has-feedback">
							<input type="password" class="form-control form-text-height"
								id="loginPw" placeholder="비밀번호(8자리 이상)"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
							<div></div>
						</div>
						<button type="submit" class="btn btn-catchjob btn-block">
							로그인</button>
					</form>

					<div class="form-group">
						<br>
						<center>
							<p>- 또는 -</p>
						</center>
						<br>
						<button class="btn facebookBtn">
							<img
								src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg"
								alt="facebookLogo"> 페이스북으로 로그인
						</button>
						<button class="btn googleBtn">
							<img
								src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg"
								alt="googleLogo"> 구글로 로그인 &nbsp;&nbsp;
						</button> --%>


						<form role="form" method="post" onsubmit="return confirm('로그인 하시겠습니까?')">
							<div class="form-group">
								<label for="username-email">이메일 or 아이디</label> <input
									name="userid" id="loginId"
									placeholder="E-mail or Username" type="text"
									class="form-control" onkeyup="" />
							</div>
							<div class="form-group">
								<label for="userpw">비밀번호</label> <input name="userpw"
									id="loginPw" value='' placeholder="Password" type="password"
									class="form-control" />
							</div>
							<div class="form-group">
								<button type="submit"
									class="btn btn-default btn-login-submit btn-block m-t-md"
									value="Login">로그인</button>
							</div>
							<span class='text-center'><a
								href="/bbs/index.php?mid=index&act=dispMemberFindAccount"
								class="text-sm">비밀번호 찾기</a></span>
							<hr />
							<div class="form-group">
								<br>
								<center>
									<p>- 또는 -</p>
								</center>
								<br>
								<button class="btn facebookBtn">
									<img src="/resources/img/flogo-HexRBG-Wht-58.svg"
										alt="facebookLogo"> 페이스북으로 로그인
								</button>
								<button class="btn googleBtn">
									<img src="/resources/img/google-logo-01.svg" alt="googleLogo">
									구글로 로그인 &nbsp;&nbsp;
								</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">로그인</button>
				</div>
			</div>
		</div>
		</div>


		<!-- 회원가입Modal -->
		<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<!--  모달 크기 조절 -->
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">회원가입</h4>
					</div>
					<div class="modal-body">

						<form role="form" method="post" id="joinForm"
							onsubmit="return false;">
							<p>ID :</p>
							<p>
								<input type="text" name="userid" id="userid">
							</p>
							<p>비밀번호 :</p>
							<p>
								<input type="password" name="userpw" id="userpw">
							</p>
							<p>이름 :</p>
							<p>
								<input type="text" name="username" id="username">
							</p>
							<p>이메일 :</p>
							<p>
								<input type="text" name="email" id="email">
							</p>
							<p>전화번호 :</p>
							<p>
								<input type="text" name="phone" id="phone">
							</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="submit" id="joinBtn"
							class="btn btn-primary">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>


<script>
$(document).ready(function(){
	function checkValid(message) {
		var userid = $('#userid').val();
		var userpw = $('#userpw').val();
		var email = $('#email').val();
		var username = $('#username').val();
		var phone = $('#phone').val();

		if (userid.length < 5) {
			alert("아이디가 5자 이하입니다.");
		} else if (userpw.length < 5) {
			alert("비밀번호가 5자 이하입니다.");
		} else if (email.length < 5) {
			alert("이메일이 5자 이하입니다.");
		} else if (phone.length < 5) {
			alert("전화번호가 5자 이하입니다.");
		} else {
			return true;
		}
		return false;
	}
	
	$("#joinBtn").on("click", function() {
		if(checkValid()){
			var userid = $("#userid").val();
			var userpw = $("#userpw").val();
			var username =$("#username").val();
			var email = $("#email").val();
			var phone = $("#phone").val();

			$.ajax({
				type : 'post',
				url : '/user/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					userid : userid,
					userpw : userpw,
					username : username,
					email : email,
					phone : phone
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						location.href="/";
					}
				}
			});
		}
	});
});


</script>





		<div style="border: solid 1px black; width: 80%; height: 600px;">

		</div>
</body>
</html>
