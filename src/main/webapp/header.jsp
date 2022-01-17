<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$(".nav-component").mouseenter(function() {
			$(".nav-sub li").slideDown();
		});

		$(".header").mouseleave(function() {
			$(".nav-sub li").slideUp();
		});
	});
</script>
</head>

<body>
	<div class="header">
		<div class="header-logo">
			<h1>
				<a href="${pageContext.request.contextPath }/main.do">CareBank</a>
			</h1>
		</div>
		<div class="header-nav">
			<ul class="nav-list">
				<li class="nav-component"><a>이용하기</a>
					<ul class="nav-sub">
						<li><a href="${pageContext.request.contextPath}/mealmain.do">식단</a></li>
						<li><a
							href="${pageContext.request.contextPath}/supplemain.do">영양제</a></li>
						<li><a
							href="${pageContext.request.contextPath}/hospitalmain.do">병원</a></li>
						<li><a
							href="${pageContext.request.contextPath}/pharmacymain.do">약국</a></li>
					</ul></li>
				<li class="nav-component"><a>추천받기</a>
					<ul class="nav-sub">
						<li><a
							href="${pageContext.request.contextPath}/prefer/meallist.do">식단</a></li>
						<li><a
							href="${pageContext.request.contextPath}/exerciselist.do"
							target="_blank">운동</a></li>
						<li><a
							href="${pageContext.request.contextPath}/prefer/supplelist.do">영양제</a></li>
						<li><a
							href="${pageContext.request.contextPath}/newmeditation.do"
							target="_blank">명상</a></li>
					</ul></li>
				
				<li class="nav-component"><a>고객센터</a>
					<ul class="nav-sub">
					<c:if test="${not empty login_info }">
					<c:choose>
						<c:when test="${login_info.user_type ne 'ADMIN' }">
						<li><a href="${pageContext.request.contextPath}/faqlist.do">자주묻는 질문</a></li>
						<li><a href="${pageContext.request.contextPath}/qna.do">문의하기</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="">자주묻는 질문</a></li>
							<li><a href="${pageContext.request.contextPath}/adminqna.do">문의하기</a></li>
						</c:otherwise>
					</c:choose>
					</c:if>
					</ul>
				</li>
			</ul>
		</div>
		<div class="header-user">
			<ul class="user-login">
				<c:if test="${not empty login_info }">
					<c:choose>
						<c:when test="${login_info.user_type ne 'ADMIN' }">
							<li class="nav-component"><a href="#">마이페이지</a>
								<ul class="nav-sub">
									<li><a href="${pageContext.request.contextPath}/diary.do">다이어리</a></li>
									<li><a href="${pageContext.request.contextPath}/myinfo.do">내정보</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-component"><a
								href="${pageContext.request.contextPath }/admin/main.do">관리자페이지</a>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:choose>
					<c:when test="${empty login_info}">
						<li class="nav-component"><a
							href="${pageContext.request.contextPath}/loginform.do">로그인</a></li>
					</c:when>
					<c:when test="${not empty login_info}">
						<li class="nav-component"><a
							href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</body>


</html>