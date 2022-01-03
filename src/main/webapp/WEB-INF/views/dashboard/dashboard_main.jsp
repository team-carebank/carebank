<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Bootstrap JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./resources/css/my-basic.css" />


</head>
<!--AJAX API 호출-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!--nutrient의 차트데이터-->
<script type="text/javascript">
	// 사용할 차트 종류를 선택합니다. 여기서는 파이차트를 선택했습니다.
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	// 구글의 비쥬얼 API가 실행이 끝났을 때 로컬에서 불려지는 콜백함수의 설정
	google.charts.setOnLoadCallback(drawChart);

	// 콜백함수 정의
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'day', '단백질', '탄수화물', '지방', '철분', '비타민' ],
				[ '1201', 1000, 400, 200, 200, 200 ],
				[ '1202', 1170, 460, 250, 200, 200 ],
				[ '1205', 660, 1120, 300, 200, 200 ],
				[ '1206', 1030, 540, 350, 200, 200 ] ]);

		// 차트의 옵션을 정의합니다.
		var options = {
			chart : {}
		};

		// 차트 실행
		var chart = new google.charts.Bar(document
				.getElementById('columnchart_nutrient'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>

<!--bmi의 차트데이터-->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ 'day', 'bmi' ],
				[ '1201', 25, ], [ '1202', 25, ], [ '1205', 24, ],
				[ '1206', 29, ] ]);

		var options = {
			title : 'bmi',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_bmi'));

		chart.draw(data, options);
	}
</script>

<!--health의 차트데이터-->
<script type="text/javascript">
	// 사용할 차트 종류를 선택합니다. 여기서는 파이차트를 선택했습니다.
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	// 구글의 비쥬얼 API가 실행이 끝났을 때 로컬에서 불려지는 콜백함수의 설정
	google.charts.setOnLoadCallback(drawChart);

	// 콜백함수 정의 
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '유산소', '무산소', '요가' ], [ '1201', 1, 1, 2 ],//이 내용들을 db에서 가져와서 변경되도록사용할 것
				[ '1205', 6, 2, 3 ], [ '1206', 3, 0, 3 ] ]);

		// 차트의 옵션을 정의합니다.
		var options = {
			chart : {}
		};

		// 차트 실행
		var chart = new google.charts.Bar(document
				.getElementById('columnchart_health'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>


<style type="text/css">
.wrapper {
	display: center;
	justify-content: center;
	align-items: center;
	width: 100%;
}

#h1 {
	display: flex;
	justify-content: center;
	font-size: 32pt;
}

#bmi {
	display: flex;
}
</style>

<header> </header>

<body>

	<div class="wrapper">
		<div class="main-container">
		<%@ include file="/WEB-INF/views/dashboard/include/left-menu.jsp" %>
		</div>
		<div class="content">
			<span id="h1"> Dash Board </span> <br> <br>
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<div class="bmi">
							<span> <a href="dashboard_bmi.html" id="bmi"> bmi </a>
							</span>
							<div id="curve_chart_bmi"></div>
						</div>
					</div>
					<div class=" col-sm-6">
						<div class="mind">
							<span> <a href="dashboard_mind.html"> 마음건강 </a>
							</span> <br> <br> <img src="" /> <span>이번주는 ___ 가
								가득하네요~</span>
						</div>
					</div>
				</div>
				<br> <br> <br>


				<div class="row">
					<div class="col-sm-6">
						<div class="nutrient">
							<span> <a href="dashboard_nutrient.html">영양소</a>
							</span>
							<div id="columnchart_nutrient"></div>
							<!--차트가 그려지는 영역입니다.-->
						</div>
					</div>


					<div class=" col-sm-6">
						<div class="heath">
							<span> <a href="dashboard_ health.html">운동</a>
							</span>
							<div id="columnchart_health"></div>
							<!--차트가 그려지는 영역입니다.-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<footer> </footer>

</html>