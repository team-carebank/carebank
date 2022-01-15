<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

input {
	font-size: large;
	width: 300px;
	text-align: center;
}

#changePwd:hover {
	font-weight: bold;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).on("click", "#changePwd", function(e) {
		let pw = $("input[name='user_pw']").val().trim();

		console.log(pw);

		$.ajax({
			url : 'updatepwd.do',
			type : 'post',
			data : {
				no : ${user_no},
				pw : pw
			},
			success : function(res) {
				if (res) {
					alert("회원 정보가 변경되었습니다.");
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
				<h1>비밀번호 변경</h1>
				<span>${user_name }(${user_id })의 비밀번호를 변경합니다.</span>
			</div>
			<div class="popup-body">
				<input type="password" name="user_pw" placeholder="비밀번호를 입력하세요.">
			</div>
			<input type="button" id="changePwd" value="비밀번호 수정하기">
		</div>
	</div>
</body>
</html>