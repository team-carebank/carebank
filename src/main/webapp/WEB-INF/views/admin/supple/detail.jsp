<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
.content-admin-side>#supple {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}
</style>
<script>
	$(document).on("click", "button#delete", function(e) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			window.location.href = "sdel.do?id=${res.supple.supple_id}";
		} else {
			return false;
		}
	})
</script>
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="../side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Information : Supplement</h1>
					<span>영양제 정보를 관리합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<div class="content-desc-title">
							<h1>${res.supple.supple_name }</h1>
						</div>
						<hr>
						<div class="content-image-content">
							<c:choose>
								<c:when test="${res.supple.src ne null }">
									<img id="" src="${res.supple.src }"
										alt="${res.supple.supple_name }">
								</c:when>
								<c:otherwise>
									<img id="" alt="${res.supple.supple_name }"
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<hr>
						<div class="content-desc-item">
							<h3>효능</h3>
							<c:forEach var="item" items="${res.efficacy }">
								<div class="content-sub-item">
									<b>${item.subcat_name }</b>
									<pre>${item.description }</pre>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="main-content-option">
					<div class="content-option-menu">
						<button id="prev"
							onclick="window.location.href='mtinfo.do?id=${res.supple.supple_id-1}'">이전</button>
						<button onclick="window.location.href='supple.do'">목록</button>
						<button id="next"
							onclick="window.location.href='mtinfo.do?id=${res.supple.supple_id+1}'">다음</button>
					</div>
					<div class="content-option-menu">
						<button
							onclick="window.location.href='mtmodi.do?id=${res.supple.supple_id}'">수정</button>
						<button id="delete">삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>