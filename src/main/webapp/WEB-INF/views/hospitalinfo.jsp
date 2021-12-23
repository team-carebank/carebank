<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<style>
.body-content, .comment-area {
	width: 100%;
}

.body-content a, .comment-area a, .menu-area a {
	text-decoration: none;
	color: black;
}

.body-content *:not(.content-right) {
	display: block;
	margin: 0;
	margin-block: 20px;
	margin-block-start: 0;
}

.body-content {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 20px;
	padding: 100px;
	padding-bottom: 0;
}

.comment-area {
	padding: 100px;
	padding-top: 0;
}

.menu-area a {
	font-size: large;
}

.menu-area a:hover, #clinicURL:hover {
	font-weight: bold;
	color: yellowgreen;
}

.content-left p {
	font-size: large;
}

.content-desc {
	font-size: x-large !important;
	width: 400px;
}

#clinicName {
	font-size: x-large;
	font-weight: bold;
}

#map div {
	display: block;
	margin-block: 0;
}

#map * {
	margin: 0;
	padding: 0;
	text-align: center;
}

#map a {
	display: inline-flex !important;
	margin-inline: 10px !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="body-content">
		<div class="content-left">
			<h1>이용하기</h1>
			<p class="content-desc">병원 정보를 안내할게요!</p>
			<hr>
			<div>
				<span id="clinicName">${dto.yadmNm }</span> <span id="clinicAddress">${dto.addr }</span>
				<c:if test="${dto.telno ne null }">
					<span id="clinicTEL">${dto.telno }</span>
				</c:if>
				<c:if test="${dto.hospUrl ne null }">
					<span><a href="${dto.hospUrl }" target="_blank"
						id="clinicURL">공식 홈페이지</a></span>
				</c:if>
			</div>
			<hr>
			<span class="menu-area"><a href="javascript: history.back();">목록으로
					돌아가기</a></span>
		</div>
		<div id="map" style="width: 480px; height: 320px;"
			class="content-right"></div>
	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85eca2941cd1705f2ee8d0fd738ffab7
&libraries=services"></script>
<script>
	var clinicName = document.getElementById("clinicName").innerHTML;
	var xPos = ${dto.xPos};
	var yPos = ${dto.yPos};

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(yPos, xPos), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(yPos, xPos);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var addr1 = 'https://map.kakao.com/link/map/' + clinicName + ',' + yPos
			+ ',' + xPos;
	var addr2 = 'https://map.kakao.com/link/to/' + clinicName + ',' + yPos
			+ ',' + xPos;

	var content = '<div style="padding:5px;">'
			+ clinicName
			+ '<br><a href="'+ addr1 +'" style="color:blue" target="_blank">큰지도보기</a><a href="'+ addr2 +'" style="color:blue" target="_blank">길찾기</a></div>';

	var iwPosition = new kakao.maps.LatLng(yPos, xPos); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : content
	});

	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
</script>
</html>