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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/infodetail.css" />
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
	<div class="container">
		<div class="body-content">
			<div class="content-left">
				<h1>${meal.meal_name }</h1>
				<hr>
				<div class="content-item">
					<p>
						<b>레시피</b>
					</p>
					<p class="content-item-description">${meal.recipe }</p>
				</div>
				<hr>
				<div class="content-item">
					<p>
						<b>메인 푸드</b>
					</p>
					<c:forEach var="food" items="${ingredient }">
						<div class="content-food-list">
							<span><b>${food.food }</b></span>
							<p class="content-item-description">${fn:trim(food.description)}</p>
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
		<hr>
		<div class="comment-area">
			<h2 class="content-desc">댓글</h2>
			<div class="comment-write">
				<form action="" method="post" onsubmit="return whenSubmit();">
					<input type="hidden" name="info_id" value="${meal.meal_id }">
					<textarea name="" id="comment_content" placeholder="내용을 입력하세요."></textarea>
					<input type="submit" value="작성">
				</form>
			</div>
			<div class="comment-list">
				<div class="comment-item"></div>
			</div>
		</div>
	</div>
</body>
</html>