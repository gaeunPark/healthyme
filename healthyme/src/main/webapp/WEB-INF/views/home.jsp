<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>

<section>

	<div class="container">
		<c:if test="${empty login.username}">
		<div class="alert alert-danger alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<h4 id="oh-snap!-you-got-an-error!">
				아직 가입을 하지 않으셨나요!
				<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!"><span class="anchorjs-icon"></span></a>
			</h4>
			<p>Change this and that and try again. Duis mollis, est non
				commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem
				nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
			<p>
				<button type="button" class="btn btn-danger">가입하기</button>
				<button type="button" class="btn btn-default">로그인</button>
			</p>
		</div>
		</c:if>
		<div class="contents">${login.username}반갑습니다.</div>
		<div class="side"></div>

	</div>
</section>

<%@ include file="include/footer.jsp"%>