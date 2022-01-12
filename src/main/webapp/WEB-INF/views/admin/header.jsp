<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style>
.admin-info {
	width: 100%;
	height: 100px;
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	justify-content: center;
	align-items: center;
	box-shadow: 0px 0px 2px gainsboro;
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	position: sticky !important;
}

.admin-info * {
	justify-self: center;
	align-self: center;
}

.admin-info *:hover {
	cursor: pointer;
}

.admin-info *:nth-child(2) {
	grid-column: 2/5;
}
</style>
</head>
<body>
	<div class="admin-info">
		<h1 id="web-main"
			onclick="window.location.href='${pageContext.request.contextPath}/main.do'">CareBank</h1>
		<h2 id="admin"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/main.do'">ADMIN
			PAGE</h2>
		<span id="logout"
			onclick="window.location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</span>
	</div>
</body>
</html>