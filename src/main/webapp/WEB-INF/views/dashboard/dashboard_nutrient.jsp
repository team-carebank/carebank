<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<!--AJAX API 호출-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

  // 사용할 차트 종류를 선택합니다. 여기서는 파이차트를 선택했습니다.
  google.charts.load('current', { 'packages': ['bar'] });


  // 구글의 비쥬얼 API가 실행이 끝났을 때 로컬에서 불려지는 콜백함수의 설정
  google.charts.setOnLoadCallback(drawChart);

  // 콜백함수 정의
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['day', '단백질', '탄수화물', '지방', '철분', '비타민'],
      ['1201', 1000, 400, 200, 200, 200],
      ['1202', 1170, 460, 250, 200, 200],
      ['1205', 660, 1120, 300, 200, 200],
      ['1206', 1030, 540, 350, 200, 200]
    ]);

    // 차트의 옵션을 정의합니다.
    var options = {
      chart: {
      }
    };

    // 차트 실행
    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
  }

</script>
<style>
  .table {
    float: left;

  }

  div {
    text-align: center;
  }

  .info {
    float: center;
  }

  .wrapper {
    display: center;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin-left: 30%;
  }

  .titl {
    text-align: center;
    width: 50%;
  }
  table{
    border: none;
    width: 25%;
  }
</style>
<header>


</header>
<body>
  <div class="wrapper">
    <div class="content">
      <div class="container">
        <span id="titl">영양소</span>
        <div class="row">
          <div class="col-md-2">
            <div class="info" id="columnchart_material" style="width: 800px; height: 500px;"></div>
            <!--차트가 그려지는 영역입니다.-->
          </div>
          <br><br>
          <div class="col-md-2">
            <div class="table">
              <table border="1">
                <!--테이블 css는 추후 수정하기-->
                <th>날짜</th>
                <th>단백질</th>
                <th>탄수화물</th>
                <th>지방</th>
                <th>철분</th>
                <th>비타민</th>
                <tr>
                  <!-- 첫번째 줄 시작 -->
                  <td>날짜 <c:out value="${comm_post.subcat_id}" /></td>
                  <td>_______</td>
                  <td>_______</td>
                  <td>_______</td>
                  <td>_______</td>
                </tr><!-- 첫번째 줄 끝 -->
                <tr>
                  <!-- 두번째 줄 시작 -->
                  <td>날짜 입력할 곳2</td>
                  <td>_______</td>
                  <td>_______</td>
                  <td>_______</td>
                  <td>_______</td>
                  <td>_______</td>
                </tr><!-- 두번째 줄 끝 -->
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<footer> </footer>

</html>