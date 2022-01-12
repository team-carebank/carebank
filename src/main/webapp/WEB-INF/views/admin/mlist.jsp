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
		let path = "${pageContext.request.contextPath}/admin/meal.do?page=";
		if (span.id == 'prev') {
			window.location.href = path + "${page-1}";
		} else if (span.id == 'next') {
			window.location.href = path + "${page+1}";
		} else {
			let page = e.currentTarget.innerText.trim();
			if(page != ${page}){
				window.location.href = path + page;				
			} else {
				alert("현재 페이지입니다.");
			}
		}
	});
	
	$(document).on("click", ".board-content-name", function(e){
		let id = e.currentTarget.previousElementSibling.innerText;
		let path = "${pageContext.request.contextPath}/admin/minfo.do?id=";
		
		window.location.href = path + id;
	});
</script>
<style>
.pagination-page>span:hover, .board-content-name:hover,
	.board-content-config:hover {
	cursor: pointer;
	color: green;
}
</style>
</head>
<%@ include file="header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Information : Meal</h1>
					<span>식단 정보를 관리합니다.</span>
				</div>
				<div class="admin-main-content">
					<div class="main-content-board">
						<div class="board-header">
							<div class="board-header-content">
								<span>번호</span> <span class="board-content-name">이름</span> <select
									name="category" id="select-category"
									onchange="this.form.submit()">
									<option disabled selected>카테고리별로 보기</option>
									<option value="1">만성질환</option>
									<option value="2">건강증진</option>
									<option value="3">멘탈케어</option>
									<option value="4">다이어트</option>
								</select> <span>메뉴</span>
							</div>
						</div>
						<div class="board-body">
							<c:forEach var="dto" items="${res }">
								<div class="board-body-content">
									<span id="meal_id">${dto.meal_id }</span> <span
										class="board-content-name">${dto.meal_name }</span> <span>${dto.subcat_name }</span>
									<span class="board-content-config" id="modify">수정하기</span>
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
						<form method="post" action="admin/searchmeal.do"
							id="search-keyword-data">
							<select name="search" id="">
								<option value="all" selected="selected">전체</option>
								<option value="name">식단명</option>
								<option value="category">카테고리명</option>
							</select> <input type="text" name="keyword"> <input type="submit"
								value="검색">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>