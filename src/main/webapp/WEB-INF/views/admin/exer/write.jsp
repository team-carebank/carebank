<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="form" uri="http://www.springframework.org/tags/form"%>
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

#mForm>.content-desc-item>div>div {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	margin-block: 20px;
	align-items: center;
}

#one>#add-food, #zero>#add-food {
	grid-column: 1/3;
}

#remove-food, #add-food, #cancle-img {
	border: none;
	border-radius: 2px;
	padding: 5px 10px;
}

#remove-food:hover, #add-food:hover, #cancle-img:hover {
	background-color: green;
	color: white;
}

#one>#remove-food, #zero>#remove-food {
	display: none;
}

.desc-item-img {
	display: grid !important;
	grid-gap: 10px;
	justify-items: starat;
}

.desc-item-img img {
	width: 300px;
}

.content-admin-side>#exer {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.content-sub-item {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 10px;
	align-items: center;
}
</style>
<script>
	$(function(){
		var textarea = document.getElementsByTagName("textarea");
		for(var i=0; i<textarea.length; i++){
			resize(textarea[i]);
		}
		
		$(".content-sub-item").each(function(i){
			if(i != 0){
				$(this).removeAttr("id");
			}
		});
	});
</script>
<script>
	$(document).on("keydown", "textarea", function(e) {
		resize(e.currentTarget);
	});

	$(document).on("keyup", "textarea", function(e) {
		resize(e.currentTarget);
	});

	$(document).on("click", "input[name='exer_thum']", function(e){
		let img = e.currentTarget.nextElementSibling;
		navigator.clipboard.readText().then(clipText =>{
			e.currentTarget.value = clipText
			img.setAttribute("src", clipText);
		});
	});
	
	$(document).on("click", "#submit", function(e){
		document.getElementById("mForm").submit();
	});
	
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (obj.scrollHeight) + "px";
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
					<h1>Write : Exercise</h1>
					<span>운동 정보를 작성합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="einsert.do" method="post" id="mForm">
							<div class="content-desc-title">
								<h3>이름</h3>
								<input type="text" name="exer_name">
							</div>
							<hr>
							<div class="content-image-content">
								<input type="text" name="exer_thum" readonly="readonly">
								<img alt="" src="" id="Img">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>설명</h3>
								<textarea rows="" cols="" name="exer_description"></textarea>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>운동 유형</h3>
								<select name="exer_type">
									<option value="유산소">유산소</option>
									<option value="무산소">무산소</option>
									<option value="기타">기타</option>
								</select>
								<h3>1회당 소모 칼로리</h3>
								<input type="number" name="exer_kcal">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>카테고리</h3>
								<select name="subcat_id">
									<c:forEach var="item" items="${category }">
										<option value="${item.subcat_id }">${item.subcat_name }</option>
									</c:forEach>
								</select>
							</div>
						</form>
					</div>
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
</body>
</html>