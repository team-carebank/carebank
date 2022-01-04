<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
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
			margin-left: 20%;
			width: 60%;
        }

        td,
        th {
            border: none;
        }
        .notice_write{
            margin-left: 50%;
        }
    </style>

</head>

<body>

    <div class="wrapper">
        <div class="content">
            <div class="col-lg-8">
                <!--게시판 넓이 -->
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항</h1>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-12">
                        <button type="button" class="notice_write"
                            onclick="location.href='notice_content_write.html'">
                            <i class="fa fa-edit fa-fw"></i>
                            작성</a>
                        </button>
                    </div>
                </div>
                <br><br>
                <div class="panel panel-default">
                    <div class="panel-heading"> </div>
                    <div class="panel-body">
                        <table class="table ">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>첨부</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        1
                                        <c:out value="${notice.notice_no}" />

                                    </td>
                                    <td>
                                        제목
                                        <c:out value="${notice.notice_title}" />

                                    </td>
                                    <td>
                                        첨부파일
                                        <c:out value="${notice.notice_file}" />
                                    </td>
                                    <td>작성일
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}" />
                                    </td>
                                    <td>
                                        조회수 구현
                                        <c:out value="${notice.notice_view}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>