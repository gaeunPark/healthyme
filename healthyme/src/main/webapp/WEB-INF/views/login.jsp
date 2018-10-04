<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div>
		<section>
		<h4>로그인</h4>
		
		<form role="form" method="post"
			onsubmit="return confirm('로그인 하시겠습니까?')">
			<p>유저ID :</p>
			<p>
				<input type="text" name="username" autofocus>
			</p>
			<p>비밀번호 :</p>
			<p>
				<input type="password" name="password">
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</form>
		</section>
	</div>




</body>
</html>