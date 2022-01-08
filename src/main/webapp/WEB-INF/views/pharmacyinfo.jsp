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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/infodetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hosdetail.css" />
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<%@ include file="../../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<div class="content-left">
				<p class="content-desc">약국 정보를 안내할게요!</p>
				<hr>
				<div>
					<span id="clinicName">${dto.yadmNm }</span> <span
						id="clinicAddress">${dto.addr }</span>
					<c:if test="${dto.telno ne null }">
						<span id="clinicTEL">${dto.telno }</span>
					</c:if>
					<c:if test="${dto.hospUrl ne null }">
						<span><a href="${dto.hospUrl }" target="_blank"
							id="clinicURL">공식 홈페이지</a></span>
					</c:if>
				</div>
				<hr>
				<span class="menu-area"><a href="javascript: history.back();">목록으로 돌아가기</a></span>
			</div>
			<div class="content-right">
				<div id="map" style="width: 800px; height: 600px;"></div>
			</div>
		</div>
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