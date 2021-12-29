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
	href="${pageContext.request.contextPath }/resources/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/info.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/info.js"></script>
</head>
<%@ include file="../../header.jsp"%>
<body>

	<div class="body-content">
		<div class="content-top">
			<div class="content-desc">
				<span>주제별로 <b>식단 정보</b>를 이용하세요!
				</span>
			</div>
			<ul class="category-list">
				<li><a href="#" class="category-list-item">만성질환</a>
					<ul class="sub-category-list">
						<li><a href="javascript: clickMenu(1,1);">#편두통</a></li>
						<li><a href="javascript: clickMenu(2,1);">#변비</a></li>
						<li><a href="javascript: clickMenu(3,1);">#여드름 #두피염 #아토피</a></li>
						<li><a href="javascript: clickMenu(4,1);">#빈혈 #어지럼증 #저혈압</a></li>
						<li><a href="javascript: clickMenu(5,1);">#비염</a></li>
						<li><a href="javascript: clickMenu(6,1);">#소화불량</a></li>
						<li><a href="javascript: clickMenu(7,1);">#심장_뻐근함 #혈액순환</a></li>
						<li><a href="javascript: clickMenu(8,1);">#디스크 #허리통증 #관절</a></li>
						<li><a href="javascript: clickMenu(9,1);">#고지혈증 #고혈압</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">건강증진</a>
					<ul class="sub-category-list">
						<li><a href="javascript: clickMenu(10,1);">#노화예방</a></li>
						<li><a href="javascript: clickMenu(11,1);">#면역력_강화</a></li>
						<li><a href="javascript: clickMenu(12,1);">#여성건강</a></li>
						<li><a href="javascript: clickMenu(13,1);">#남성건강</a></li>
						<li><a href="javascript: clickMenu(14,1);">#눈_건강</a></li>
						<li><a href="javascript: clickMenu(15,1);">#흡연</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">멘탈케어</a>
					<ul class="sub-category-list">
						<li><a href="javascript: clickMenu(16,1);">#스트레스_완화</a></li>
						<li><a href="javascript: clickMenu(17,1);">#세로토닌_증진</a></li>
						<li><a href="javascript: clickMenu(18,1);">#불면증</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">다이어트</a>
					<ul class="sub-category-list">
						<li><a href="javascript: clickMenu(20,1);">#균형잡힌_식단</a></li>
						<li><a href="javascript: clickMenu(21,1);">#체중감량</a></li>
						<li><a href="javascript: clickMenu(22,1);">#체중증량</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="content-main">
			<div class="content-desc">
				<div>
					<span><b class="sub-category-name"></b>에는 이 음식이 딱!</span>
				</div>
				<br>
				<div>
					<b style="font-size: large;">추천 푸드</b><br> <span
						class="sub-category-desc"></span>
				</div>
			</div>
			<div class="content-default">
				<div class="content-gallery" id="default"></div>
			</div>
		</div>
	</div>
</body>
</html>