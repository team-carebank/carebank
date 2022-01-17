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

#upload:hover {
	font-weight: bold;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 10 * 1024 * 1024; // 10MB
	
	$(document).on("click", "#upload", function(e) {
		var formData = new FormData();
		var file = $("#file")[0].files[0];

		
		if(file.size >= maxSize){
			alert("업로드 가능한 크기를 초과하였습니다. 최대 10MB까지 업로드 가능합니다.");
			return false;
		}
		
		if(regex.test(file.name)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		formData.append('file', file);

		$.ajax({
			url : 'upload.do',
			type : "post",
			processData : false,
			contentType : false,
			data : formData,
			success : function(res) {
				if (res != null) {
					alert("이미지가 업로드 되었습니다!");
					$(opener.document).find("input[name='src']").val(res);
					$(opener.document).find("input[name='exer_thum']").val(res);
					$(opener.document).find("input[name='med_thum']").val(res);
					$(opener.document).find("input[name='supple.res']").val(res);
					$(opener.document).find("#supple-src").val(res);
					$(opener.document).find("#preview-img").attr("src", res);
					window.close();
				} else {
					alert("이미지 업로드에 실패하였습니다.");
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
				<h1>이미지 업로드</h1>
			</div>
			<div class="popup-body">
				<form id="mForm" class="popup-body-form"
					enctype="multipart/form-data">
					<input type="file" name="file" id="file"> <input
						type="button" id="upload" value="업로드하기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>