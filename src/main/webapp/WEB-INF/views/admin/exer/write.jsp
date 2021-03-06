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
#one>#add-food, #zero>#add-food {
	grid-column: 1/3;
}

#one>#remove-food, #zero>#remove-food {
	display: none;
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
					<span>?????? ????????? ???????????????.</span>
				</div>
				<div class="main-content-info">
					<div class="content-desc">
						<form action="einsert.do" method="post" id="mForm">
							<div class="content-desc-title">
								<h3>??????</h3>
								<input type="text" name="exer_name">
							</div>
							<hr>
							<div class="content-image-content">
								<input type="text" name="exer_thum" readonly="readonly">
								<img alt="" src="" id="preview-img">
								<input type="button" id="upload" value="?????? ???????????????">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>??????</h3>
								<textarea rows="" cols="" name="exer_description"></textarea>
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>?????? ??????</h3>
								<select name="exer_type">
									<option value="?????????">?????????</option>
									<option value="?????????">?????????</option>
									<option value="??????">??????</option>
								</select>
								<h3>1?????? ?????? ?????????</h3>
								<input type="number" name="exer_kcal">
							</div>
							<hr>
							<div class="content-desc-item">
								<h3>????????????</h3>
								<select name="subcat_id">
									<c:forEach var="item" items="${category }">
										<option value="${item.subcat_id }">${item.subcat_name }</option>
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
						<button id="submit">??????</button>
						<button id="cancle" onclick="history.back();">??????</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>