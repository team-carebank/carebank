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
						<li><a href="javascript: void(0);">#편두통</a></li>
						<li><a href="javascript: void(0);">#변비</a></li>
						<li><a href="javascript: void(0);">#여드름 #두피염 #아토피</a></li>
						<li><a href="javascript: void(0);">#빈열 #어지럼증 #저혈압</a></li>
						<li><a href="javascript: void(0);">#비염</a></li>
						<li><a href="javascript: void(0);">#소화불량</a></li>
						<li><a href="javascript: void(0);">#심장_뻐근함 #혈액순환</a></li>
						<li><a href="javascript: void(0);">#디스크 #허리통증 #관절</a></li>
						<li><a href="javascript: void(0);">#고지혈증 #고혈압</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">건강증진</a>
					<ul class="sub-category-list">
						<li><a href="javascript: void(0);">#노화예방</a></li>
						<li><a href="javascript: void(0);">#면역력_강화</a></li>
						<li><a href="javascript: void(0);">#여성건강</a></li>
						<li><a href="javascript: void(0);">#남성건강</a></li>
						<li><a href="javascript: void(0);">#눈_건강</a></li>
						<li><a href="javascript: void(0);">#흡연</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">멘탈케어</a>
					<ul class="sub-category-list">
						<li><a href="javascript: void(0);">#스트레스_완화</a></li>
						<li><a href="javascript: void(0);">#세로토닌_증진</a></li>
						<li><a href="javascript: void(0);">#불면증</a></li>
						<li><a href="javascript: void(0);">#명상</a></li>
					</ul></li>
				<li><a href="#" class="category-list-item">다이어트</a>
					<ul class="sub-category-list">
						<li><a href="javascript: void(0);">#균형잡힌_식단</a></li>
						<li><a href="javascript: void(0);">#체중감량</a></li>
						<li><a href="javascript: void(0);">#체중증량</a></li>
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
					<span class="sub-category-desc"><b></b>에는 <b></b>이 들어간 음식을
						먹는게 좋아요.</span>
				</div>
			</div>
			<div class="content-default">
				<div class="content-gallery">
					<figure onclick="clickFigure();">
						<img
							src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지1</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지2</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지3</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지4</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지5</p>
					</figure>
					<figure onclick="clickFigure();">
						<img
							src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
							class="content-gallery__img" alt="image 1">
						<p class="content-gallery__caption">이미지6</p>
					</figure>
				</div>
				<p class="content-gallery-continue" onclick="clickContinue();">더보기</p>
				<div class="content-continue">
					<div class="content-gallery" id="continue">
						<figure onclick="clickFigure();">
							<img
								src="https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지1</p>
						</figure>
						<figure onclick="clickFigure();">
							<img
								src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지2</p>
						</figure>
						<figure onclick="clickFigure();">
							<img
								src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지3</p>
						</figure>
						<figure onclick="clickFigure();">
							<img
								src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지4</p>
						</figure>
						<figure onclick="clickFigure();">
							<img
								src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지5</p>
						</figure>
						<figure onclick="clickFigure();">
							<img
								src="https://www.next-t.co.kr/public/uploads/7b7f7e2138e29e598cd0cdf2c85ea08d.jpg"
								class="content-gallery__img" alt="image 1">
							<p class="content-gallery__caption">이미지6</p>
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>