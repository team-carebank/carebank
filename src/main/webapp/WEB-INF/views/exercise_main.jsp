<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Document</title>


<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 

*{
 font-family: 'Noto Sans KR', sans-serif;
}
.textcontainer{
   margin-top:100px;
   height: 15vh;
   display:flex;
   justify-content:center; 
   align-items: stretch; 
}
.textbox{
   min-height:20px; 
}
.skipbutton{
	top:800px;
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
}
 /* carousel */
body{
  margin:0;
  padding:0;
}
.carousel{
   transform: translateY(-150px);
   height:800px;
   perspective: 800px;
}
.carousel .carousel-item{
   width:400px;
}
.carousel .carousel-item img{
   width:100%;
}
.carousel .carousel-item h3{
   margin:-5px 0 0 ;
   padding:0;
   background: #fff;
   box-sizing: border-box;
   padding: 10px 5px;
   font-weight: bold;
   font-size:1.5em;
   text-align: center;
}

/*button*/
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
            <h2 style="font-size: 30px;">홍길동님, 오늘도 달려봐요</h2>
        </div>
    </div>

    <div class="carousel">
    
	        <div class="carousel-item" onclick="location.href='exercise_detail.do'">
	             <img src="resources/img/1.jpg">
	            <h3>코어근육 강화하기</h3>
	        </div>
	        
	        <div class="carousel-item">
	            <img src="resources/img/2.jpg">
	            <h3>유산소로 기초체력을</h3>
	        </div>
	        
	        <div class="carousel-item">
	            <img src="resources/img/3.jpg">
	            <h3>집에서하는 홈트레이닝</h3>
	        </div>
	        
	        <div class="carousel-item">
	            <img src="resources/img/4.jpg">
	            <h3>가벼운 하체를 위해</h3>
	        </div>
	        
	        <div class="carousel-item">
	            <img src="resources/img/5.jpg">
	            <h3>핫둘</h3>
	        </div>

    </div>

    <div class="skipbutton">
        <div class="textbox2">
            <p>음..오늘은 마음을 챙겨볼게요</p> 
            <button class="button-68"  onclick="location.href='meditation.do'">meditation</button>
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