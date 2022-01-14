<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="false" %>


<div class="left-menu-container">
	
	<div class="menu-div">
		<nav class="nav-btn <c:if test="${menu eq 'home' }">active</c:if>" data-page="home">
			<div style="width:35px;">
				<i class="fas fa-user"></i>
			</div>
		<span>MAIN</span>
	</nav>
	
	<nav class="nav-btn <c:if test="${menu eq 'bmi'}">active</c:if>" data-page="jstest">
		<div style="width:35px;">
			<i class="fas fa-file-code"></i>
		</div>
		<span>BMI</span>
	</nav>
	
	<nav class="nav-btn <c:if test="${menu eq 'health'}">active</c:if>" data-page="product">
		<div style="width:35px;">
			<i class="fas fa-cart-plus"></i>
		</div>
		<span>health</span>
	</nav>
	
	<nav class="nav-btn <c:if test="${menu eq 'Mind'}">active</c:if>" data-page="service">
		<div style="width:35px;">
			<i class="fas fa-phone-alt"></i>
		</div>
		<span>Mind</span>
	</nav>
	
	<nav class="nav-btn <c:if test="${menu eq 'Nutrient'}">active</c:if>" data-page="service">
		<div style="width:35px;">
			<i class="fas fa-phone-alt"></i>
		</div>
		<span>Nutrient</span>
	</nav>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="./resources/js/left-menu.js"></script>
