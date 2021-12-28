<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <style type="text/css">
        .wrapper {
			justify-content: center;
			align-items: center;
		}

        table {
            width:100px; 
            margin: auto;
        }

        td,
        th {
            border: none;
        }
    </style>

</head>


<body>

    <div class="wrapper">
        <div class="content">
            <div class="col-lg-8">
                <!--게시판 넓이 -->
                <div class="col-lg-12">
                    <h1 class="page-header">커뮤니티</h1>
                </div>
                <div class="row">
                    <div class="col-lg-12">

                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>community</h3>
                    </div>
                    <br>
                    <div class="panel-body">
                        <div>
                            <select>
                                <option>자유</option>
                            </select>

                        </div>

                        <br>

                        <button type="button" class="btn btn-sm btn-primary" id="btnWriteForm"
                            onclick="location.href='board_content_write.html'">
                            글쓰기
                        </button>
                        <table border="1" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>
                                    <td colspan="4">
                                        카테고리 :
                                        <c:out value="${comm_post.subcat_id}" />
                                        |
                                        게시글제목
                                        <c:out value="${comm_post.post_title}" />
                                        |
                                        사진
                                        <!--있으면 적용하고 없으면 x하게 구현하기-->
                                        <c:out value="${comm_post.post_file}" />

                                    </td>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        글번호
                                        <c:out value="${comm_post.post_no}" />

                                    </td>
                                    <td colspan="2" rowspan="2">
                                        <span>카테고리
                                            <c:out value="${comm_post.subcat_id}" />

                                        </span>
                                        <br>
                                        <img src=".jpg" />
                                        <br>
                                    </td>
                                    <td colspan="2"rowspan="2">
                                        <div>
                                            <div>
                                                <a href="board_content_view.html">
                                                    글제목
                                                    <c:out value="${comm_post.post_title}" />
                                                </a>
                                                <br>

                                                <span>닉네임
                                                    <c:out value="${comm_post.user_no}" />

                                                </span> |
                                                <span>날짜
                                                    <c:out value="${comm_post.regdate}" />

                                                </span>|
                                                <span>조회 :
                                                    <c:out value="${comm_post.post_title}" />
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td rowspan="2">
                                        댓글개수
                                    </td>
                                </tr>
                            </tbody>
                        </table>


                        <!-- 페이징 처리 영역 
                        <%  if(pageNumber != 1){
                         %>
                            <a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
                              class="btn btn-success btn-arraw-left">이전</a>
                            <%
                         }if(bbsDAO.nextPage(pageNumber + 1)){
                        %>
                        <a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
                            class="btn btn-success btn-arraw-left">다음</a>
                           <%
                         }
                        %>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>