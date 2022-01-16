<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin.css">
<style>
body {
	display: grid;
	width: 100vh;
	height: 100vh;
	justify-items: center;
	align-items: center;
	margin: 0;
	text-align: center;
}

body>div {
	display: grid;
	width: 100%;
	height: 100%;
}

.popup-content, .popup-body-form {
	display: grid;
	justify-items: center;
	align-items: center;
}

.popup-body-form>div {
	margin-block: 10px;
}

.popup-body-form>* {
	width: 300px;
	text-align: center;
}

#modify:hover {
	font-weight: bold;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).on("click", "#modify", function(e) {
		let mForm = $("#mForm").serialize();

		$.ajax({
			url : 'mtapi.do',
			data : mForm,
			success : function(res) {
				if (res) {
					alert("API 정보가 변경되었습니다.");
					opener.parent.location.reload();
					window.close();
				}
			},
			error : function() {
				alert("통신 실패");
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div class="popup-content">
			<div class="popup-head">
				<h1>${res.med_title }</h1>
				<span>플레이리스트 API 정보를 수정합니다.</span>
			</div>
			<div class="popup-body">
				<form id="mForm" class="popup-body-form">
					<input type="hidden" name="meditate_id" value="${res.meditate_id }">
					<div>
						<label for="play">PLAYLIST API KEY</label> <input type="text"
							name="med_url_play" id="play"
							<c:if test="${not empty res.med_url_play }">value="${res.med_url_play }"</c:if>>
					</div>
					<div>
						<label for="play">PLAYLIST ITEM 1</label> <input type="text"
							name="med_url_playlist1" id="item_1"
							<c:if test="${not empty res.med_url_playlist1 }">value="${res.med_url_playlist1 }"</c:if>>
					</div>
					<div>
						<label for="play">PLAYLIST ITEM 2</label> <input type="text"
							name="med_url_playlist2" id="item_2"
							<c:if test="${not empty res.med_url_playlist2 }">value="${res.med_url_playlist2 }"</c:if>>
					</div>
					<div>
						<label for="play">PLAYLIST ITEM 3</label> <input type="text"
							name="med_url_playlist3" id="item_3"
							<c:if test="${not empty res.med_url_playlist3 }">value="${res.med_url_playlist3 }"</c:if>>
					</div>
				</form>
			</div>
			<input type="button" id="modify" value="수정하기">
		</div>
	</div>
</body>
</html>