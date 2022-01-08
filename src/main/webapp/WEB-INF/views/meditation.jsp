<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Document</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
body{
  background: rgb(54, 53, 53);
  font-family: 'Noto Sans KR', sans-serif;
}
.textcontainer{
  margin-top:20px;
  height: 4vh;
  display:flex;
  justify-content:center; 
  align-items: stretch; 
}
.textbox{
  min-height:20px; 
}
.skipbutton{
  top:100px;
  right:20px;
  height:100px;
  display:flex;
  justify-content:right;
  align-items: flex-end;
  margin-bottom: 200px;
  position: absolute;
}
.textbox2{
  min-height: 20px;
  margin-right: 40px;
  color:rgb(190, 190, 190);
}
/* carousel */
body{
  margin:0;
  padding:0;
 }
.carousel
{
  transform: translateY(-150px);
  height:800px; 
  perspective: 800px; 
  position: absolute;
  top:0px;
}
.carousel .carousel-item{
  width:300px; 
}
.carousel .carousel-item h3{
  margin:-5px 0 0 ;
  padding:0; 
  box-sizing: border-box;
  padding: 10px 5px;
  font-weight: bold;
  font-size:1.5em;
  text-align: center;
  color:white;
}
/* CSS */
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
</style>
</head>

<body>
    <div class="textcontainer">
        <div class="textbox">
            <h2 style="font-size: 20px; color:rgb(190, 190, 190)">오늘만은 깊은 잠을..</h2>
        </div>
    </div>

    <!-- <div class="carousel">
		        
		        <div class="carousel-item" onclick="location.href='meditation_detail.do'">
		            <img src="resources/img/1명상.jpg">
		            <h3>마음을 비우는 15분</h3>
		        </div>
		        
		        <div class="carousel-item">
		            <img src="resources/img/2숙면.jpg">
		            <h3>깊은 잠을 위한</h3>
		        </div>
		        
		        <div class="carousel-item">
		            <img src="resources/img/3스트레스.jpg">
		            <h3>스트레스 해소엔</h3>
		        </div>
		        
		        <div class="carousel-item">
		            <img src="resources/img/4세로토닌.jpg">
		            <h3>세로토닌 증진</h3>
		        </div>
         
    </div>
     -->
     
     <!--  <td><a href="detail.do?meditate_id=${dto.meditate_id }">${dto.med_title }</a></td> -->
     
    <div class="carousel">
    
    	<c:choose>
    		<c:when test="${empty list }">
    			<h1>no list</h1>
    		</c:when>
    	<c:otherwise>
    		<c:forEach items="${list }" var="dto">
    		
    		<div class="carousel-item">
    			<img src="${dto.med_thum }" >
    			<h3 style="cursor: pointer;"  onclick="location.href='med_detail.do?meditate_id=${dto.meditate_id}'">${dto.med_title}</h3>
    		</div>
    		
    		</c:forEach>
    	
    	
    	</c:otherwise>
    	
    	</c:choose>
    	
    
    </div>
    
     
    
    
    
    

    <div class="skipbutton">
        <div class="textbox2">
            <p>오늘은 달려볼게요</p> 
            <button class="button-68"  onclick="location.href='exerciselist.do'">workout</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        
    <script type="text/javascript">
         $(document).ready(function(){
		    $('.carousel').carousel();
		  });
    </script>
 
</body>
</html>



