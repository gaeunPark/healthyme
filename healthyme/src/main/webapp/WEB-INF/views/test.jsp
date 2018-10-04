<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="resources/dist/css/main.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>


<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>

	
	
	


<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>/.modal-content
  </div>/.modal-dialog
</div>/.modal


Buttons
<button type="button" data-toggle="modal" data-target="#myModal">Open Modal</button>
 
Links
<a data-toggle="modal" href="#myModal">Open Modal</a>








<!-- 로그인 모달 -->
  <div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialogs ">

      <!-- Modal content-->
      <div class="modal-contents">
        <div class="modal-headers" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
        </div>
        <div class="modal-body" >

          <form role="form" method="post" id="loginForm">
            <div class="form-group has-feedback">
               <input type="email" class="form-control form-text-height" id="loginId" placeholder="이메일 주소">
               <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							 <div></div>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control form-text-height" id="loginPw" placeholder="비밀번호(8자리 이상)">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
								<div></div>
            </div>
              <button type="submit" class="btn btn-catchjob btn-block"> 로그인</button>
          </form>

					<div class="form-group">
						<br><center><p>- 또는 -</p></center><br>
						<button class="btn facebookBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> 페이스북으로  로그인
						</button>
						<button class="btn googleBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> 구글로 로그인 &nbsp;&nbsp;
						</button>
					</div>

        </div>
        <div class="modal-footer">
          <p>아직 회원이 아니세요? <a href="#myModalSignUp" class="blue-font" data-toggle="modal" id="loginHide">회원가입</a></p>
<!--           <p>Forgot  -->
          <p><span class="blue-font" onclick="passwordModifyForm()">비밀번호 찾기</span></p>
<!--           </p> -->

        </div>
      </div>
    </div>
  </div>

      <!-- 회원가입 모달 -->
      <div class="modal fade" id="myModalSignUp" role="dialog">
         <div class="modal-dialogs">

            <!-- Modal content-->
            <div class="modal-contents">
               <div class="modal-headers">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4>
                     <span class="glyphicon glyphicon-lock"></span> 회원가입
                  </h4>
               </div>

					<div class="modal-body" >
						<form role="form" method="post" id="signUpForm">
							<div class="form-group has-feedback">
								<input	type="email" class="form-control form-text-height" id="signUpId"	placeholder="이메일 주소">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
								<div class="check-mail"></div>
							</div>
							<div class="form-group has-feedback">
								<!-- 비밀번호 -->
								<input type="password" class="form-control form-text-height" name="password" id="signUpPw" placeholder="비밀번호(8자리 이상)" >
								 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
					        <div class="form-group has-feedback">
								<!-- 비밀번호 확인  -->
								<input type="password" class="form-control form-text-height" name="passwordCheck" id="signUpPwCheck"	placeholder="비밀번호 확인">
								 <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
								 <div class="checkMsg"></div>
							</div>
							<button type="submit" class="btn btn-catchjob btn-block">
								 <div>이메일로 가입</div><img src="/resources/img/loading.gif" alt="progress" height="100%" class="loding">
							</button>
							<!-- 회원가입 실패 시 보이는 창 -->
<!-- 							<div class="form-group has-error has-feedback hidden" -->
<!-- 								id="signUpFail"> -->
<!-- 								<div class="input-group"> -->
<!-- 									<span class="input-group-addon"> -->
<!-- 										<span class="glyphicon glyphicon-exclamation-sign"	aria-hidden="true"></span> -->
<!-- 									</span> -->
<!-- 									<input type="text" class="form-control" id="inputError" -->
<!-- 									aria-describedby="inputGroupSuccess1Status"	value="이메일 혹은 비밀번호가 유효하지 않습니다. 다시 시도하세요"> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</form>

                  <div class="form-group row">
                     <br><center><p>- 또는 -</p></center><br>

                     <button class="btn col-xs-12 facebookBtn" >
                           <img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> 페이스북으로 가입
                     </button>
                     <button class="btn col-xs-12 googleBtn" >
                           <img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> 구글로 가입 &nbsp;&nbsp;
                     </button>
                  </div>

               </div>

               <div class="modal-footer">
                   <p>이미 회원이세요? <a  href="#loginModal" data-toggle="modal" id="signUpHide">로그인</a></p>
               </div>
            </div>

         </div>
      </div>





	Button trigger modal
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  Launch demo modal
	</button>
 







</body>
</html>
