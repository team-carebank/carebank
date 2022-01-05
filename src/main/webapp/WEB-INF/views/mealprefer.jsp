<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/infodetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/info.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/prefer.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/meal.js"></script>
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
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
				</div>
			</div>
			<div class="prefer-content-item">
				<div class="content-title">
					<span class="content-desc">현재 HOT한 식단들!</span> <span
						class="content-item-desc">현재 날짜를 기준으로 일주일간 댓글이 많이 달린 상위 5가지
						식단을 모아봤어요.</span>
				</div>
				<div class="content-gallery">
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
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
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
				</div>
			</div>

		</div>
	</div>
</body>
</html>