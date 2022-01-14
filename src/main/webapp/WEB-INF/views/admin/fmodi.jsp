<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
#mForm input[type="text"], #mForm textarea, #mForm select, #mForm>.content-desc-item>div>span,
	#mForm input[type="number"] {
	width: 300px;
	min-height: 50px;
	font-size: large;
}

#mForm>.content-desc-item>div {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	margin-block: 20px;
	align-items: center;
}
</style>
<script>
	$(document).on("keydown", "textarea", function(e) {
		resize(e.currentTarget);
	});

	$(document).on("keyup", "textarea", function(e) {
		resize(e.currentTarget);
	});

	$(document).on("click", "#submit", function(e) {
		if (foodName == '' || foodName == null) {
			alert("식품명을 입력하세요!");
			return false;
		}

		document.getElementById("mForm").submit();
	});

	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
</head>
<%@ include file="header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Modify : Food</h1>
					<span>식단과 관련된 음식의 영양소 정보를 수정합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="fupdate.do" method="post" id="mForm">
							<input type="hidden" name="food_id" value="${food.food_id }">
							<div class="content-desc-item">
								<h3>식품명</h3>
								<input type="text" name="food" id="foodName" value=${food.food }
									readonly="readonly"> <span></span>
							</div>
							<hr>
							<div class="content-desc-item">
								<div>
									<span style="margin-block: 30px; font-weight: bold;">영양소</span><span
										style="font-size: medium">영양소 정보는 100g을 기준으로 입력합니다.</span> <span>탄수화물</span>
									<input type="number" name="carbo" value="${food.carbo }"
										step="0.01"> <span>단백질</span> <input type="number"
										name="protein" value="${food.protein }" step="0.01"> <span>지방</span>
									<input type="number" name="fat" value="${food.fat }"
										step="0.01"> <span>칼로리</span> <input type="number"
										name="calories" value="${food.calories }" step="0.01">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="main-content-option">
					<div class="content-option-menu">
						<button id="submit">작성</button>
						<button id="cancle" onclick="history.back();">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>