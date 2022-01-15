<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content-admin-side>*:not(h3):not(h4) {
	transition: 0.4s;
}

.content-admin-side>*:not(h3):not(h4):hover {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
}
</style>
</head>
<body>
	<div class="content-admin-side">
		<h3>Administration</h3>
		<!--메뉴 구분선-->
		<h4>Information</h4>
		<span id="meal"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/meal.do?page=1'">Meal</span><span
			id="food"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/food.do?page=1'">Food</span>
		<span id="exer"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/exer.do?page=1'">Exercise</span>
		<span id="supple"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/supple.do?page=1'">Supplement</span>
		<span id="medi"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/medi.do?page=1'">Meditation</span>
		<!--메뉴 구분선-->
		<h4>User Management</h4>
		<span id="user"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/user.do?page=1'">Member</span>
		<span id="stat"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/ustat.do?page=1'">Statistics</span>
		<!--메뉴 구분선-->
		<h4>Customer Service</h4>
		<span
			onclick="window.location.href='${pageContext.request.contextPath}/faqlist.do'">QnA</span>
		<span
			onclick="window.location.href='${pageContext.request.contextPath}/faqlist.do'">FAQ</span>
	</div>
</body>
</html>