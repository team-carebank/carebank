
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 

*{

  margin:0px;
  box-sizing: border-box; 
  font-family: 'Noto Sans KR', sans-serif;
}
.flexbox-container1 , .flexbox-container2 , .flexbox-container3, .flexbox-container4, .flexbox-container5{
  margin-top:150px;
  height: 55vh;
  display:flex;
  font-size: 1vw;
  justify-content:space-around ; /* 정렬 .+space-around, space-between*/
  align-items: center; /*stretch가 기본(아이템들이 컨테이너에 맞게늘어남). flex-start는 아이템이 가진값만큼 딱맞게됨 여기서 중앙축에 정렬한 것이 center*/
}
.flexbox-item2-1,.flexbox-item4-1{ /*text*/
  width:30vw; 
  min-width: 300px;
  font-size:1vw; 
 margin:0px; 
}

.flexbox-item-1,.flexbox-item-3-1{
  width: 30vw;
  left:80vw;
  min-width: 400px;
  font-size: 1vw;
  margin:0px;
}


.flexbox-item-2,.flexbox-item2-2,.flexbox-item3-2,.flexbox-item4-2{
  width:40vw; 
  max-width: 600px;
  min-width:350px; 
  overflow: hidden;
  font-size: 1vw;
  margin:0px;	
}
    /* 스크롤 애니메이션 */
.sa {
  opacity: 0;
  transition: all .5s ease;
}
.sa-right {
 transform: translate(-100px, 0);
}
.sa-left {
 transform: translate(100px, 0);
}
.sa-scaleUp {
 transform: scale(.5);
}
.sa.show {
 opacity: 1;
 transform: none;
}
h3{
 color:rgb(69, 99, 80);
 font-size:1.5vw;
}
p{
 color:rgb(68, 71, 68);
}
/*button */ 
.button-68 {
  appearance: none;
  backface-visibility: hidden;
  background-color: #27ae60;
  border-radius: 8px;
  border-style: none;
  box-shadow: rgba(39, 174, 96, .15) 0 4px 9px;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  /* display: inline-block; */
  font-family: Inter,-apple-system,system-ui,"Segoe UI",Helvetica,Arial,sans-serif;
  font-size: 14px;
  font-weight: 400;
  letter-spacing:0.2ch;
  line-height: 0.5;
  outline: none;
  overflow: hidden;
  padding: 13px 20px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transform: translate3d(0, 0, 0);
  transition: all .3s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: top;
  white-space: nowrap;
}
.button-68:hover {
  background-color: #1e8449;
  opacity: 1;
  transform: translateY(0);
  transition-duration: .35s;
}
.button-68:active {
  transform: translateY(2px);
  transition-duration: .35s;
}
.button-68:hover {
  box-shadow: rgba(39, 174, 96, .2) 0 6px 12px;
}
/*table*/
.notice_table,th,td{
  border:0.01px solid grey; 
  border-collapse: collapse;
}
td{ 
  text-align: center;
  padding-left: 30px;
  padding-right: 30px;
  padding-top: 10px;
  padding-bottom: 10px;
}
th{
  font-weight:normal;
}
#body{
  margin-left: 5vw;
  margin-right: 3vw;
}
</style>
</head>


<body>
<header>
<%@include file = "../../header.jsp" %>
</header>

<div id="body">
      <div class="flexbox-container1">
      
          <div class="flexbox-item flexbox-item-1">
            <br><br><br><h3 class="sa sa-right">식단 관리를 시작해보세요</h3><br>
            <p class="sa sa-right">균형잡힌 식단 관리에 어려움을 겪으시나요?<br>
            carebank에서 건강고민과 관심사를 체크한 후<br>
            나에게 딱 맞는 식단을 추천받아 식단을 꾸려보세요.<br><br><button class="button-68" onclick="location.href='${pageContext.request.contextPath }/prefer/meallist.do'">recipe</button>
        	</p>
          	</div>
          	
          	<div class="flexbox-item flexbox-item-2"> 
            <div class="sa sa-left"><img src="resources/img/salad2.png" style="width: 80%; height:80%;"></div>
            </div>
      </div> 

      <div class="flexbox-container2">
            <div class="flexbox-item flexbox-item2-2"> 
            <div class="sa sa-right"><img src="resources/img/nutri.png" style="width: 80%; height:80%;"></div>
            </div>
        
            <div class="flexbox-item flexbox-item2-1">
            <br><br><br><h3 class="sa sa-left">필요한 영양소를 보충하세요</h3><br>
            <p class="sa sa-left">내 몸에 어떤 영양소가 필요한지 알아보는것이 번거로웠다면 <br>
              케이뱅크에게 맡겨주세요<br><br><button class="button-68" role="button" onclick = "location.href = '${pageContext.request.contextPath }/prefer/supplelist.do'">nutrient</button>
            </div>
      </div>

      <div class="flexbox-container3">
            <div class="flexbox-item flexbox-item3-1"> 
            <br><br><br><h3 class="sa sa-right">미뤄왔던 운동을 시작해보세요</h3><br>
            <p class="sa sa-right">어떤 운동을 해야할지 몰라 운동의 시작이 어려웠다면<br>
            고민에 꼭 필요한 운동 동작을 추천받아<br>
            코스를 완성하고 목표량을 꾸준히 채워보세요<br><br><button class="button-68"   onclick="location.href='exerciselist.do'">workout</button>
            </div>
            
            <div class="flexbox-item flexbox-item3-2"> 
            <div class="sa sa-right"><img src="resources/img/workout.png" style="width: 100%; height:100%;"></div>
            </div>
      </div>

      <div class="flexbox-container4">
            <div class="flexbox-item flexbox-item4-2"> 
            <div class="sa sa-right"><img src="resources/img/dashboardd.png" style="width: 100%; height:100%;"></div>
            </div>
            
            <div class="flexbox-item flexbox-item4-1"> 
            <br><br><br><h3 class="sa sa-left">내 몸의 변화를 쉽게 체크하세요</h3><br>
            <p class="sa sa-left">식단 일지를 기록하여 균형잡힌 식단을 유지하고<br>
            대시보드를 통해 칼로리 소모량, 몸무게 변화, 운동량을<br>
            체크하여 몸의 변화를 시각적으로 한눈에 체크해보세요<br><br><button class="button-68" role="button">dashboard</button></p> 
 		    </div>
      </div>


      <div class="flexbox-container5"> <!-- notice controller 완성되어있지 않아 임의로 list,dto,mapping.do로 넣음  -->
            <div class="flexbox-item flexbox-item5-1"> 
            <h3 style="text-align: left;">notice</h3>
            <table class="notice_table">
            <thead>
            <tr>
            <th>No</th>
            <th>TITLE</th> 
            </tr>
            </thead>
            
            <c:choose>
            	<c:when test="${empty list }">
            	<tr>
            	<td colspan="2" align="center">작성된 글이 없습니다.</td>
            	</tr>
            	</c:when>
            	
            <c:otherwise>
            	<c:forEach items="${list }" var="dto">
            	
            	<tr>
            		<td>${dto.notice_no }</td>
            		<td><a href="mapping.do?notice_no=${dto.notice_no}">${dto.notice_title }</a></td> 
            	</tr>
            	</c:forEach>
            
            </c:otherwise>	
            
            </c:choose>
            
            <!-- 삭제될table값 -->
            <tbody>
            <tr>
            <td>1</td>
            <td>새로운 레시피가 업데이트 되었습니다.</td> 
            </tr>
            <tr>
            <td>2</td> 
            <td>대시보드에서 운동 날짜 기록 에러를 수정하였습니다.</td> 
            </tr> 
            </tbody>
            
            
            </table>
            </div>
      </div>
      
      
      
    <script type="text/javascript">
        const saTriggerMargin = 300;
        const saElementList = document.querySelectorAll('.sa');
        const saFunc = function() {
          for (const element of saElementList) {
            if (!element.classList.contains('show')) {
              if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
                element.classList.add('show');
              } } } }
        window.addEventListener('load', saFunc);
        window.addEventListener('scroll', saFunc);
      </script>
      </div>
</body>
</html> 

