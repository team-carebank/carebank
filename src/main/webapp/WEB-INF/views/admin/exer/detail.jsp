<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.content-admin-side>#exer {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.content-image-content img {
	width: 300px;
}
</style>
<script>
	$(document).on("click", "button#delete", function(e) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			window.location.href = "edel.do?id=${exer.exer_id}";
		} else {
			return false;
		}
	})
	
	$(document).on("click", "#teachable", function(e) {
		var w = 600;
		var h = 600;
		
		var option = getOption(w, h);
		
		var url = "exertm.do?id=" + ${exer.exer_id};
		var name = "Teachable Machine 정보 변경";
		
		 window.open(url, name, option);
	});
	
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
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="../side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Information : Exercise</h1>
					<span>운동 정보를 관리합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<div class="content-desc-title">
							<h1>${exer.exer_name }</h1>
						</div>
						<hr>
						<div class="content-image-content">
							<c:choose>
								<c:when test="${fn:contains(exer.exer_thum, 'resources/img/')}">
									<img id=""
										src="${pageContext.request.contextPath }/${exer.exer_thum }"
										alt="${exer.exer_name }">
								</c:when>
								<c:otherwise>
									<img alt="${exer.exer_name }" src="${exer.exer_thum }">
								</c:otherwise>
							</c:choose>

						</div>
						<hr>
						<div class="content-desc-item">
							<h3>설명</h3>
							<span>${exer.exer_description}</span>
						</div>
						<hr>
						<div class="content-desc-item">
							<h3>운동 유형</h3>
							<span>${exer.exer_type }</span>
						</div>
						<div class="content-desc-item">
							<h3>1회당 소모 칼로리</h3>
							<span>${exer.exer_kcal }</span>
						</div>
						<hr>
						<div class="content-desc-item">
							<h3>카테고리</h3>
							<span>${exer.subcat_name}</span>
						</div>
						<hr>
						<div class="content-desc-item">
							<span style="margin-right: 10px;">Teachable Machine을
								연결해보세요!</span>
							<button id="teachable">클릭하여 설정하기</button>
						</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="main-content-option">
					<div class="content-option-menu">
						<button id="prev" onclick="history.back()">이전</button>
						<button onclick="window.location.href='exer.do'">목록</button>
						<button id="next"
							onclick="window.location.href='einfo.do?id=${exer.exer_id+1}'">다음</button>
					</div>
					<div class="content-option-menu">
						<button
							onclick="window.location.href='emodi.do?id=${exer.exer_id}'">수정</button>
						<button id="delete">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>