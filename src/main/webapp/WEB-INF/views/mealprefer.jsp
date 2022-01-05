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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/infodetail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/info.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/prefer.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).on("click", "figure", function(e) {
		var id = e.currentTarget.id;
		var link = "${pageContext.request.contextPath}/mealinfo.do?id=" + id;
		window.location.href = link;
	});
	$(function() {
		$(".content-gallery__img").css("height",
				$(".content-gallery__img").css("width"));
	});
</script>
<style>
.content-gallery figure {
	margin-block: 0;
	margin-inline: 0 !important;
}
</style>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="container">
		<div class="prefer-contents">
			<div class="prefer-content-title">
				<h1>___님의 관심사에 따라 식단을 추천드려요!</h1>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">오늘은 이 음식 어때요?</span> <span
						class="content-item-desc">관심사로 선택한 주제에 따라 식단을 추천해드려요!</span>
				</div>
				<div class="content-gallery">
					<c:forEach var="item" items="${random }">
						<figure id="${item.meal_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.meal_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.meal_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.meal_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">현재 HOT한 식단들!</span> <span
						class="content-item-desc">현재 날짜를 기준으로 일주일간 댓글이 많이 달린 상위 5가지
						식단을 모아봤어요.</span>
				</div>
				<div class="content-gallery">
					<c:forEach var="item" items="${comment }">
						<figure id="${item.meal_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.meal_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.meal_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.meal_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">#주제별_모아보기</span> <span
						class="content-item-desc">관심사로 선택한 주제별로 식단 정보를 확인하세요.</span>
				</div>
				<div class="category-list">
					<span class="category-list-item" id="1">#소화 불량</span><span
						class="category-list-item" id="1">#면역력 강화</span><span
						class="category-list-item" id="1">#남성 건강</span><span
						class="category-list-item" id="1">#불면증</span><span
						class="category-list-item" id="1">#체중 감량</span>
				</div>
				<div class="content-gallery">
					<c:forEach var="item" items="${meal }">
						<figure id="${item.meal_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.meal_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.meal_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.meal_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
</body>
</html>