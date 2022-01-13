<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 

body{
    margin:0;
    font-family: 'Noto Sans KR', sans-serif !important; 
}
.dashcontainer{ 
display:flex;
margin-top:40px;
margin-left:270px;
height:90vh;
width: 70vw; 
flex-wrap: wrap;
padding:20px;
justify-content: space-around;
border-radius: 14px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  6px 6px 12px #d9d9d9,
             -6px -6px 12px #ffffff;
}
#mindfulness{ 
height:25vh;
width:30vw; 
padding: 20px;
}
#mindcontainer{
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
#nutrient{ 
height:25vh;
width:30vw; 
padding: 15px;
}
#nutrientcontainer{
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
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
  
      function drawChart() {
var data = google.visualization.arrayToDataTable([
  ['Nutritions', 'per Weeks'],
  ['탄수화물',     300],
  ['지방',      200],
  ['단백질',  59],
  ['철분', 39]
]);

var options = {
  //title: 'My Weekly',
  is3D:true,
  colors: ['#064635', '#F0BB62', '#F4EEA9', '#519259'],
  backgroundColor: {  fill:'transparent'  }, 
};

var chart = new google.visualization.PieChart(document.getElementById('nutrient'));
chart.draw(data, options);}
</script>



<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
  
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['week', '기쁨', '슬픔'],
          ['1주',  5,      2],
          ['2주',  3,      3],
          ['3주',  8,       1],
          ['4주',  3,      5]
        ]);
        var options = {
          //legend: 'none',
          series: {
            0: { color: '#FF6363' },
            1: { color: '#0C1E7F' }
        },
        backgroundColor: {  fill:'transparent'  }
    };
        var chart = new google.visualization.LineChart(document.getElementById('mindfulness'));
        chart.draw(data,options)
      }
    </script>


 
<script type="text/javascript">
 
    google.charts.load('current', { 'packages': ['corechart'] });
     google.charts.setOnLoadCallback(drawChart);
     
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['', 'times', { role: 'style' }],
    ['',14, '#F0BB62'],
    <c:forEach items="${mydtooo }" var="MyExerciseDto" begin="0" end="6">
    ['${MyExerciseDto.regdate}','${MyExerciseDto.exer_count}','#F0BB62'],
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


</head>


<body>

<header>
<%@include file = "../../header.jsp" %>
</header>

<div> 
</div>
<div class="dashcontainer">
	<div id="mindcontainer">
        <h3>mindfulness</h3>
        <p>등록된 mood로 기분 변화 체크하기</p>
        <div id="mindfulness">
        </div>
	</div> 
	
    <div id="dashcontainer">
        <h3></h3>
	<div id="dash">
        <h4 style="padding: 40px;margin-top:30px;margin-left:90px;color:rgb(109, 107, 104);font-size:20px;">${login_info.user_name }님의 Dashboard</h4>
        </div>
	</div>
	
    <div id="nutrientcontainer">
        <h3>nutrient</h3>
        <p>일주일간 섭취한 영양정보</p>
	<div id="nutrient">
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