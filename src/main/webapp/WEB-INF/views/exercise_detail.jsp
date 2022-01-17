
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.yee.carebank.model.dto.UserDto" %>   
 
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/p5@1.4.0/lib/p5.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
<script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
<title>ExerciseDetail</title>
<style type="text/css">  
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
*{
margin:0px;
padding: 0px;
font-family: 'Noto Sans KR', sans serif !important;
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
width:18vw; 
height:50vh;
margin-top:30px; 
overflow:hidden;
display: flex;
align-items: center;
justify-content: center;
background-image:url('resources/img/camready.jpg');
background-size: cover;
border-radius: 20px; 
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
}
#canvas{
height:450px;
margin-top:30px;
display:flex;
}
#startbutton{
position:relative;
margin-left:40px;
}
.video{
width:18vw; 
height:50vh;
margin-top:30px;
overflow: hidden;
display: flex;
align-items: center;
justify-content: center;
border-radius: 20px; 
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
}
#iframe{
width:100vw;
height:100vh;
}
.checkbox{
width:20vw;
height:28vh;
position: absolute;
top:23vh;
right: 7vw;
background-color:yellow;
border-radius: 20px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
         padding:3px;
}
#checkchart{
overflow: hidden;
display: flex;
align-items: center;
justify-content: center;
width: 15vw;
height:20vh;
margin-top:2vh;
margin-left: 1.5vw;
border-radius: 20px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
} 
#done{
position: relative;
left:12vw;
top:5vh;
}
.calories{
top:14vh;
position: relative;
left:7vw;
width:8vw;
height:12vh;
top:10vh;
font-size:0.8em;
padding:20px;
border-radius: 20px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
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
font-family: 'Noto Sans KR';
TSmd}
.zc-ref {
  display: none;
}	 
 .number {  
font-size:1vw;
list-style: none;
color: #333;
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
font-size: 0.7wm;
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
#startbutton{ 
position:absolute;
margin-left:10px;
margin-top:400px; 
} 
#hello{
border-radius: 20px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
         }
.desc{
overflow:auto;
padding:20px;
font-family: 'Noto Sans KR, sans serif !important';
border-radius: 20px;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
}        
#textnotice{
font-family: 'Noto Sans KR';
align-items:center;
border-radius: 20px;
font-size:1vw;
background: linear-gradient(145deg, #e6e6e6, #ffffff);
box-shadow:  5px 5px 10px #d9d9d9,
         -5px -5px 10px #ffffff;
}
.desc::-webkit-scrollbar{
width: 6px;
height:3px;
}
.desc::-webkit-scrollbar-thumb{
height: 3%;
background-color: rgba(142,178,151,0.7);
border-radius: 10px;    
}
.desc::-webkit-scrollbar-track{
background-color: rgba(0,0,0,0);
}
#textbox{
padding:10px; 
font-family: 'Noto Sans KR', sans-serif; 
color:#7C847F;
}

#return{
position:absolute;
top:8vh;
left:5vw;
 
}

</style>
</head>


<body> 
<div id="return">  
	<!-- <button type="button" onclick="location.href='main.do'" id="returnbutton"><img src="resources/img/return.png"></button>  -->
	<p><img src="resources/img/return.png"  onclick="location.href='exerciselist.do'" style="width:10%; height:10%;cursor:pointer; "></p>
	</div>
	
<!-- notice -->
<div class="textbox">
<span id="textnotice">${dto.exer_notice }</span>
<br><br>  

</div>   
<!-- tm, video -->
<div id="workoutcontainer">
	 <div class="webcam">
	    <div><canvas id="canvas"></canvas></div>
	    <div id="label-container"></div>
	    <button type="submit" id="startbutton" class="button-68" onclick="init(); counterFn();">Start!</button>
	 </div>
        
     <div class="video"> 
         <div>${dto.exer_video_url }</div>
     </div>
</div>

<!-- chart calendar -->
<div class="checkbox">
    <h3 style="text-align:center;margin-top:5px;color:#7C847F;font-size: 1vw;">이번달도 고지가 눈앞에!</h3> 
    
    <div id="checkchart">
    </div>
    <button class="button-68" id="done" onclick  ="insert();">DONE</button>
    <!-- calories -->
   <div class="calories">
    
    	<h3 style="color:#7C847F;font-size: 1vw;">벌써</h3><br><h1 class="number"> </h1><h3 style="color:#7C847F;font-size:1vw">kcal나 불태웠어요</h3>
   </div>
</div>

<!-- count, description -->
<div class="exerinfo">

	<div id="hello" style=width:12vw;height:14vh;position:relative;position:absolute;top:25vh;left:100px;text-align:center;">
		<div id="tm" style="margin-top:5vh; font-size:1vw; font-weight:bolder; color:#8EB297;">COUNT:</div>
		<div class="desc" style="width:16vw;height:24vh;position:relative;top:15vh;font-size:1vw;font-family: 'Noto Sans KR';color:#9A9B9A;">
		 <span>${dto.exer_description }</span>
		</div>
	</div>

</div> 

<!-- TM SCRIPT -->
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript"> 

    const URL = "${dto.exer_tm_url}";
    let model, webcam, ctx, labelContainer, maxPredictions;
    
    var cc=0; 
    
    function insert(){
        var exerid = ${dto.exer_id};
        
        $.ajax({
            url : "inserttest",
            type : 'post',
            data :  JSON.stringify({exer_count:cc, exer_id: exerid}),
            contentType: "application/json",
            success : function(data) {
				alert("운동 횟수가 기록되었습니다!")
				location.href = "diary.do";
             },
            error : function() {
                alert("error");
            }
        });
    }
 
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        //tm url 로드 
        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // 웹캠 셋업. 사이즈, 좌우반전
        const size = 200;
        const flip = true; 
        webcam = new tmPose.Webcam(size, size, flip); 
        await webcam.setup(); // 웹캠 접근 허용
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append/get elements to the DOM
        const canvas = document.getElementById("canvas");
        canvas.width = size; canvas.height = size;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("tm");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop(timestamp) {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }

    //count 추가 
   var status = "stretch"; //기본상태 
    var count = 0 ;
   
    //반복되는 함수 predict   
    async function predict() { 
        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas); 
        const prediction = await model.predict(posenetOutput);

        //count를 위해 추가되는 로직 
        if(prediction[1].probability.toFixed(2) > 0.90){
            //동작 0에서 1로갈때 count가 추가됨 
             if(status == "bound"){
                 cc=count++;
                  
                 //count할때 sound 삽입
                 var audio = new Audio('http://commondatastorage.googleapis.com/codeskulptor-assets/week7-brrring.m4a');
            audio.play();
             }
            status="stretch"
        }else if(prediction[0].probability.toFixed(2)> 0.90){
            status="bound"
        } 
        

        //동작인식시 html에append되는
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
              cc;
            labelContainer.innerHTML = classPrediction;
        }
        drawPose(pose);
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0); 
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    } 
</script>


 
<!-- kcal COUNT SCRIPT -->
<script type="text/JavaScript">
         
  var cnt0 = 0; 
  var speed=(60/${dto.exer_kcal })*1000; 
  var kcal=${dto.exer_kcal };
    
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
</script> 

<!-- chart SCRIPT -->  
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
    id: 'checkchart',
    data: chartConfig,
    height: '100%',
    width: '100%',
  });
});
</script>


</body>
</html>
 