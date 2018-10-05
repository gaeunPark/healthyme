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

.checkbox label::before {
	content: "";
	display: inline-block;
	position: absolute;
	width: 17px;
	height: 17px;
	left: 0;
	margin-left: -20px;
	border: 1px solid #cccccc;
	border-radius: 3px;
	background-color: #fff;
	-webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
	-o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
	transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
}

.checkbox label::after {
	display: inline-block;
	position: absolute;
	width: 16px;
	height: 16px;
	left: 0;
	top: 0;
	margin-left: -20px;
	padding-left: 3px;
	padding-top: 1px;
	font-size: 11px;
	color: #555555;
}

.checkbox input[type="checkbox"] {
	opacity: 0;
}

.checkbox input[type="checkbox"]:focus+label::before {
	/*outline: thin dotted;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px; */
	
}

.checkbox input[type="checkbox"]:checked+label::after {
	font-family: 'FontAwesome';
	content: "\f00c";
}

.checkbox input[type="checkbox"]:disabled+label {
	opacity: 0.65;
}

.checkbox input[type="checkbox"]:disabled+label::before {
	background-color: #eeeeee;
	cursor: not-allowed;
}

.checkbox.checkbox-circle label::before {
	border-radius: 50%;
}

.checkbox.checkbox-inline {
	margin-top: 0;
}

.checkbox-primary input[type="checkbox"]:checked+label::before {
	background-color: #428bca;
	border-color: #428bca;
}

.checkbox-primary input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-danger input[type="checkbox"]:checked+label::before {
	background-color: #d9534f;
	border-color: #d9534f;
}

.checkbox-danger input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-info input[type="checkbox"]:checked+label::before {
	background-color: #428BCA;
	border-color: #428BCA;
}

.checkbox-info input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-warning input[type="checkbox"]:checked+label::before {
	background-color: #f0ad4e;
	border-color: #f0ad4e;
}

.checkbox-warning input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-success input[type="checkbox"]:checked+label::before {
	background-color: #5cb85c;
	border-color: #5cb85c;
}

.checkbox-success input[type="checkbox"]:checked+label::after {
	color: #fff;
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


						<div class="card-body">
						<div class="alert alert-danger" role="alert">ID나 비밀번호를 잘못 입력하셨습니다.</div>
						
						<form data-toggle="validator" role="form" method="post" action="#">
							<input type="hidden" class="hide" id="csrf_token"
								name="csrf_token" value="C8nPqbqTxzcML7Hw0jLRu41ry5b9a10a0e2bc2">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Email / ID</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="fa fa-envelope-open-o" aria-hidden="true"></i></span>
											</div>
											<input type="text" class="form-control" name="login_email"
											 pattern=".{4,}"
												title="Cuatro(4) o mas caracteres" required="">
										</div>
										<div class="help-block with-errors text-danger"></div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Password</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="fa fa-unlock" aria-hidden="true"></i></span>
											</div>
											<input type="password" name="login_password"
												class="form-control" pattern=".{4,}"
												title="Cuatro(4) o mas caracteres" required="">
										</div>
										<div class="help-block with-errors text-danger"></div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="checkbox checkbox-primary">
									<input id="checkbox_remember" type="checkbox" name="remember">
									<label for="checkbox_remember"> 자동저장</label>
									
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="hidden" name="redirect" value=""> <input
										type="submit" class="btn btn-primary btn-lg btn-block"
										value="Login" name="submit">
								</div>
							</div>
						</form>
						<div class="clear"></div>
						<i class="fa fa-user fa-fw"></i> 회원가입을 하지 않으셨나요? <a
							href="#">Regístrate</a><br> <i class="fa fa-undo fa-fw"></i>
						비밀번호를 잊어버리셨나요? <a href="#">Recupérala</a>
					
						
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

		<div style="border: solid 1px black; width: 80%; height: 600px;">

		</div>
</body>
</html>
