<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css"
	rel="stylesheet" />
<title>마이페이지 다이어리</title>
<style type="text/css">
html, body {
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

html::-webkit-scrollbar {
    width: 0px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

.add-button, .adds-button{
    direction: ltr;
    box-sizing: border-box;
    font-weight: 400;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    text-transform: none;
    margin: 0;
    border: 1px solid transparent;
    padding: .4em .65em;
    font-size: 1em;
    line-height: 1.5;
    border-radius: .25em;
    color: var(--fc-button-text-color,#fff);
    background-color: var(--fc-button-bg-color,#2C3E50);
    border-color: var(--fc-button-border-color,#2C3E50);
    cursor: pointer;
    position: relative;
    flex: 1 1 auto;
}

.add-button:hover, .adds-button:hover{
	background-color: var(--fc-button-active-bg-color,#1a252f);
}

.calendar-button{
	margin-top: 10px;
}
</style>
<script type="text/javascript">
function getOption(w, h){
	//팝업이 화면의 중앙에 오게 설정
	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;

	return "width="+w+", height="+h+", left="+left+", top="+top+", location=no, resizable=no";
}

$(document).on("click", ".add-button#my_meal", function(e){
	var w = 600;
	var h = 600;
	
	var option = getOption(w, h);

	var url = "mealPopup.do";
	var name = "mealPopup";
	window.open(url, name, option);
});

function click_add(){
	var url = "schedulePopup.do";
	var name = "schedulePopup";
	var option = "width=600, height=600, left=200, top=50, location=no";
	window.open(url,name,option)
};
function click_adds(){
	var url = "moodPopup.do";
	var name = "moodPopup";
	var option = "width=400, height=400, left=200, top=50, location=no";
	window.open(url,name,option)
};
	(function(){
		$(function(){
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
				
				eventSources : [
					{ events : [
					<c:forEach var="item" items="${dto}">
					{
						title : '${item.hospital_name}',
						start : '<fmt:formatDate value="${item.resdate }" type="both" pattern="yyyy-MM-dd"/>',
						url : 'schedule.do?hospital_no=${item.hospital_no}',
					},
					</c:forEach>
					{}
					]}
				],
				height: '600px', // calendar 높이 설정
				expandRows: true, // 화면에 맞게 높이 재설정
				slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
			// 해더에 표시할 툴바
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
				initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable: true, // 수정 가능?
				nowIndicator: true, // 현재 시간 마크
				dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale: 'ko', // 한국어 설정
						});
					// 캘린더 랜더링
						calendar.render();
					});
					})();
</script>
</head>
<body>

<header>
<%@include file = "../../header.jsp" %>
</header>
	<!-- calendar 태그 -->
	<div  style="padding: 30px;">
	<div id='calendar-container'>
		<div id='calendar'></div>
			<div class="calendar-button">
				<button class="add-button" type="button" onclick="click_add();">병원
					기록</button>
				<button class="adds-button" type="button" onclick="click_adds();">기분
					상태</button>
				<button class="add-button" type="button" id="my_meal">식단 기록</button>
			</div>
		</div>
	</div>
</body>
</html>