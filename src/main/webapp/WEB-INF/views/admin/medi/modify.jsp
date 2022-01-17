<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript" src="/carebank/resources/js/admin.js"></script>
<style>
.content-admin-side>#medi {
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

	$(document).on("click", "input[name='med_thum']", function(e){
		let img = e.currentTarget.nextElementSibling;
		navigator.clipboard.readText().then(clipText =>{
			e.currentTarget.value = clipText
			img.setAttribute("src", clipText);
		});
	});
	
	$(document).on("click", "#cancle-img", function(e){
		let src = document.querySelector("input[name='med_thum']");
		let img = src.nextElementSibling;
		
		src.value = "${res.med_thum}";
		img.setAttribute("src", "${res.med_thum}");
	});
	
	$(document).on("click", "#submit", function(e){
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
					<h1>Modify : Meditation</h1>
					<span>명상 정보를 수정합니다.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="mtupdate.do" method="post" id="mForm">
							<input type="hidden" name="meditate_id"
								value="${res.meditate_id }">
							<div class="content-desc-title">
								<h3>타이틀</h3>
								<input type="text" name="med_title" value=${res.med_title }>
							</div>
							<hr>
							<div class="content-image-content">
								<h3>이미지</h3>
								<div class="desc-item-img">
									<input type="text" name="med_thum" readonly="readonly"
										value="${res.med_thum }">
									<c:choose>
										<c:when test="${fn:contains(res.med_thum, 'resources/img/')}">
											<img id="preview-img"
												src="${pageContext.request.contextPath }/${res.med_thum }"
												alt="${res.med_title }">
										</c:when>
										<c:otherwise>
											<img id="preview-img" alt="${res.med_title }"
												src="${res.med_thum }">
										</c:otherwise>
									</c:choose>
									<input type="button" id="upload" value="사진 업로드하기"> <input
										type="button" id="cancle-img" value="사진 되돌리기">
								</div>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>설명(인용문구)</h3>
								<textarea rows="" cols="" name="med_quote">${res.med_quote }</textarea>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>카테고리</h3>
								<select name="subcat_id">
									<c:forEach var="item" items="${category }">
										<c:choose>
											<c:when test="${item.subcat_name eq res.subcat_name }">
												<option value="${item.subcat_id }" selected>${item.subcat_name }</option>
											</c:when>
											<c:otherwise>
												<option value="${item.subcat_id }">${item.subcat_name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
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