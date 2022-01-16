<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
  <script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 

body{
    margin:0;
    font-family: 'Noto Sans KR', sans-serif !important; 
}
.dashcontainer{ 
display:flex;
margin-top:40px;
margin-left:25vw;
height:100vh;
width: 70vw; 
flex-wrap: wrap;
padding:20px;
justify-content: space-around;
border-radius: 14px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  6px 6px 12px #d9d9d9,
             -6px -6px 12px #ffffff;
}
#nutrient{ 
height:25vh;
width:30vw; 
padding: 20px;
}
#mindfulnesscontainer{
margin-top:30px;
margin-bottom: 20px;
border-radius: 14px; 
box-shadow:  6px 6px 12px #d9d9d9,
-6px -6px 12px #ffffff;
}
#mindfulness{
height:25vh;
width:30vw; 
padding: 15px;
left:3vw;
position:relative;
}
#nutrientcontainer{
margin-top:30px;
margin-bottom: 20px;
border-radius: 14px; 
box-shadow:  6px 6px 12px #d9d9d9,
-6px -6px 12px #ffffff;
}
#dash{ 
height:25vh;
width:30vw; 
padding: 15px;
}
#dashcontainer{
margin-top:30px;
margin-bottom: 20px;
border-radius: 14px; 
box-shadow:  6px 6px 12px #d9d9d9,
             -6px -6px 12px #ffffff;
} 
#exercise{
height:25vh;
width:30vw; 
padding: 15px;
}
#exercisecontainer{
margin-top:30px;
margin-bottom: 20px;
border-radius: 14px; 
box-shadow:  6px 6px 12px #d9d9d9,
             -6px -6px 12px #ffffff;
}

h3{
text-align: center;
margin-top: 20px;
color:rgb(109, 107, 104);
}
p{
text-align:center;
font-size:10px;
margin-top:5px;
}
#kcalinfo{
margin-left:40px;
}
 .container {
            width: 100%;
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: auto;
            justify-content: center;
            justify-content: center;
            /*z-index:1;*/
            position:absolute;
        }
        .body-content {
            width: 100%;
            display: grid;
            grid-gap: 0;
            grid-template-columns: repeat(5, 1fr);
            justify-items: center;
            place-content: center;
        }

        .content-admin-side {
            min-width: 300px;
            height: 105vh;
            min-height: 1000px;
            box-shadow: 0px 10px 10px gainsboro;
        }

        .content-admin-side,
        .content-admin-side div {
            justify-self: stretch;
        }

        .content-admin-side div * {
            display: block;
            padding-block: 20px;
            padding-left: 20px;
            border-bottom: 1px solid gainsboro;
        }

        .content-admin-side div span:hover {
            cursor: pointer;
        }

</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
  
      function drawChart() {
var data = google.visualization.arrayToDataTable([

	  ['Nutritions', 'per Weeks']
	  <c:set var="carbo" value="0"></c:set>
	  <c:forEach items="${tmmeal }" var="TmMealDto">
	  	<c:set var="carbo" value="${carbo + TmMealDto.carbo}"></c:set>
	  </c:forEach>, 
	  ['탄수화물',${carbo}]
	  
	  <c:set var="protein" value="0"></c:set>
	  <c:forEach items="${tmmeal }" var="TmMealDto">
	  	<c:set var="protein" value="${protein+TmMealDto.protein}"></c:set>
	  </c:forEach>, 
	  ['단백질',${protein}]
	  
	  
	  <c:set var="fat" value="0"></c:set>
	  <c:forEach items="${tmmeal }" var="TmMealDto">
	  	<c:set var="fat" value="${fat+TmMealDto.fat}"></c:set>
	  </c:forEach>, 
	  ['지방',${fat}]
	  
]);

var options = {
  //title: 'My Weekly',
  is3D:true,
  colors: ['#064635', '#F0BB62', '#F4EEA9'],
  backgroundColor: {  fill:'transparent'  }, 
};

var chart = new google.visualization.PieChart(document.getElementById('nutrient'));
chart.draw(data, options);}
</script>


 
<script type="text/javascript">
 
    google.charts.load('current', { 'packages': ['corechart'] });
     google.charts.setOnLoadCallback(drawChart);
     
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['', 'times', { role: 'style' }],
    ['',1, '#ffffff'],
    <c:forEach items="${mydtooo }" var="MyExerciseDto" begin="0" end="6">
    ['${MyExerciseDto.regdate}','${MyExerciseDto.exer_count}','#F4EEA9'],
    </c:forEach>
  ]);

  var options = {
          legend: 'none'
         };
  var chart = new google.visualization.BarChart(
    document.getElementById('exercise')
  );
  chart.draw(data, { backgroundColor: {  fill:'transparent'  } })} 
  </script>
  
  
  
  
  <script>
  	 
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    let chartData = [  
    	//['2022-01-12',1000],
     <c:forEach items="${mydtooo }" var="MyExerciseDto">
     ['${MyExerciseDto.regdate}',1000],
     </c:forEach>
    	  
    ];

    let chartConfig = {
      type: 'calendar',
      backgroundColor:'none',
      plotarea:{
    	  backgroundColor:'transparent'
      },
      options: {
        values: chartData,
        startMonth: 1, 
        endMonth: 1, 
        month: {
          values: [null, null, null, null, null, null, null, null, null, null, null, null]
        },
        palette: ['negativeColor', 'orange'],
        weekday: {
          values: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
          item: {
            fontColor: '#00344d',
            fontSize: '10px'
          }
        },
        year: {
          text: '2022',
          visible: false
        }
      },
      
      }
     

    zingchart.loadModules('calendar', function() {
      zingchart.render({
        id: 'mindfulness',
        data: chartConfig,
        height: '100%',
        width: '80%',
      });
    });
  </script>


</head>


<body>

<header>
<%@include file = "../../header.jsp" %>
</header> 
     <div class="container">
     
        <div class="body-content">
            <div class="content-admin-side">
                <div>
                    <h3>마이페이지</h3>
                    <!--메뉴 구분선-->
                    <h4>Information</h4>
                    <span>내 정보</span>
                    <span>관심사 </span>
                    <span>대시보드</span>
                    <!--메뉴 구분선-->
                    <h4></h4>
                  
                  
                    <!--메뉴 구분선-->
                    <h4>Customer Service</h4>
                    <span>공지사항</span>
                    <span>QnA</span>
                    <span>FAQ</span>
                </div>
            </div>
           
        </div>
    </div>
     
<div class="dashcontainer">
	
	<div id="nutrientcontainer"> 
           <h3>nutrients</h3>
        <p>이번주 섭취한 영양정보</p>
		<div id="nutrient">
        </div>
	</div> 
	
    <div id="dashcontainer">
        <h3></h3>
	<div id="dash">
        <h4 style="padding: 40px;margin-top:30px;margin-left:60px;color:rgb(109, 107, 104);font-size:20px;">${login_info.user_name }님의 Dashboard</h4>
        <span id="kcalinfo" style="margin-left:80px;"> 이번주 총
       
        <c:set var="calories" value="0"></c:set>
	  <c:forEach items="${tmmeal }" var="TmMealDto">
	  	<c:set var="calories" value="${calories + TmMealDto.calories}"></c:set>
	  </c:forEach>
	${calories}kcal를 섭취했어요</span> 

        </div>
	</div>
	
    <div id="mindfulnesscontainer">
        <h3>workout montly</h3>
        <p>꾸준한 운동습관 형성</p>
		<div id="mindfulness">
        </div>
	</div>
	
    <div id="exercisecontainer">
        <h3>exercise</h3>
        <p>일주일간 누적된 운동 횟수</p>
    <div id="exercise"> 
        </div>
    </div> 
</div>
<br><br><br>

</body>
</html>