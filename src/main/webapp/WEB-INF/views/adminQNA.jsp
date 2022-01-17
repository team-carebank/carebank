<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./css/style.css"> -->
 <style type ="text/css">
*{
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
}
html, body{
    margin: 0;
    padding: 0;
}
header, section, nav, article, main, aside, footer{
    display: block;
}
header:after, section:after, nav:after, article:after, main:after, aside:after, footer:after{
    content: "";
    display: block;
    clear: both;
}
h1,h2,h3,h4,h5,h6,p{
    margin: 0;
}
ul, ol, li{
    margin: 0;
    padding: 0;
    list-style: none;
}
a{
    text-decoration: none;
}
#paga{
    width: 100%;
}
#page .wrap{
    width: 80%;
    margin: 0 auto;
}
#page .wrap .top{
    width: 100%;
    margin-bottom: 20px;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
}
#page .wrap .top .title{
    width: calc(100% / 3);
    display: flex;
    justify-content: center;
    align-items: center;
}
#page .wrap .top .title h2{
    font-size: 30px;
}
#page .wrap .top .FAQ{
    width: calc(100% / 3);
}
#page .wrap .top .FAQ .FAQ_wrap > p{
    padding: 20px;
}
#page .wrap .top .FAQ .FAQ_wrap > p:nth-of-type(1){
    font-size: 20px;
    font-weight: bold;
}
#page .wrap .top .FAQ .FAQ_box{
    border: 1px solid #000;
    padding: 5px;
}
#page .wrap .top .FAQ .FAQ_box p{
    font-size: 14px;
    word-break: keep-all;
}
#page .wrap .top .btn_txt{
    width: calc(100% / 3);
    text-align: right;
}
#page .wrap .top .btn_txt p{
    display: inline-block;
    vertical-align: middle;
}
#page .wrap .top .btn_txt button{
    width: 30px;
    height: 30px;
    position: relative;
    border-radius: 5px;
}
#page .wrap .top .btn_txt button img{
    width: 15px;
    height: 15px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
table{
    margin-left : auto;
    margin-right : auto;
    text-align: center;
    border-collapse: collapse;
}
tr{
    border-bottom: 1px solid black;
}
#button{
    width: 400px;
    text-align: center;
    margin-left: 970px;
    padding-top: 50px;
}
#delete{
    background-color:dodgerblue;
    border: 0;
    outline : 0;
    color : white;
    font-size : 25px;
    width : 100px;
    border-radius: 10px;
    cursor: pointer;
}
    </style>
</head>
<body>
    <header>
		<%@include file="../../header.jsp"%>
	</header>
    <section id="page">
        <div class="wrap">
            <div class="top">
                <div class="FAQ">
                    <div class="FAQ_wrap">
                        <p>Q&A</p>
                        <div class="FAQ_box">
                            <p>궁금한 점을 남겨주시면 케어뱅크가 답해드립니다.<br>진행상태가 'N'이면 진행중이고 'Y'이면 답변완료</p>
                        </div>
                    </div>
                </div>
                <div class="title">
                    <h2>Q&A</h2>
                </div>
                <div class="btn_txt">
                    <input type="hidden">
                </div>
            </div>
        </div>
        <table>
            <colgroup>
                <col width="300px">
                <col width="300px">
                <col width="300px">
                <col width="300px">
            </colgroup>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>진행상태</th>
                <th>회원정보</th>
            </tr>
            <c:choose>
            	<c:when test="${empty list }">
            	<tr>
            		<td colspan="4" align="center"> ------------ 작성된 글이 없습니다.--------</td>
            	</tr>
            	</c:when>
            <c:otherwise>
           		<c:forEach items="${list }" var="list">
            		<tr>	
                		<td>${list.qa_no }</td>
                		<td><a href="adminupdateform.do?qa_no=${list.qa_no }">${list.title }</a></td>
                		<td>${list.status }</td>
                		<td>${list.user_type }</td>
            		</tr>
            	</c:forEach>
            </c:otherwise>
           	</c:choose>
        </table>
    </section>
    <footer></footer>
</body>
</html>