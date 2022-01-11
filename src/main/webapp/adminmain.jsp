<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</script>
</head>

<body>
	<div class="container">
		<div class="admin-info">
			<h1>CareBank</h1>
			<h2>ADMIN PAGE</h2>
			<span>관리자 페이지</span> <span>로그아웃</span>
		</div>
		<div class="body-content">
			<div class="content-admin-side">
				<div>
					<h3>Administration</h3>
					<!--메뉴 구분선-->
					<h4>Information</h4>
					<span>Meal</span> <span>Exercise</span> <span>Supplement</span> <span>Meditation</span>
					<!--메뉴 구분선-->
					<h4>User Management</h4>
					<span>Member</span> <span>Report</span>
					<!--메뉴 구분선-->
					<h4>Customer Service</h4>
					<span>Notice</span> <span>QnA</span> <span>FAQ</span>
				</div>
			</div>
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
							<div class="board-body-content">
								<span>1</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>2</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>3</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>4</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>5</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>6</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>7</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>8</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>9</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
							<div class="board-body-content">
								<span>10</span> <span class="board-content-name">제목</span> <span>카테고리</span>
								<span class="board-content-config" id="modify">수정하기</span>
							</div>
						</div>
						<div class="board-header" id="footer">
							<div class="board-header-content">
								<span class="board-content-config" id="add">추가하기</span>
							</div>
						</div>
					</div>
					<div class="main-content-pagination">
						<div class="pagination-page">
							<span id="prev">이전</span> <span>1</span> <span>2</span> <span>3</span>
							<span>4</span> <span id="next">다음</span>
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