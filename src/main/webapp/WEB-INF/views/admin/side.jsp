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
		<span
			onclick="window.location.href='${pageContext.request.contextPath}/admin/meal.do?page=1'">Meal</span><span
			id="food"
			onclick="window.location.href='${pageContext.request.contextPath}/admin/food.do?page=1'">Food</span>
		<span>Exercise</span> <span>Supplement</span> <span>Meditation</span>
		<!--메뉴 구분선-->
		<h4>User Management</h4>
		<span>Member</span> <span>Report</span>
		<!--메뉴 구분선-->
		<h4>Customer Service</h4>
		<span>Notice</span> <span>QnA</span> <span>FAQ</span>
	</div>
</body>
</html>