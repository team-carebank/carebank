<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css" />
<style>
.body-content, .comment-area {
	width: 100%;
}

.body-content a, .comment-area a, .menu-area a {
	text-decoration: none;
	color: black;
}

.body-content * {
	display: block;
	margin: 0;
	margin-block: 20px;
	margin-block-start: 0;
}

.body-content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 20px;
	padding: 100px;
	padding-bottom: 0;
}

.comment-area {
	padding: 100px;
	padding-top: 0;
}

.menu-area a {
	font-size: large;
	font-weight: bold;
}

.menu-area a:hover {
	color: yellowgreen;
}

.comment-area * {
	margin-block: 10px;
	display: inline-block;
	width: 100%;
}

.comment-write * {
	margin-inline: 5px;
	margin-inline-start: 0;
	vertical-align: middle;
}

.comment-write textarea {
	width: 70%;
	height: 50px;
	border: none;
	resize: none;
}

.comment-write input[type="submit"] {
	width: 100px;
	height: 50px;
	border: 0;
	border-radius: 1mm;
	transition: 0.5s;
}

.comment-write input[type="submit"]:hover {
	cursor: pointer;
	background-color: yellowgreen;
	color: white;
}

.comment-list {
	display: block;
	width: 80%;
}

.comment-list * {
	margin-block: 5px;
}

.comment-list ul, li {
	padding: 0;
}

.comment-item {
	display: grid;
	grid-template-columns: repeat(8, 1fr);
	grid-gap: 10px;
}

.comment-item li:first-child {
	grid-column: 1/span 2;
	font-weight: bold;
}

.comment-item li:nth-child(2) {
	grid-column: 3/span 3;
}

.content-left {
	grid-column: 1/3;
}

.content-right {
	grid-column: 3/4;
	padding: 50px;
}

.content-left p {
	font-size: large;
}

.content-desc {
	font-size: x-large !important;
}

.content-item-desc {
	font-size: small !important;
	color: darkgray;
}

.content-image img {
	max-width: 800px;
}

.food {
	margin-block: 0;
}

.food * {
	display: inline-flex;
	margin-block: 5px;
}

.food p {
	font-size: medium !important;
}

.food b {
	font-size: large;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
	function whenSubmit() {
		var comment = document.getElementById("comment_content").value.trim();

		if (comment == "" || comment == null) {
			alert("댓글 내용을 입력하세요.");
			return false;
		}

		return true;
	}
</script>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="body-content">
		<div class="content-left">
			<h1>${meal.meal_name }</h1>
			<hr>
			<div class="content-item">
				<p>
					<b>레시피</b>
				</p>
				<span>${meal.recipe }</span>
			</div>
			<hr>
			<div class="content-item">
				<p>
					<b>메인 푸드</b>
				</p>
				<c:forEach var="food" items="${ingredient }">
					<div class="food">
						<span><b>${food.food }</b></span>
						<p>${fn:trim(food.description)}</p>
						<span>탄수화물 ${food.carbo}g 단백질 ${food.protein } 지방
							${food.fat }g</span> <span>칼로리 ${food.calories }kcal</span>
					</div>
				</c:forEach>
				<p class="content-item-desc">* 영양소 정보는 100g을 기준으로 합니다.</p>
			</div>
			<hr>
			<div class="menu-area">
				<a href="javascript: history.back();">목록으로 돌아가기</a>
			</div>
		</div>
		<div class="content-right">
			<div class="content-image">
				<c:choose>
					<c:when test="${meal.src ne null }">
						<img src="${meal.src }" alt="${meal.meal_name }">
					</c:when>
					<c:otherwise>
						<img alt="${meal.meal_name }"
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="comment-area">
		<p class="content-desc">
			<b>댓글</b>
		</p>
		<div class="comment-write">
			<form action="" method="post" onsubmit="return whenSubmit();">
				<textarea name="" id="comment_content" cols="30" rows="10"
					placeholder="내용을 입력하세요."></textarea>
				<input type="submit" value="작성">
			</form>
		</div>
		<div class="comment-list">
			<ul>
				<li>
					<ul class="comment-item">
						<li>닉네임</li>
						<li>댓글 내용...댓글 내용...댓글 내용...댓글 내용...</li>
						<li>2021-12-10</li>
						<li><a href="#">수정</a></li>
						<li><a href="#">삭제</a></li>
					</ul>
				</li>
				<li>
					<ul class="comment-item">
						<li>닉네임</li>
						<li>댓글 내용...댓글 내용...댓글 내용...댓글 내용...</li>
						<li>2021-12-10</li>
						<li><a href="#">수정</a></li>
						<li><a href="#">삭제</a></li>
					</ul>
				</li>
				<li>
					<ul class="comment-item">
						<li>닉네임</li>
						<li>댓글 내용...댓글 내용...댓글 내용...댓글 내용...</li>
						<li>2021-12-10</li>
						<li><a href="#">수정</a></li>
						<li><a href="#">삭제</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>