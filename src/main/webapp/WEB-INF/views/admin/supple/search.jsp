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
<style type="text/css">
body>div.container>div>div.content-admin-main>div.admin-main-content>div.main-content-board>div:nth-child(1)>div>span.board-content-name
	{
	color: black !important;
	cursor: default !important;
}

.content-admin-side>#supple {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}
</style>
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
	$(document)
			.on(
					"click",
					".pagination-page span",
					function(e) {
						let span = e.currentTarget;
						let path = "${pageContext.request.contextPath}/admin/ssearch.do?keyword=${keyword}&search=${searchType}&page=";
						if (span.id == 'prev') {
							window.location.href = path + "${page-1}";
						} else if (span.id == 'next') {
							window.location.href = path + "${page+1}";
						} else {
							let page = e.currentTarget.innerText.trim();
							window.location.href = path + page;
						}
					});

	$(document).on("click", ".board-content-name", function(e) {
		if (e.currentTarget.parentElement.className == 'board-header-content') {
			return false;
		}
		let id = e.currentTarget.previousElementSibling.innerText;
		let path = "${pageContext.request.contextPath}/admin/sinfo.do?id=";

		window.location.href = path + id;
	});

	$(document).on("click", "#add.board-content-config", function(e) {
		window.location.href = "swrite.do";
	})
</script>
<style>
.pagination-page>span:hover, .board-content-name:hover,
	.board-content-config:hover {
	cursor: pointer;
	color: green;
}

.content-admin-side>#supple {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.efficacy-list {
	display: grid;
	justify-items: center;
	align-items: center;
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
					<h1>Search : Supplement</h1>
					<span>"${keyword }"에 대한 검색 결과입니다.</span>
				</div>
				<div class="admin-main-content">
					<div class="main-content-board">
						<div class="board-header">
							<div class="board-header-content">
								<span>번호</span> <span class="board-content-name">이름</span>
								<form method="post" action="ssearch.do">
									<input type="hidden" name="page" value="1"> <input
										type="hidden" name="search" value="category"> <select
										name="keyword" id="select-category"
										onchange="this.form.submit()">
										<option disabled selected>카테고리별로 보기</option>
										<c:forEach var="cat" items="${category }">
											<option value="${cat.subcat_name }">${cat.subcat_name }</option>
										</c:forEach>
									</select>
								</form>
								<span>메뉴</span>
							</div>
						</div>
						<div class="board-body">
							<c:forEach var="dto" items="${res }">
								<div class="board-body-content">
									<span id="supple_id">${dto.supple_id }</span> <span
										class="board-content-name">${dto.supple_name }</span>
									<div class="efficacy-list">
										<c:forEach var="map" items="${maps}">
											<c:forEach var="entry" items="${map }">
												<c:if test="${entry.key eq dto.supple_id }">
													<c:forEach var="effi" items="${entry.value }">
														<span>${effi }</span>
													</c:forEach>
												</c:if>
											</c:forEach>
										</c:forEach>
									</div>
									<span class="board-content-config" id="modify"
										onclick="window.location.href='smodi.do?id=${dto.supple_id}'">수정하기</span>
								</div>
							</c:forEach>
							<c:if test="${empty res }">
								<div class="board-body-content">
									<span style="grid-column: 1/6">검색 결과가 존재하지 않습니다.</span>
								</div>
							</c:if>
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
						<form method="post" action="ssearch.do" id="search-keyword-data">
							<input type="hidden" name="page" value="1"> <select
								name="search" id="">
								<option value="all" selected="selected">전체</option>
								<option value="name">영양제명</option>
								<option value="desc">효능</option>
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