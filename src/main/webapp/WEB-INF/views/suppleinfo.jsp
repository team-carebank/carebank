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
			url: "supplecomm.do",
			type: "post",
			data: JSON.stringify({info_id:${supple.supple_id} , comment: comment}),
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
	document.getElementById("comment-modify-text").focus();
});

$(document).on("click", ".comment-item-delete", function(e){
	var comm_no = e.currentTarget.id;
	var confirmDelete = confirm("댓글을 삭제하시겠습니까?");
	if(confirmDelete){
		$.ajax({
			url: "scommdelete.do",
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
			url: "scommupdate.do",
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
<style>
.content-item-shopping {
	display: list-item;
	list-style-type: none;
	margin-block: 0;
	padding-inline-start: 0 !important;
}

.content-item-shopping li {
	display: inline-block;
	margin-block: 10px;
}

.content-item-shopping li * {
	display: inline-block;
	vertical-align: middle;
	margin-inline-start: 0;
}

.content-item-shopping img:hover {
	cursor: pointer;
}

.content-item-shopping img {
	margin: 0;
	padding: 0;
}
</style>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<div class="content-left">
				<h1>${supple.supple_name }</h1>
				<hr>
				<div class="content-item">
					<p>
						<b>효능</b>
					</p>
					<ul>
						<c:forEach var="desc" items="${description }">
							<li style='list-style-type: "\1F44D"; display: list-item;'>${desc }</li>
						</c:forEach>
					</ul>
				</div>
				<hr>
				<div class="content-item">
					<p>
						<b>쇼핑하기</b>
					</p>
					<c:forEach var="item" items="${shopping }">
						<ul class="content-item-shopping">
							<li>${item.title }</li>
							<li>|</li>
							<li>${item.maker }</li>
							<li><img alt="네이버 쇼핑 링크"
								src="${pageContext.request.contextPath }/resources/img/naver_shopping_logo.png"
								onclick="window.location.href='${item.link}'"></li>
						</ul>
					</c:forEach>
					<br> <a
						href="https://search.shopping.naver.com/search/all?query=${supple.supple_name }">직접
						쇼핑하기</a>
					<p class="content-item-desc">* 네이버 쇼핑 검색 결과를 기준으로 표시됩니다.</p>
				</div>
				<hr>
				<div class="menu-area">
					<a href="javascript: history.back();">목록으로 돌아가기</a>
				</div>
			</div>
			<div class="content-right">
				<div class="content-image">
					<c:choose>
						<c:when test="${supple.src ne null }">
							<img src="${supple.src }" alt="${supple.supple_name }">
						</c:when>
						<c:otherwise>
							<img alt="${supple.supple_name }"
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