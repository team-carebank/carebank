<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/info.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hoslist.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/hospital.js"></script>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="main-content">
		<div class="body-content">
			<div class="content-top">
				<p class="content-desc"><b>병원 정보</b>를 찾으시나요?</p>
				<div class="category-area">
					<ul class="category-list">
					</ul>
					<ul class="sub-category-list">
					</ul>
				</div>
			</div>
			<div class="content-main">
				<p class="content-desc" style="width: 100%;">
					<b class="sub-category-name"></b>의 병원 정보를 안내할게요.
				</p>
				<div class="info-list"></div>
				<div class="content-bottom">
					<ul class="pagination">
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>