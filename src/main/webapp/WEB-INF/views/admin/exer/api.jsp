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
	display: grid;
	margin-block: 10px;
}

.popup-body-form>div>* {
	width: 300px;
	font-size: medium;
}

.popup-body-form>div>textarea {
	width: 300px;
	height: 100px;
	font-size: medium;
}

.popup-body-form>div>label {
	font-weight: bold;
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
			url : 'exerapi.do',
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
				<h1>${res.exer_name }</h1>
				<span>Teachable Machine API 정보를 수정합니다.</span>
			</div>
			<div class="popup-body">
				<form id="mForm" class="popup-body-form">
					<input type="hidden" name="exer_id" value="${res.exer_id }">
					<div>
						<label for="title">타이틀</label> <input type="text"
							name="exer_title" id="title"
							<c:if test="${not empty res.exer_title }"> value="${res.exer_title }"</c:if>>
					</div>
					<div>
						<label for="notice">주의사항을 입력하세요.</label><input type="text"
							name="exer_notice" id="title"
							<c:if test="${not empty res.exer_notice }"> value="${res.exer_notice }"</c:if>>
					</div>
					<div>
						<label for="videoUrl">비디오 또는 이미지 태그를 입력하세요.</label>
						<textarea name="exer_video_url" id="videoUrl"><c:if
								test="${not empty res.exer_video_url }">${res.exer_video_url }</c:if></textarea>
					</div>
					<div>
						<label for="tmUrl">Teachable Machine 모델 주소를 입력하세요.</label> <input
							type="text" name="exer_tm_url" id="tmUrl"
							<c:if test="${not empty res.exer_tm_url }"> value="${res.exer_tm_url }"</c:if>>
					</div>
				</form>
			</div>
			<input type="button" id="modify" value="수정하기">
		</div>
	</div>
</body>
</html>