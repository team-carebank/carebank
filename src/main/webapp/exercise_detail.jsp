<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/p5@1.4.0/lib/p5.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
  <script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
  
<title>Document</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
*{
 margin:0px;
 padding: 0px;
 font-family: 'Noto Sans KR', sans-serif;
}
body{
 width:100%;
 height:800px;
 }
#workoutcontainer{
  display: flex; 
  top:200px;
  margin-top: 0px;
  height:60vh;
  justify-content: center;
}
 .textbox{
  min-height:20px; 
  height: 14vh;
  margin-top:80px;
  text-align: center;
  padding-top: 20px; 
}
.webcam{
  width:300px; 
  height:400px;
  margin-top:30px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}
.video{
  width:300px; 
  height:400px;
  margin-top:30px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}
.checkbox{
  width:250px;
  height:230px;
  position: absolute;
  top:200px;
  right: 30px;
}
#checkchart{
 overflow: hidden;
 display: flex;
 align-items: center;
 justify-content: center;
  width: 200px;
  height:130px;
  margin-left: 23px;
  margin-top:20px;
} 
#done{
  position: absolute;
  right:30px;
  top:190px;
}
.calories{
 top:500px;
 position: absolute;
 right: 160px;
}
 

#ViewTimer{
  display: flex;
  justify-content:center;
  font-family: 'Noto Sans KR', sans-serif;
  font-size:2em;
} 
#time_left{ 
	text-align:center;
   padding: 20px;
   font-family: 'Noto Sans KR', sans-serif;
}
#circletimer{
  position: absolute;
  top:100px;
  z-index: -1;
	}
	
	h1{
	font-family: 'Noto Sans KR', sans-serif;
	TSmd}
	

    .zc-ref {
      display: none;
    }	
	
	 .number {  
  font-size:30px;
  list-style: none;
  color: #333;
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
  font-size: 10px;
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
   
    <div class="textbox">
        <h2 style="font-size: 20px;">(동작notice)허리를 굽히지 마세요!</h2>
    </div>

    <div id="workoutcontainer">
	        <div class="webcam">
	            <img src="resources/img/webcam.png">
	        </div>
	        <div class="video">
	            <img src="resources/img/doing.png">
	        </div>
	        <div id="circletimer"></div>
    </div>

    <div class="checkbox">
        <h3>이번달도 고지가 눈앞에!</h3>
        <div id="checkchart"> 
        </div>
       <button class="button-68" id="done">DONE</button>
    </div>

    <div class="calories">
      <h3>벌써</h3><br><h1 class="number"> </h1><br><h3>kcal나 불태웠어요</h3>
    </div>

    <div id="ViewTimer">
    	<div id="time_left"> 
        <h1 style="position: absolute; left:590px; font-family: 'Noto Sans KR', sans-serif;"/></div>
    </div>
    
    
     <script>
        let size=90;
        let len=5;
        const colors=['#fff','#fff','#fff','#00f3f1','#fff']

        let speed=40; //원이 채워지는 속도 조절 

        function setup(){
            canvas=createCanvas(windowWidth , 400);
            canvas.parent('circletimer'); 
        }

        function draw(){
            background(255,8)
            noStroke()
            translate(width/2,height)

            for(let i=0; i<len; i++){
                push()
                rotate(i/2 + frameCount/speed)
                fill(colors[i])
                ellipse(size+size*i,0,size/1.5)
                pop()
            }
        }
</script>

     
<script>
    var SetTime = 200;      // 최초 설정 시간(기본 : 초)
    function msg_time() {   // 1초씩 카운트      
        m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초"; // 남은 시간 계산         
        var msg = m ;  
        console.log(time_left);
        document.all.time_left.innerHTML = msg;       // div 영역에 보여줌                  
        SetTime--;                  // 1초씩 감소
        if (SetTime < 0) {          // 시간이 종료 되었으면..        
            clearInterval(tid);     // 타이머 해제
            alert("종료");

        }       
    }
    window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
</script>

 <script type="text/JavaScript">
        		$(function() {
		  var cnt0 = 0;
      var speed=1000;
      var kcal=120;

		  counterFn();

		  function counterFn() {

		    id0 = setInterval(count0Fn, speed); //속도조절
        //setinterval메서드는 일정시간 간격으로 코드를 반복 실행한다. 
        //setInterval(실행할함수, 시간간격(ms))
        //시간간격은 1/1000초 단위(ms)로 작성. 예; 1초=1000, 3초=3000

		    function count0Fn() {
        	
		      cnt0++;
		      if (cnt0 >kcal) { 
		        clearInterval(id0);
		      } else {
		        $(".number").text(cnt0);
		      }
		    }
		  }
		});

    </script>
     
  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    let chartData = [ //값은  [ 'YYYY-MM-DD', val],의 형식을 따라야함, 뒤에 'string'을 추가할수있음
    	//val값이없으면 색이 표시되지 않으므로 새로운 배열값 추가시에 [오늘날짜, 임의의값(ex1000)]을 넣을것 
    	
      ['2022-01-01',1000],
      ['2022-01-02', 1600],
      ['2022-01-03', 3000],
      ['2022-01-04', 3400],
      ['2022-01-05', 503],
      ['2022-01-06', 1981],
      ['2022-01-07', 2100],
      ['2022-01-08', 914]
    ];

    let chartConfig = {
      type: 'calendar',
      // backgroundColor: '#b3e7ff #e6f7ff',
      title: {
        text: 'january',
        fontColor: '#00344d',
        fontFamily: 'Noto Sans KR',
        fontSize: '10px'
      },
      subtitle: {
        text: '',
        fontColor: '#00344d',
        fontFamily:'Noto Sans KR',
        fontSize: '12px',
        fontWeight: 'normal',
        y: '10%'
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
            fontFamily: 'Noto Sans KR',
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
        id: 'checkchart',
        data: chartConfig,
        height: '100%',
        width: '100%',
      });
    });
  </script>



</body>
</html>