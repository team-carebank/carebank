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
<style>
.content-item-shopping {
	display: list-item;
	list-style-type: none;
	margin-block: 0;
	padding-inline-start: 0 !important;
}

.content-item-shopping li {
	display: inline-block;
	margin-block: 10px;
}

.content-item-shopping li * {
	display: inline-block;
	vertical-align: middle;
	margin-inline-start: 0;
}

.content-item-shopping img:hover {
	cursor: pointer;
}

.content-item-shopping img {
	margin: 0;
	padding: 0;
}
</style>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="main-content">
		<div class="body-content">
			<div class="content-left">
				<h1>${supple.supple_name }</h1>
				<hr>
				<div class="content-item">
					<p>
						<b>효능</b>
					</p>
					<ul>
						<c:forEach var="desc" items="${description }">
							<li style='list-style-type: "\1F44D"; display: list-item;'>${desc }</li>
						</c:forEach>
					</ul>
				</div>
				<hr>
				<div class="content-item">
					<p>
						<b>쇼핑하기</b>
					</p>
					<c:forEach var="item" items="${shopping }">
						<ul class="content-item-shopping">
							<li>${item.title }</li>
							<li>|</li>
							<li>${item.maker }</li>
							<li><img alt="네이버 쇼핑 링크"
								src="${pageContext.request.contextPath }/resources/img/naver_shopping_logo.png"
								onclick="window.location.href='${item.link}'"></li>
						</ul>
					</c:forEach>
					<br> <a
						href="https://search.shopping.naver.com/search/all?query=${supple.supple_name }">직접
						쇼핑하기</a>
					<p class="content-item-desc">* 네이버 쇼핑 검색 결과를 기준으로 표시됩니다.</p>
				</div>
				<hr>
				<div class="menu-area">
					<a href="javascript: history.back();">목록으로 돌아가기</a>
				</div>
			</div>
			<div class="content-right">
				<div class="content-image">
					<c:choose>
						<c:when test="${supple.src ne null }">
							<img src="${supple.src }" alt="${supple.supple_name }">
						</c:when>
						<c:otherwise>
							<img alt="${supple.supple_name }"
								src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>