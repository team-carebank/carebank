<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.menu_subtitle:hover {
	background-color: #287743;
	color: white;
}

.sub_title {
	font-weight: bold;
	text-align: left;
}

.content-admin-side {
	min-width: 300px;
	height: 105vh;
	min-height: 1000px;
	box-shadow: 0px 10px 10px gainsboro;
}

.content-admin-side, .content-admin-side div {
	justify-self: stretch;
}

.content-admin-side div * {
	display: block;
	padding-block: 20px;
	padding-left: 20px;
	border-bottom: 1px solid gainsboro;
}

.content-admin-side div span:hover {
	cursor: pointer;
}

h3 {
    text-align: center;
    margin-top: 20px;
    color: rgb(109, 107, 104);
}
</style>
</head>

<body>
	<div class="content-admin-side">
		<div>
			<h3>마이페이지</h3>
			<!--메뉴 구분선-->
			<h4>Information</h4>
			<span class="menu_subtitle" id="myinfo"
				onclick="location.href='${pageContext.request.contextPath}/myinfo.do'">내
				정보</span> <span class="menu_subtitle" id="dashboard"
				onclick="location.href='${pageContext.request.contextPath}/dashboard.do'">대시보드</span>
			<!--메뉴 구분선-->
			<h4></h4>


			<!--메뉴 구분선-->
			<h3>고객센터</h3>
			<span class="menu_subtitle" onclick="location.href='${pageContext.request.contextPath}/qna.do'">QnA</span> <span class="menu_subtitle"
				onclick="location.href='${pageContext.request.contextPath}/faqlist.do'">FAQ</span>
		</div>
	</div>
</body>
</html>