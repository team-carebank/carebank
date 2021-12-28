<html>

<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['day', 'bmi'],
        ['1201', 25,],
        ['1202', 25,],
        ['1205', 24,],
        ['1206', 29,]
      ]);

      var options = {
        title: 'bmi',
        curveType: 'function',
        legend: { position: 'bottom' }
      };

      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

      chart.draw(data, options);
    }
  </script>

  <style type="text/css">
    .wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .table{
      border: none; 

    }
    td,
    th {
      border-collapse: collapse;
      border: 1px solid black;
    }

    ;
  </style>
</head>

<body>
  <div class="wrapper">
    <div class="content">
      <h4>bmi</h4>
      <div id="curve_chart" style="width: 900px; height: 500px"></div>
      <!--차트와 테이블이 자동으로 연결될 수 있도록 추가로 설정해두기-->
      <table border="1" class="table">
        <!--테이블 css는 추후 수정하기-->
        <th>날짜</th>
        <th>bmi</th>
        <tr>
          <!-- 첫번째 줄 시작 -->
          <td>날짜 입력할 곳1</td>
          <td>bmi계산1</td>
        </tr><!-- 첫번째 줄 끝 -->
        <tr>
          <!-- 두번째 줄 시작 -->
          <td>날짜 입력할 곳2</td>
          <td>bmi계산2</td>
        </tr><!-- 두번째 줄 끝 -->
      </table>

    </div>

  </div>

</body>

</html>