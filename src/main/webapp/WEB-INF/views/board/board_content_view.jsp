<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시물 뷰</title>
<style type="text/css">
.main-container{
	width : calc(100%-220px);
	height: 100%;
	background : #fff;
	top:0;
	right: 0;
}

table {
	border-collapse: collapse;
	table-layout: fixed;
}

td, th {
	border: none;
}
</style>
</head>

<body>
	<header> </header>
	<div class=main-container>
			<h1>커뮤니티</h1>
			<h3>community</h3>
			<hr>
			<form action="updateBoard.do" method="post">
				<input name="seq" type="hidden" value="${board.idx}" />
				<table border="1">
					<tr>
						<td>카테고리 <!--선택가능하도록 변경-->
						</td>
						<td colspan="4">글제목 <c:out value="${comm_post.post_title}" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="4">
							닉네임 <c:out value="${comm_post.user_no}" /> |					
							날짜 <c:out value="${comm_post.regdate}" /> | 
							조회수 <c:out value="${comm_post.post_view}" />
						</td>
					</tr>
					<tr>
						<td>내용 <c:out value="${comm_post.post_content}" />
						</td>
					</tr>
				</table>
			</form>
			<br> <br>

			<button onclick="location.href='board_content_write.html'">게시물	수정</button>
			<button onclick="location.href=''">글삭제</button>
			<button onclick="location.href='board_list.html'">글목록</button>
			<br> <br> <br>
			<hr>
			<h5>댓글</h5>


			<!-- 댓글 부분 -->
			<div id="comment">
				<table border="1" bordercolor="lightgray">
					<!-- 댓글 목록 -->
					<c:if test="${requestScope.commentList != null}">
						<c:forEach var="comment" items="${requestScope.commentList}">

							<tr>
								<!-- 아이디, 작성날짜 -->
								<td width="150">
									<div>
										${comm.user_no}<br> <font size="2" color="lightgray">${comm.regdate}<font>
									</div>
								</td>
								<!-- 본문내용 -->
								<td width="550">
									<div class="text_wrapper">${comm.content}</div>
								</td>
								<!-- 버튼 -->
								<td width="100">
									<div id="btn" style="text-align: center;">
										<a href="#">[답변]</a><br>
										<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
										<c:if test="${comm.user_no == sessionScope.sessionID}">
											<a href="#">[수정]</a>
											<br>
											<a href="#">[삭제]</a>
										</c:if>
									</div>
								</td>
							</tr>

						</c:forEach>
					</c:if>

					<!-- 로그인 했을 경우만 댓글 작성가능 -->
					<c:if test="${sessionScope.sessionID !=null}">
						<tr bgcolor="#F5F5F5">
							<form id="writeCommentForm">
								<input type="hidden" name="comment_board"
									value="${board.board_num}"> <input type="hidden"
									name="comment_id" value="${sessionScope.sessionID}">
								<!-- 아이디-->
								<td width="150">
									<div>${sessionScope.sessionID}</div>
								</td>
								<!-- 본문 작성-->
								<td width="550">
									<div>
										<textarea name="content" rows="4" cols="70"></textarea>
									</div>
								</td>
								<!-- 댓글 등록 버튼 -->
								<td width="100">
									<div id="btn" style="text-align: center;">
										<p>
											<a href="#" onclick="writeCmt()">[댓글등록]</a>
										</p>
									</div>
								</td>
							</form>
						</tr>
					</c:if>

				</table>
			</div>
		</div>

</body>

</html>