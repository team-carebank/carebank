<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// Log Out
	$(document).on("click", "#logout", function(e) {
		window.location.href = "${pageContext.request.contextPath }/logout.do";
	})

	// Admin Main
	$(document).on("click", "#admin", function(e) {
		window.location.herf = "${pageContext.request.contextPath }/admin/main.do";
	})

	// CareBank Main
	$(document).on("click", "#web-main", function(e) {
		window.location.href = "${pageContext.request.contextPath }/main.do";
	})
</script>
<style>
	.admin-info *:nth-child(2){
		grid-column: 2/5;
	}
</style>
</head>
<body>
	<div class="admin-info">
		<h1 id="web-main">CareBank</h1>
		<h2 id="admin">ADMIN PAGE</h2>
		<span id="logout">로그아웃</span>
	</div>
</body>
</html>