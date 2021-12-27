<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>


    <style>
*{
   margin:0px; 
}
       
#int{  
  display:inline;
  position:absolute;
  top:200px;
  left:600px; 
  z-index: 1;
  font-family: 'Noto Sans KR', sans-serif;
 }      

body {
  overflow: hidden;
  margin: 0;
 }
       
#particle_container{
  position: absolute;
  top:100px;
  z-index: -1;
}
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
           

.cont {
    position:relative;
    width:100%;
    height: 100%; 
}

span{
   list-style-type: none;
   padding: 15px;
   margin:10px ; 
   position:relative;
   display: inline-block;
   margin:10px 0;
   font-size:1.5em;
   text-decoration: none;
   color:rgb(243, 236, 236);
}

.cursor{
   position:fixed;
   width:20px;
   height:20px;
   border-radius: 50%;
   background:#239954;
   transition:0.2s;
   transform:translate(-50%, -50%);
   pointer-events: none; 
     /* mix-blend-mode: color-burn; */
   mix-blend-mode: saturation;
}
 
span:hover{
   font-size:2.5em;
   opacity:1; 
}

span:hover~.cursor{
   font-size:5em;
   opacity:1;
   transform:scale(5); 
}

span:hover~.cursor a{
   transform: scale(0); 
}
</style>    



<body>
          
    <div id="int">
        <h1 style="color: rgb(30, 41, 32);">Carebank</h1>
        <br>
        <p style="color:rgb(3, 27, 2)">케어뱅크는 개인화된 헬스 케어 서비스를 제공하는 플랫폼입니다.<br> 
        케어뱅크와 식단, 운동, 영양소의 밸런스를 손쉽게 유지해 보세요.<br><br>       
        이 모든 서비스를 무료로 <br><br><button class="button-68" role="button">시작하기</button></p>
      </div>
      
      
      <div class="cont">

                <span>migraine</span>
                <span>constipation</span>
                <span>acne</span>
                <span>anemia</span>
                <span>hypotension</span>
                <span>Rhinitis</span>
                <span>digestion</span>
                <span>myocarditis</span>
                <span>hyperlipidemia</span>
                <span>antiaging</span>
                <span>immunity</span>
                <span>diet</span>
                <span>stress</span>
                <span>smoker</span>
                <span>sleep</span>
                <span>mindfulness</span>
            
            	<div class="cursor"></div>
     </div>
  
                
     <script>
            
     const cursor = document.querySelector('.cursor');
     
    document.addEventListener('mousemove',(e)=>{
                cursor.style.left = e.pageX+'px';
                cursor.style.top = e.pageY+'px';
                Element.style.cursor=e.pageY+"url('')";
            })
     </script>
    </body>

    <script>
		function getRandomInteger(min, max) {
		  min = Math.floor(min);
		  max = Math.floor(max);
		  var rd = Math.floor(Math.random() * (max - min)) + min;
		  return rd;
		}



		window.onload=function random() {
		        var ps= [];
		        var n = 0;
		        var containerW = 800;
		        var containerH = 700;
		        var spanW;
		        var spanH;
		        var first = true;
		        var first_H ;
		        var current_H ;
		      for(var i=0; i< 15; i++)
		      {
		        ps[i] = i;
		      }
		      $('span').each(function() {
		if(first)
		{
		  spanW = $(this).width();
		  spanH = $(this).height();
		  first = false
		 }
		  var x = getRandomInteger(0,containerW-spanW);
		  var p = getRandomInteger(0,ps.length-1);
		//   var y = ps[p]*20;
		var y = ps[p]*40;
		  ps.splice(p, 1);
		  $(this).css({
		    position: 'absolute',
		    top: y + 'px',
		    left: x + 'px'
		  });
		});
		}
    </script>


</html>