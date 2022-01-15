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

	$(document).on("click", ".pagination-page span", function(e) {
		let span = e.currentTarget;
		let path = "${pageContext.request.contextPath}/admin/usearch.do?keyword=${keyword}&search=${searchType}&page=";
		if (span.id == 'prev') {
			window.location.href = path + "${page-1}";
		} else if (span.id == 'next') {
			window.location.href = path + "${page+1}";
		} else {
			let page = e.currentTarget.innerText.trim();
			window.location.href = path + page;
		}
	});

	$(document).on("click", "#disable.board-content-config", function(e) {
		if (confirm("정말로 비활성화 하시겠습니까?")) {
			console.log(e);
		}
	});
	$(document).on("click", "#enable.board-content-config", function(e) {
		if (confirm("정말로 활성화 하시겠습니까?")) {
			console.log(e);
		}
	});

	function selectOption(option, user_no) {
		if (option == 'state') {
			if (confirm("활성 상태를 변경하시겠습니까?")) {
				$.ajax({
					url: "ustate.do",
					type: "post",
					data: {user_no: user_no},
					success: function(res){
						if(res){
							alert("정보가 변경되었습니다.");
							window.location.reload();
						} else {
							alert("정보가 변경되지 않았습니다.");
						}
					},
					else: function(){
						console.log("통신 실패");
					}
				});
			} else return false;
		} else {
			if(confirm("회원의 비밀번호가 변경됩니다. 수정하시겠습니까?")){
				var w = 600;
				var h = 600;
				
				var option = getOption(w, h);
				
				var url = "upwd.do?no=" + user_no;
				var name = "회원 비밀번호 변경";
				
				 window.open(url, name, option);
			} else return false;
		}
	}

	function getOption(w, h){
		//팝업이 화면의 중앙에 오게 설정
		var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
	    var top = ((height / 2) - (h / 2)) + dualScreenTop;

		return "width="+w+", height="+h+", left="+left+", top="+top+", location=no, resizable=no";
	}
</script>
<style>
.pagination-page>span:hover, .board-content-config:hover {
	cursor: pointer;
	color: green;
}

.content-admin-side>#user {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.board-header-content, .board-body-content {
	display: grid;
	grid-template-columns: repeat(13, 1fr);
}

.board-header-content>*, .board-body-content>* {
	text-align: center;
}

#select-category {
	width: 100%;
}

.user_id {
	grid-column: 4/6;
}

.birth {
	grid-column: 6/8;
}

.phone {
	grid-column: 8/10;
}

.email {
	grid-column: 10/12;
}

.board-body-content>* {
	font-size: 11pt;
}

#user-option {
	width: 20px !important;
	text-align: center;
	border: none;
	font-size: medium;
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
					<h1>Management : Member</h1>
					<c:choose>
						<c:when test="${keyword eq 'enabled' }">
							<span>활성화(가입) 상태인 회원 정보를 관리합니다.</span>
						</c:when>
						<c:otherwise>
							<span>"${keyword }"로 검색한 결과입니다.</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="admin-main-content">
					<div class="main-content-board">
						<div class="board-header">
							<div class="board-header-content">
								<span>번호</span><span class="board-content-name">이름</span><span
									class="user_id">ID</span><span class="birth">생년월일</span> <span
									class="phone">연락처</span><span class="email">e-mail</span>
								<form action="usearch.do" method="post">
									<input type="hidden" name="page" value="1"> <input
										type="hidden" name="search" value="type"> <select
										name="keyword" id="select-category"
										onchange="this.form.submit()">
										<option disabled selected>상태</option>
										<option value="all">전체 보기</option>
										<option value="enabled">활성화 회원만 보기</option>
									</select>
								</form>
								<span>메뉴</span>
							</div>
						</div>
						<div class="board-body">
							<c:forEach var="dto" items="${res }">
								<div class="board-body-content">
									<span>${dto.user_no }</span><span class="board-content-name">${dto.user_name }</span>
									<span class="user_id">${dto.user_id }</span> <span
										class="birth">${dto.birth}</span> <span class="phone">${dto.phone }</span><span
										class="email">${dto.email }</span><span> <c:choose>
											<c:when test="${dto.enabled_yn ne 'N'}">
												<span>가입</span>
											</c:when>
											<c:otherwise>
												<span>탈퇴</span>
											</c:otherwise>
										</c:choose>
									</span> <select name="menu" id="user-option"
										onchange="selectOption(this.value, ${dto.user_no });">
										<option disabled selected></option>
										<option value="state">활성 상태 변경</option>
										<option value="password">비밀번호 변경</option>
									</select>
								</div>
							</c:forEach>
						</div>
						<div class="board-header" id="footer">
							<div class="board-header-content">
								<br>
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
						<form method="post" action="usearch.do" id="search-keyword-data">
							<input type="hidden" name="page" value="1"> <input
								type="text" name="keyword"> <input type="submit"
								value="검색"> <input type="hidden" name="search"
								value="name">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>