<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<title>nav</title>

<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/dist/css/main.css?after" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>


<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid p-3 mb-2 text-white">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<img alt="Brand" src="http://placehold.it/70x30">
			</a> <a class="navbar-brand" href="${pageContext.request.contextPath}/">헬미!</a>
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
				<c:if test="${empty login.username}">
					<li><a data-toggle="modal" href="#loginModal">로그인</a></li>
					<li><a data-toggle="modal" href="#joinModal">회원가입</a></li>
				</c:if>
				<c:if test="${!empty login.username}">
					<li><a data-toggle="modal" href="#">${login.username}님</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">마이페이지
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="${pageContext.request.contextPath}/user/myInfo">내 정보</a></li>
							<li><a data-toggle="modal"
								href="${pageContext.request.contextPath}/user/calender">마이페이지</a></li>
							<li class="divider"></li>
							<li><a data-toggle="modal" href="/user/logout">로그아웃</a></li>
						</ul></li>
				</c:if>
				<li><a href="#"> <span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/nutrition/readNutri">음식정보
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="#">트레이닝</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="true">커뮤니티</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${pageContext.request.contextPath}/community/community?categoryIdx=1">커뮤니티</a></li>
						<li><a href="${pageContext.request.contextPath}/community/community?categoryIdx=2">커뮤니티</a></li>
					</ul></li>
				<li><a href="#">SHOP</a></li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


<!-- 로그인Modal -->
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
				<form action="${pageContext.request.contextPath}/user/loginPOST"
					method="post" id="loginForm"
					onsubmit="return confirm('로그인 하시겠습니까?')">
					<div class="form-group">
						<label for="username-email">이메일 or 아이디</label> <input
							name="userid" id="loginId" placeholder="E-mail or Username"
							type="text" class="form-control" onkeyup="" />
					</div>
					<div class="form-group">
						<label for="userpw">비밀번호</label> <input name="userpw" id="loginPw"
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
					<p>성별 :</p>
					<p>
						<select name="gender" id="gender">
							<option value='selected'>--선택--</option>
							<option value='man'>남</option>
							<option value='wamen'>여</option>
						</select>
					</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="submit" id="joinBtn" class="btn btn-primary">가입하기</button>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
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
			} else {
				return true;
			}
			return false;
		}

		$("#joinBtn").on("click", function() {
			if (checkValid()) {
				var userid = $("#userid").val();
				var userpw = $("#userpw").val();
				var username = $("#username").val();
				var email = $("#email").val();
				var gender = $("#gender").val();
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
						gender : gender
					}),
					success : function(result) {
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							location.href = "/";
						}
					}
				});
			}
		});
	});
</script>