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
.content-admin-side>#medi {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.content-image-content img {
	width: 300px;
}

#playlist {
	background: none;
	font-size: medium;
	border: none;
	margin-block: 0;
	padding: 10px 20px;
}

#playlist:hover {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	cursor: pointer;
}
</style>
<script>
	$(document).on("click", "button#delete", function(e) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			window.location.href = "mtdel.do?id=${res.meditate_id}";
		} else {
			return false;
		}
	});
	
	$(document).on("click", "#playlist", function(e) {
		var w = 600;
		var h = 600;
		
		var option = getOption(w, h);
		
		var url = "mtplay.do?id=" + ${res.meditate_id};
		var name = "플레이리스트 정보 변경";
		
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
					<h1>Information : Meditation</h1>
					<span>명상 정보를 관리합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<div class="content-desc-title">
							<h1>${res.med_title }</h1>
						</div>
						<hr>
						<div class="content-image-content">
							<c:choose>
								<c:when test="${fn:contains(res.med_thum, 'resources/img/')}">
									<img id=""
										src="${pageContext.request.contextPath }/${res.med_thum }"
										alt="${res.med_title }">
								</c:when>
								<c:otherwise>
									<img alt="${res.med_title }" src="${res.med_thum }">
								</c:otherwise>
							</c:choose>

						</div>
						<hr>
						<div class="content-desc-item">
							<h3>설명(인용 문구)</h3>
							<span>${res.med_quote}</span>
						</div>
						<hr>
						<div class="content-desc-item">
							<h3>카테고리</h3>
							<span>${res.subcat_name}</span>
						</div>
						<hr>
						<div class="content-desc-item">
							<span style="margin-right: 10px;">플레이리스트를 수정해야하나요?</span>
							<button id="playlist">여기를 클릭하세요!</button>
						</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="main-content-option">
					<div class="content-option-menu">
						<button onclick="window.location.href='medi.do'">목록</button>
						<button
							onclick="window.location.href='mtmodi.do?id=${res.meditate_id}'">수정</button>
						<button id="delete">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>