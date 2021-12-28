<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시물 뷰</title>
	<style type="text/css">
		.wrapper {
			display: flex;
			align-items: center;
			text-align: center;

		}

		.table {
			border-collapse: collapse;
			text-align: center;
			table-layout: fixed;
			margin-left: 30%;
			width: 40%;
		}
	</style>
</head>

<body>

	<div class="wrapper">
		<div class="content">
			<h1>공지사항</h1>
			<h3>notice</h3>
			<hr>
			<form action="updateBoard.do" method="post">
				<input name="seq" type="hidden" value="${board.idx}" />
				<table border="1" class="table">
					<tr>
						<td colspan="4">제목
							<c:out value="${notice.notice_title}" />
						</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>
							<c:out value="${notice.regdate}" />
						</td>
						<td>조회수</td>
						<td>
							<c:out value="${notice.notice_view}" />
						</td>
					</tr>
					<tr>
						<td colspan="4" class="view_content">
							
							<c:out value="${notice.notice_content}" />
							<br><br><br><br>
						</td>
					</tr>
					<tr>
						<td>첨부</td>
						<td colspan="3">
							파일이름 

							|
							첨부파일 구현자리
							<c:out value="${notice.notice_file}" />

						</td>
					</tr>
				</table>
			</form>
			<br>
			<br>

			<button onclick="location.href='notice_content_write.html'">게시물 수정 </button>
			<button onclick="location.href=''">글삭제 </button>
			<button onclick="location.href='notice_list.html'">글목록 </button>
			<br>
			<br>
			<br>
			<hr>
			<c:if test="${dto.prevNum ne 0 }">
				<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
			</c:if>

			<c:if test="${dto.nextNum ne 0 }">
				<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
			</c:if>





		</div>

	</div>





</body>

</html>