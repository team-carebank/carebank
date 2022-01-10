<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .wrapper{
  display: flex;
  justify-content: center;
  align-items: center;
 }
 #columnchart_health{
  align-items: center;
  width: 800px; 
  height: 500px;

 }
</style>
</head>
    <!--AJAX API 호출-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

    // 사용할 차트 종류를 선택합니다. 여기서는 파이차트를 선택했습니다.
      google.charts.load('current', {'packages':['bar']});


    // 구글의 비쥬얼 API가 실행이 끝났을 때 로컬에서 불려지는 콜백함수의 설정
    google.charts.setOnLoadCallback(drawChart);
     
      // 콜백함수 정의 
      function drawChart() {
        var data = google.visualization.arrayToDataTable([ 
          ['날짜', '유산소', '무산소', '요가'], 
          ['1201', 1, 1, 2],//이 내용들을 db에서 가져와서 변경되도록사용할 것
          ['1205', 6, 2, 3],
          ['1206', 3, 0, 3]
        ]);

        // 차트의 옵션을 정의합니다.
        var options = {
          chart: {
          }
        };
       
        // 차트 실행
        var chart = new google.charts.Bar(document.getElementById('columnchart_health'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>


<header>


</header>
<body>
  

    <div class="wrapper">
      <div class="content">
        <span> Dash Board </span>
        <br>
        <br>
            <h4>운동</h4>
            <br>
            <div id="columnchart_health" ></div>   <!--차트가 그려지는 영역입니다.-->
        
        </div>
    </div>

</body>

<footer>  </footer>
</html>