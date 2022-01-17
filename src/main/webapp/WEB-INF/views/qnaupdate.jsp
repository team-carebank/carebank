<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type = "text/css">
	body{
		background-color: #287743;
	}
	.contact{
		padding: 4%;
		height: 400px;
	}
	.col-md-3{
		background: #ff9b00;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
		
	}
	.contact-form button:focus{
		box-shadow:none;
	}
</style>
</head>
<body>
	<header>
		<%@include file="../../header.jsp"%>
	</header>
	<div class="container contact">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<img src="https://image.ibb.co/kUASdV/contact-image.png"
						alt="image" />
					<h2>Q&A</h2>
					<h4>궁금한 점을 남겨주시면 케어뱅크가 답해드립니다.</h4>
				</div>
			</div>
			<div class="col-md-9">
				<form action="updateQna.do" method="post">
				<div class="contact-form">
					<div class="form-group">
							<input type="hidden" class="form-control" name="qa_no" value="${qna.qa_no }">
							<input type="hidden" name="status" value="${qna.status }">
							<input type="hidden" name="qa_gpno" value="${qna.qa_gpno }">
						<label class="control-label col-sm-2" for="ftitle">제목 : </label>
						<div class="col-sm-10">
						<c:choose>
						<c:when test="${qna.status eq '답변완료' }">
							<input type="text" class="form-control" name="title" value="${qna.title }" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" name="title" value="${qna.title }">
						</c:otherwise>
						</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="comment">내용 :</label>
						<div class="col-sm-10">
						<c:choose>
							<c:when test="${qna.status eq '답변완료' }">
							<textarea class="form-control" rows="13" id=""
								style="resize: none;" name="content" readonly="readonly">${qna.content }</textarea>
							</c:when>
							<c:otherwise>
								<textarea class="form-control" rows="13" id=""
								style="resize: none;" name="content">${qna.content }</textarea>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="comment">답변 작성:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="6" id="" name="answer"
								style="resize: none;" readonly="readonly"><c:if test="${not empty qna.answer }">${qna.answer }</c:if></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<c:if test="${qna.status ne '답변완료' }">
								<button type="submit" class="btn btn-default" >수정하기</button>							
							</c:if>
							<button type="button" class="btn btn-default" onclick="location.href='qnadelete.do?qa_no=${qna.qa_no}'">삭제하기</button>
							<button type="button" class="btn btn-default" onclick="history.back();">취소</button>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>