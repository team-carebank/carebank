<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/infodetail.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
	$(document).on("click", "#comment-button", function(e) {
		var comment = document.getElementById("comment-text").value.trim();

		if (comment == "" || comment == null) {
			alert("댓글 내용을 입력하세요.");
			return false;
		}
		
		var confirmWrite = confirm("댓글을 작성하시겠습니까?");
		
		if(confirmWrite){
			$.ajax({
				url: "mealcomm.do",
				type: "post",
				data: JSON.stringify({info_id:${meal.meal_id} , comment: comment}),
				contentType: "application/json",
				success: function(res){
					if(res){
						alert("댓글이 작성되었습니다.");
						window.location.reload();
					};
				}, 
				error: function(){
					alert("통신 실패");
				}
			});	
		} else {
			document.getElementById("comment-text").focus();
			return false;
		}
	});
	
	$(document).on("click", "#comment-text", function(e) {
		/*
		if ("${sessionScope.loginUser}" == null
				|| "${sessionScope.loginUser}" == "") {
			alert("로그인 후에 사용 가능합니다.");
		} else {
			("#comment-text").attr("readonly", false);
		}*/
		$("#comment-text").attr("readonly", false);
	});

	$(document).on("click", ".comment-item-modify", function(e){
		var comm_no = e.currentTarget.id;
		cancle();
		var comment = $(".comment-item#"+comm_no);
		var content = comment.children(".comment-item-main").children(".comment-item-content");
		var text = content.children("span");
		comment.children(".comment-item-manage").hide();
		text.hide();
		var textarea = "<div class='comment-write'><label for='comment-modify-text'></label><textarea name='' id='comment-modify-text'>"+text.text()+"</textarea><div><button onclick='cancle();'>취소</button><button onclick='update("+comm_no+")'>수정</button></div></div>";
		content.append(textarea);
	});
	
	$(document).on("click", ".comment-item-delete", function(e){
		var comm_no = e.currentTarget.id;
		var confirmDelete = confirm("댓글을 삭제하시겠습니까?");
		if(confirmDelete){
			$.ajax({
				url: "mcommdelete.do",
				type: "post",
				data: JSON.stringify(comm_no),
				contentType: "application/json",
				success: function(res){
					if(res){
						alert("댓글이 삭제되었습니다.");
						window.location.reload();
					};
				}, 
				error: function(){
					alert("통신 실패");
				}
			});
		} else {
			return false;
		}
	});
	
	function cancle(){
		$(".comment-item-content").children(".comment-write").remove();
		$(".comment-item-content").children("span").show();
		$(".comment-item-manage").show();
	}
	
	function update(comm_no){
		var comment_text = document.getElementById("comment-modify-text").value.trim();
		var confirmUpdate = confirm("댓글을 수정하시겠습니까?");
		if(confirmUpdate){
			$.ajax({
				url: "mcommupdate.do",
				type: "post",
				data: JSON.stringify({comm_no: comm_no, comment: comment_text}),
				contentType: "application/json",
				success: function(res){
					if(res){
						alert("댓글이 수정되었습니다.");
						window.location.reload();
					};
				}, 
				error: function(){
					alert("통신 실패");
				}
			});
		} else {
			document.getElementById("comment-modify-text").focus();
			return false;
		}
	}
</script>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<div class="content-left">
				<h1>${meal.meal_name }</h1>
				<hr>
				<div class="content-item">
					<p>
						<b>레시피</b>
					</p>
					<p class="content-item-description">${meal.recipe }</p>
				</div>
				<hr>
				<div class="content-item">
					<p>
						<b>메인 푸드</b>
					</p>
					<c:forEach var="food" items="${ingredient }">
						<div class="content-food-list">
							<span><b>${food.food }</b></span>
							<p class="content-item-description">${fn:trim(food.description)}</p>
							<span>탄수화물 ${food.carbo}g 단백질 ${food.protein } 지방
								${food.fat }g</span> <span>칼로리 ${food.calories }kcal</span>
						</div>
					</c:forEach>
					<p class="content-item-desc">* 영양소 정보는 100g을 기준으로 합니다.</p>
				</div>
				<hr>
				<div class="menu-area">
					<a href="javascript: history.back();">목록으로 돌아가기</a>
				</div>
			</div>
			<div class="content-right">
				<div class="content-image">
					<c:choose>
						<c:when test="${meal.src ne null }">
							<img src="${meal.src }" alt="${meal.meal_name }">
						</c:when>
						<c:otherwise>
							<img alt="${meal.meal_name }"
								src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="comment-area">
			<h2 class="content-desc">댓글</h2>
			<div class="comment-write">
				<textarea name="" id="comment-text" placeholder="내용을 입력하세요."
					readonly="readonly"></textarea>
				<div></div>
				<input type="button" value="작성" id="comment-button">
			</div>
			<div class="comment-list">
				<c:forEach var="comm" items="${comment }">
					<div class="comment-item" id="${comm.comm_no }">
						<div class="comment-item-main">
							<div class="comment-item-info">
								<span>${comm.user_name }</span><span><fmt:formatDate
										value="${comm.regdate }" pattern="yyyy-MM-dd" /></span>
							</div>
							<div class="comment-item-content">
								<span>${comm.content }</span>
							</div>
						</div>
						<div class="comment-item-manage">
							<span class="comment-item-modify" id="${comm.comm_no }">수정</span><span
								class="comment-item-delete" id="${comm.comm_no }">삭제</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>