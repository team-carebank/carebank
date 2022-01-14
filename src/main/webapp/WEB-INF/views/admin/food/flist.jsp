<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="${pageContext.request.contextPath }/resources/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
	$(document).on("submit", '#search-keyword-data', function(e) {
		let keyword = e.target[1].value.trim();

		if (keyword == null || keyword == "") {
			alert("검색어를 입력하세요.");
			return false;
		} else {
			return true;
		}
	});
	$(document).on("click", ".pagination-page span", function(e) {
		let span = e.currentTarget;
		let path = "${pageContext.request.contextPath}/admin/food.do?page=";
		if (span.id == 'prev') {
			window.location.href = path + "${page-1}";
		} else if (span.id == 'next') {
			window.location.href = path + "${page+1}";
		} else {
			let page = e.currentTarget.innerText.trim();
			window.location.href = path + page;
		}
	});

	$(document).on("click", "#add.board-content-config", function(e) {
		window.location.href = "fwrite.do";
	});

	$(document).on("click", "#delete.board-content-config", function(e) {
		let parentElement = e.currentTarget.parentElement;
		let id = parentElement.childNodes[1].innerHTML.trim();

		window.location.href = "fdel.do?id=" + id;
	});
</script>
<style>
.pagination-page>span:hover, .board-content-name:hover,
	.board-content-config:hover {
	cursor: pointer;
	color: green;
}

.board-header#footer * {
	grid-column: 9;
}

.board-content-name:hover {
	color: black !important;
	cursor: inherit !important;
}

.board-header-content, .board-body-content {
	grid-template-columns: repeat(9, 1fr);
}

.content-admin-side>#food {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}
</style>
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="../side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Information : Food</h1>
					<span>식단과 관련된 음식의 영양소 정보를 관리합니다.</span>
				</div>
				<div class="admin-main-content">
					<div class="main-content-board">
						<div class="board-header">
							<div class="board-header-content">
								<span>번호</span><span class="board-content-name">이름</span> <span>칼로리</span><span>탄수화물</span><span>단백질</span><span>지방</span>
								<span style="grid-column: 8/10;">메뉴</span>
							</div>
						</div>
						<div class="board-body">
							<c:forEach var="dto" items="${res }">
								<div class="board-body-content">
									<span id="food_id">${dto.food_id }</span><span
										class="board-content-name">${dto.food }</span> <span>${dto.calories }</span>
									<span>${dto.carbo }</span><span>${dto.protein }</span><span>${dto.fat }</span>
									<span class="board-content-config" id="modify"
										onclick="window.location.href='fmodi.do?id=${dto.food_id}'">수정</span><span
										class="board-content-config" id="delete">삭제</span>
								</div>
							</c:forEach>
						</div>
						<div class="board-header" id="footer">
							<div class="board-header-content">
								<span class="board-content-config" id="add">추가하기</span>
							</div>
						</div>
					</div>
					<div class="main-content-pagination">
						<div class="pagination-page">
							<c:set var="endVar" value="${(cnt-1)/20 }" />
							<c:if test="${page > 1 }">
								<span id="prev">이전</span>
							</c:if>
							<c:forEach var="pageno" begin="1" end="${endVar + 1}">
								<c:choose>
									<c:when test="${pageno eq page }">
										<span style="color: #05C480">${pageno }</span>
									</c:when>
									<c:otherwise>
										<span>${pageno }</span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${page < endVar }">
								<span id="next">다음</span>
							</c:if>
						</div>
					</div>
					<div class="main-content-search">
						<form method="post" action="fsearch.do" id="search-keyword-data">
							<input type="hidden" name="page" value="1"><input
								type="text" name="keyword"> <input type="submit"
								value="검색">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>