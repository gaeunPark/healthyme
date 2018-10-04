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


					<form role="form" method="post" id="loginForm">
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
						</button>
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

					<form role="form" method="post">
						<p>ID :</p>
						<p>
							<input type="text" name="userid" id="userid" onkeyup="">
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
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">가입하기</button>
				</div>
			</div>
		</div>
	</div>

	<div
		style="border: solid 1px black; width: 80%; height: 600px;">

	</div>

</body>
</html>
