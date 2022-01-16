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

.content-admin-side>#supple {
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

	$(document).on("click", "#add-food", function(e) {
		let parentElement = e.currentTarget.parentElement;
		let grandmaElement = parentElement.parentElement;

		let cloneElement = parentElement.cloneNode(true);
		cloneElement.removeAttribute("id");

		grandmaElement.appendChild(cloneElement);
	});

	$(document).on("click", "#remove-food", function(e) {
		let currentParent = e.currentTarget.parentElement;

		if (currentParent.id == 'one' || currentParent.id == 'zero') {
			alert("첫번째 항목은 삭제할 수 없습니다!");
			return false;
		}

		currentParent.remove();
	});

	$(document).on("click", "input[name='supple.src']", function(e){
		let img = e.currentTarget.nextElementSibling;
		navigator.clipboard.readText().then(clipText =>{
			e.currentTarget.value = clipText
			img.setAttribute("src", clipText);
		});
	});
	
	$(document).on("click", "#cancle-img", function(e){
		let src = document.querySelector("input[name='supple.src']");
		let img = src.nextElementSibling;
		
		src.value = "${res.supple.src}";
		img.setAttribute("src", "${res.supple.src}");
	});
	
	$(document).on("click", "#submit", function(e){
		var effi = $(".content-sub-item");
		
		effi.each(function(i){
			$(this).find("select[name='subcat_id']").attr("name", "efficacy["+i+"].subcat_id");
			$(this).find("textarea[name='description']").attr("name", "efficacy[" + i + "].description");
		});
		
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
					<h1>Write : Supple</h1>
					<span>영양제 정보를 작성합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="sinsert.do" method="post" id="mForm">
							<div class="content-desc-item">
								<h3>식단명</h3>
								<input type="text" name="supple.supple_name" value="">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>이미지</h3>
								<div class="desc-item-img">
									<input type="text" name="supple.src"
										placeholder="클릭 시 클립보드에 복사된 내용을 붙여넣습니다." readonly="readonly"
										value=""> <img alt="이미지" src=""> <input
										type="button" id="cancle-img" value="사진 되돌리기">
								</div>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>효능</h3>
								<div class="content-sub-item" id="one">
									<div>
										<label for="subcat">기존 : ${item.subcat_name }</label> <select
											name="subcat_id" id="subcat" id="select-category">
											<option disabled selected>카테고리 선택</option>
											<c:forEach var="cat" items="${category }">
												<c:choose>
													<c:when test="${cat.subcat_id eq item.subcat_id }">
														<option value="${cat.subcat_id }" selected>${cat.subcat_name }</option>
													</c:when>
													<c:otherwise>
														<option value="${cat.subcat_id }">${cat.subcat_name }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<textarea rows="" cols="" name="description"
										placeholder="효능을 입력하세요"></textarea>
									<input type="button" value="+" id="add-food"> <input
										type="button" value="-" id="remove-food">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="main-content-option">
					<div class="content-option-menu"></div>
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