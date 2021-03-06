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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<style>
.content-admin-side>#meal {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}
</style>
<script>
	$(function(){
		var textarea = document.getElementsByTagName("textarea");
		for(var i=0; i<textarea.length; i++){
			resize(textarea[i]);
		}
		
		$(".desc-item-food").each(function(i){
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

	$(document).on("click", "input[name='src']", function(e){
		let img = e.currentTarget.nextElementSibling;
		navigator.clipboard.readText().then(clipText =>{
			e.currentTarget.value = clipText
			img.setAttribute("src", clipText);
		});
	});
	
	$(document).on("click", "#cancle-img", function(e){
		let src = document.querySelector("input[name='src']");
		let img = src.nextElementSibling;
		
		src.value = "${meal.src}";
		img.setAttribute("src", "${meal.src}");
	});
	
	$(document).on("click", "#submit", function(e){
		var foods = $(".desc-item-food");
		
		foods.each(function(i){
			$(this).find("input[name='food']").attr("name", "foods["+i+"].food");
			$(this).find("textarea[name='description']").attr("name", "foods[" + i + "].description");
			$(this).find("input[name='carbo']").attr("name", "foods["+i+"].carbo");
			$(this).find("input[name='protein']").attr("name", "foods["+i+"].protein");
			$(this).find("input[name='fat']").attr("name", "foods["+i+"].fat");
			$(this).find("input[name='calories']").attr("name", "foods["+i+"].calories");
		});
		
		document.getElementById("mForm").submit();
	});
</script>
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="../side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Modify : Meal</h1>
					<span>식단 정보를 수정합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="mmodify.do" method="post" id="mForm">
							<input type="hidden" name="meal_id" value="${meal.meal_id }">
							<div class="content-desc-item">
								<h3>식단명</h3>
								<input type="text" name="meal_name" value="${meal.meal_name }">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>이미지</h3>
								<div class="desc-item-img">
									<input type="text" name="src"
										placeholder="클릭 시 클립보드에 복사된 내용을 붙여넣습니다." readonly="readonly"
										value=${meal.src }> <img alt="이미지" id="preview-img"
										src="${meal.src }"> <input type="button" id="upload"
										value="사진 업로드하기"> <input type="button" id="cancle-img"
										value="사진 되돌리기">
								</div>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>카테고리</h3>
								<select name="subcat_id">
									<c:forEach var="cat" items="${category }">
										<c:choose>
											<c:when test="${cat.subcat_id eq meal.subcat_id }">
												<option value="${cat.subcat_id }" selected="selected">${cat.subcat_name }</option>
											</c:when>
											<c:otherwise>
												<option value="${cat.subcat_id}">${cat.subcat_name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>레시피</h3>
								<textarea name="recipe" placeholder="레시피를 입력하세요!">${meal.recipe }</textarea>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>메인푸드</h3>
								<c:forEach var="item" items="${food }">
									<div class="desc-item-food" id="one">
										<div>
											<span>식품명</span> <input type="text" name="food"
												placeholder="ex) 사과, 바나나" value="${item.food }">
										</div>
										<div>
											<span>설명</span>
											<textarea name="description"
												placeholder="효능 또는 간단한 설명을 입력하세요!">${item.description}</textarea>
										</div>
										<div>
											<span style="margin-block: 30px; font-weight: bold;">영양소</span><span>영양소
												정보는 100g을 기준으로 입력합니다.</span> <span>탄수화물</span> <input type="number"
												name="carbo" value="${item.carbo }" step="0.01"> <span>단백질</span>
											<input type="number" name="protein" value="${item.protein }"
												step="0.01"> <span>지방</span> <input type="number"
												name="fat" value="${item.fat }" step="0.01"> <span>칼로리</span>
											<input type="number" name="calories"
												value="${item.calories }" step="0.01">
										</div>
										<input type="button" value="+" id="add-food"> <input
											type="button" value="-" id="remove-food">
									</div>
								</c:forEach>
								<c:if test="${empty food }">
									<div class="desc-item-food" id="zero">
										<div>
											<span>식품명</span> <input type="text" name="food"
												placeholder="ex) 사과, 바나나" value="${item.food }">
										</div>
										<div>
											<span>설명</span>
											<textarea name="description"
												placeholder="효능 또는 간단한 설명을 입력하세요!">${item.description}</textarea>
										</div>
										<div>
											<span style="margin-block: 30px; font-weight: bold;">영양소</span><span>영양소
												정보는 100g을 기준으로 입력합니다.</span> <span>탄수화물</span> <input type="number"
												name="carbo" value="0" step="0.01"> <span>단백질</span>
											<input type="number" name="protein" value="0" step="0.01">
											<span>지방</span> <input type="number" name="fat" value="0"
												step="0.01"> <span>칼로리</span> <input type="number"
												name="calories" value="0" step="0.01">
										</div>
										<input type="button" value="+" id="add-food"> <input
											type="button" value="-" id="remove-food">
									</div>
								</c:if>
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