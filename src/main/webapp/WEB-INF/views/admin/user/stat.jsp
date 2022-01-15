<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.content-admin-side>#stat {
	background: linear-gradient(to right, #04AA6D, #05C480);
	color: white;
	box-shadow: -10px 0 0 white;
}

.admin-main-content {
	display: grid;
}
</style>
<c:set var="mcnt" value="0" />
<c:forEach var="item" items="${mymeal }">
	<c:set var="mcnt" value="${mcnt + item.cnt}" />
</c:forEach>
<c:set var="ecnt" value="0" />
<c:forEach var="item" items="${myexer }">
	<c:set var="mcnt" value="${ecnt + item.cnt}" />
</c:forEach>
<c:set var="vcnt" value="0" />
<c:forEach var="item" items="${myvisit }">
	<c:set var="vcnt" value="${vcnt + item.cnt}" />
</c:forEach>
<c:set var="pcnt" value="0" />
<c:forEach var="item" items="${mypills }">
	<c:set var="pcnt" value="${pcnt + item.cnt}" />
</c:forEach>
<c:set var="mccnt" value="0" />
<c:forEach var="item" items="${mcomment }">
	<c:set var="mccnt" value="${mccnt + item.cnt}" />
</c:forEach>
<c:set var="sccnt" value="0" />
<c:forEach var="item" items="${scomment }">
	<c:set var="sccnt" value="${sccnt + item.cnt}" />
</c:forEach>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 차트 불러오기 시작 -->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ '게시글 수', '값' ],
				[ '다이어리-식단 기록', ${mcnt}], 
				[ '다이어리-운동 기록', ${ecnt}],
				[ '다이어리-병원 방문 기록', ${vcnt}], 
				[ '다이어리-영양제 복용 여부 기록', ${pcnt}], 
				[ '댓글-식단 정보', ${mccnt}], 
				['댓글-영양제 정보', ${sccnt}]
			]);

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, {});
		
		google.visualization.events.addListener(chart, 'select', function() {
			let selected = chart.getSelection();
			let selected_chart;
			switch(selected[0].row){
			case 0:
				selected_chart = "#mymeal-chart";
				break;
			case 1:
				selected_chart = "#myexer-chart";				
				break;
			case 2:
				selected_chart = "#myvisit-chart";				
				break;
			case 3:				
				selected_chart = "#mypills-chart";				
				break;
			case 4:				
				selected_chart = "#mcomment-chart";				
				break;
			case 5:				
				selected_chart = "#scomment-chart";				
				break;
			}
			var location = document.querySelector(selected_chart).offsetTop;
			window.scrollTo({top:location, behavior:'smooth'});
		});
	}
</script>
<!-- 활동 이력이 있는 경우에만 표시 -->
<c:if test="${not empty mymeal }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${mymeal}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '다이어리-식단 기록',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '다이어리-식단 기록',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '기록량'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('mymeal-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<c:if test="${not empty myexer }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${myexer}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '다이어리-운동 기록',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '다이어리-운동 기록',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '기록량'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('myexer-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<c:if test="${not empty myvisit }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${myvisit}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '다이어리-병원 방문 기록',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '다이어리-병원 방문 기록',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '기록량'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('myvisit-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<c:if test="${not empty mypills }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${mypills}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '다이어리-영양제/약 복용 여부 기록',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '다이어리-영양제/약 복용 여부 기록',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '기록량'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('mypills-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<c:if test="${not empty mcomment }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${mcomment}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '댓글-식단 정보',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '댓글-식단 정보',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '댓글수'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('mcomment-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<c:if test="${not empty scomment }">
	<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
        	['', ''],
     <c:forEach var="item" items="${scomment}" varStatus="status">
  		<c:choose>
  			<c:when test="${status.last}">
  			["${item.user_name }(${item.user_id })", ${item.cnt}]
  			</c:when>
  			<c:otherwise>
  			["${item.user_name }(${item.user_id })", ${item.cnt}],
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
        ]);

        var options = {
          title: '댓글-영양제 정보',
          width: 450,
          legend: { position: 'none' },
          chart: { title: '댓글-영양제 정보',
                   subtitle: '활동이 가장 많았던 회원을 최대 5명 표시합니다.' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '댓글수'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('scomment-chart'));
        chart.draw(data, options);
      };
    </script>
</c:if>
<!-- 차트 불러오기 끝 -->
<style type="text/css">
.content-items {
	margin-block-end: 10px;
}

#sub.content-items {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 10px;
	margin-block: 20px;
}
</style>
</head>
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="body-content">
			<%@ include file="../side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>Management : Statistics</h1>
					<span>일주일간 웹사이트 활동 통계를 확인할 수 있습니다!</span>
				</div>
				<div class="admin-main-content">
					<div class="content-items" id="main">
						<h3>일주일간 활동이 가장 많은 기능입니다.</h3>
						<div class="content-item">
							<div id="piechart" style="width: 900px; height: 500px;"></div>
						</div>
					</div>
					<div class="content-items" id="sub">
						<h3>기능별로 활동이 많았던 회원을 확인합니다.</h3>
						<br>
						<c:if test="${not empty mymeal }">
							<div class="content-item">
								<div id="mymeal-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
						<c:if test="${not empty myexer }">
							<div class="content-item">
								<div id="myexer-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
						<c:if test="${not empty myvisit }">
							<div class="content-item">
								<div id="myvisit-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
						<c:if test="${not empty mypills }">
							<div class="content-item">
								<div id="mypills-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
						<c:if test="${not empty mcomment }">
							<div class="content-item">
								<div id="mcomment-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
						<c:if test="${not empty scomment }">
							<div class="content-item">
								<div id="scomment-chart" style="width: 450px; height: 250px;"></div>
							</div>
						</c:if>
					</div>
				</div>
				<span>* 활동 이력이 없는 경우 차트에 표시되지 않습니다.</span>
			</div>
		</div>
	</div>
</body>
</html>