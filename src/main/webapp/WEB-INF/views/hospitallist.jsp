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
<style>
.body-content {
	padding: 100px;
}

.body-content a {
	text-decoration: none;
	color: black;
}

.body-content * {
	display: block;
	margin: 0;
	margin-block: 20px;
	margin-block-start: 0;
	padding: 0;
}

.content-side a:hover {
	color: yellowgreen;
}

.content-desc {
	font-size: x-large;
	width: 400px;
}

.content-desc * {
	display: inline-block;
}

.category-list, .sub-category-list {
	margin-block: 0;
}

.category-list li, .sub-category-list li {
	display: inline-block;
	margin-block: 5px;
	margin-inline: 10px;
	margin-inline-start: 0;
}

.category-list li a:hover, .sub-category-list li a:hover, .clinic-info a:hover
	{
	color: yellowgreen;
}

.category-list-item {
	margin-inline-start: 0;
	font-size: larger;
}

.category-list, .sub-category-list, .content-main {
	display: none;
}

.info-list * {
	margin-block: 20px;
}

.clinic-info {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
}

.clinic-info *:first-child {
	grid-column: 1/span 2;
}

.clinic-info * {
	margin-block: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/hospital.js"></script>
</head>

<body>
	<div class="body-content">
		<div class="content-top">
			<h1>이용하기</h1>
			<p class="content-desc">병원 정보를 찾으시나요?</p>
			<ul class="category-list">
			</ul>
			<ul class="sub-category-list">
			</ul>
		</div>
		<div class="content-main">
			<p class="content-desc" style="width: 100%;">
				<b class="sub-category-name">강남구</b>의 병원정보를 안내할게요.
			</p>
			<div class="info-list"></div>
		</div>
	</div>
</body>

</html>