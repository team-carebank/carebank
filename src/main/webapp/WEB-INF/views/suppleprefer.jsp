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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/supple.js"></script>
<script type="text/javascript">
	$(function() {
		setImgHeight();
		$(".category-list-item").eq(0).css("font-weight", "bold");
	})
	$(document).on(
			"click",
			".category-list-item",
			function(e) {
				var id = e.currentTarget.id;
				$(".content-gallery#default").empty();
				$(".content-gallery#default").hide();

				$.ajax({
					type : "post",
					url : "supplereq.do",
					data : JSON.stringify(id),
					contentType : "application/json",
					success : function(res) {
						var supple = res.supple;

						for (var i = 0; i < supple.length; i++) {
							createGallery(supple[i]);
						}
						setImgHeight();
					},
					error : function() {
						alert("통신 실패");
					}
				}).done(
						function() {
							$(".content-gallery#default").slideDown("slow");
							$(".category-list-item").not(
									".category-list-item[id='" + id + "']")
									.css("font-weight", "normal");
							$(".category-list-item[id='" + id + "']").css(
									"font-weight", "bold");
						});
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
				<h1>___님의 관심사에 따라 영양제를 추천드려요!</h1>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">이 영양제로 하루를 시작해보세요!</span> <span
						class="content-item-desc">관심사로 선택한 주제에 따라 랜덤으로 영양제를 추천해드려요!</span>
				</div>
				<div class="content-gallery">
					<c:forEach var="item" items="${random }">
						<figure id="${item.supple_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.supple_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.supple_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.supple_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">현재 HOT한 영양제들!</span> <span
						class="content-item-desc">현재 날짜를 기준으로 일주일간 댓글이 많이 달린 영양제를
						모아봤어요.</span>
				</div>
				<div class="content-gallery">
					<c:forEach var="item" items="${comment }">
						<figure id="${item.supple_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.supple_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.supple_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.supple_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">#주제별_모아보기</span> <span
						class="content-item-desc">관심사로 선택한 주제별로 영양제 정보를 확인하세요.</span>
				</div>
				<div class="category-list">
					<c:forEach var="cat" items="${prefer }">
						<c:choose>
							<c:when test="${cat eq 1 }">
								<span class="category-list-item" id=${cat }>#편두통</span>
							</c:when>
							<c:when test="${cat eq 2 }">
								<span class="category-list-item" id=${cat }>#변비</span>
							</c:when>
							<c:when test="${cat eq 3 }">
								<span class="category-list-item" id=${cat }>#여드름 #두피염
									#아토피</span>
							</c:when>
							<c:when test="${cat eq 4 }">
								<span class="category-list-item" id=${cat }>#빈혈 #어지럼증
									#저혈압</span>
							</c:when>
							<c:when test="${cat eq 5 }">
								<span class="category-list-item" id=${cat }>#비염</span>
							</c:when>
							<c:when test="${cat eq 6 }">
								<span class="category-list-item" id=${cat }>#소화불량</span>
							</c:when>
							<c:when test="${cat eq 7 }">
								<span class="category-list-item" id=${cat }>#심장_뻐근함 #혈액순환</span>
							</c:when>
							<c:when test="${cat eq 8 }">
								<span class="category-list-item" id=${cat }>#디스크 #허리통증
									#관절</span>
							</c:when>
							<c:when test="${cat eq 9 }">
								<span class="category-list-item" id=${cat }>#고지혈증 #고혈압</span>
							</c:when>
							<c:when test="${cat eq 10 }">
								<span class="category-list-item" id=${cat }>#노화예방</span>
							</c:when>
							<c:when test="${cat eq 11 }">
								<span class="category-list-item" id=${cat }>#면역력_강화</span>
							</c:when>
							<c:when test="${cat eq 12 }">
								<span class="category-list-item" id=${cat }>#여성건강</span>
							</c:when>
							<c:when test="${cat eq 13 }">
								<span class="category-list-item" id=${cat }>#남성건강</span>
							</c:when>
							<c:when test="${cat eq 14 }">
								<span class="category-list-item" id=${cat }>#눈_건강</span>
							</c:when>
							<c:when test="${cat eq 15 }">
								<span class="category-list-item" id=${cat }>#흡연</span>
							</c:when>
							<c:when test="${cat eq 16 }">
								<span class="category-list-item" id=${cat }>#스트레스_완화</span>
							</c:when>
							<c:when test="${cat eq 17 }">
								<span class="category-list-item" id=${cat }>#세로토닌_증진</span>
							</c:when>
							<c:when test="${cat eq 18 }">
								<span class="category-list-item" id=${cat }>#불면증</span>
							</c:when>
							<c:when test="${cat eq 20 }">
								<span class="category-list-item" id=${cat }>#균형잡힌_식단</span>
							</c:when>
							<c:when test="${cat eq 21 }">
								<span class="category-list-item" id=${cat }>#체중감량</span>
							</c:when>
							<c:when test="${cat eq 22 }">
								<span class="category-list-item" id=${cat }>#체중증량</span>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				<div class="content-gallery" id="default">
					<c:forEach var="item" items="${supple }">
						<figure id="${item.supple_id }">
							<c:choose>
								<c:when test="${item.src ne null }">
									<img src="${item.src }" alt="${item.supple_name }"
										class="content-gallery__img">
								</c:when>
								<c:otherwise>
									<img alt="${item.supple_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="content-gallery__img">
								</c:otherwise>
							</c:choose>
							<span class="content-gallery__caption">${item.supple_name }</span>
						</figure>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
</body>
</html>