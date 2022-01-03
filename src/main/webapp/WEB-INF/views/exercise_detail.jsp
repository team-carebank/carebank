<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/p5@1.4.0/lib/p5.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
<script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
 
<title>ExerciseDetail</title>
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
  overflow:hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

#canvas{
	width:400px;
	height:450px;
	margin-top:30px;
	display:flex;
}

#startbutton{
	
	position:absolute;
	margin-left:40px;
	
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

#iframe{
	width:100vw;
	height:100vh;
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

#startbutton{
	
	position:absolute;
	margin-left:10px;
    margin-top:400px;
	
}

</style>

 
</head>


<body>
   
  <div class="textbox">
        <h2 style="font-size: 20px;">${dto.exer_notice }
        <br><br>
        <div id="hello">운동 횟수: </div>
        </h2>
    </div>

    <div id="workoutcontainer">
    
	        <div class="webcam">
			    <button type="button" id="startbutton" class="button-68" onclick="init(); counterFn();">Start!</button>
			    <div><canvas id="canvas"></canvas></div>
			    <div id="label-container"></div>
	        </div>
	        
	        <div class="video">
	            <!-- <iframe width="420" height="315" id="iframe"
				src="https://www.youtube.com/embed/${dto.exer_video_url }">
				</iframe> -->
				<div>${dto.exer_video_url }</div>
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

    <!--  <div id="ViewTimer">
    	<div id="time_left"> 
        <h1 style="position: absolute; left:590px; font-family: 'Noto Sans KR', sans-serif;"></h1>
        </div>
        <div id="hello">오늘의 운동 횟수:</div>
    </div>-->
     <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
    <script type="text/javascript"> 
        const URL = "${dto.exer_tm_url}";
        let model, webcam, ctx, labelContainer, maxPredictions,cc;

        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";
    
            // load the model and metadata
            // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
            // Note: the pose library adds a tmPose object to your window (window.tmPose)
            model = await tmPose.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();
    
            // Convenience function to setup a webcam
            const size = 200;
            const flip = true; // whether to flip the webcam
            webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
            await webcam.setup(); // request access to the webcam
            await webcam.play();
            window.requestAnimationFrame(loop);
    
            // append/get elements to the DOM
            const canvas = document.getElementById("canvas");
            canvas.width = size; canvas.height = size;
            ctx = canvas.getContext("2d");
            labelContainer = document.getElementById("hello");
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
       var status = "stretch"; //기본상태는 편걸로 한다.
        var count = 0 ;
        //반복되는 함수 predict에 본격적인 count 로직 작성 ㄱ 

        async function predict() { 
            const { pose, posenetOutput } = await model.estimatePose(webcam.canvas); 
            const prediction = await model.predict(posenetOutput);
    
            //count를 위해 추가되는 로직 
            if(prediction[1].probability.toFixed(2) > 0.90){
                 // bound에서 stretch할때 count 해주기 
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
            

            for (let i = 0; i < maxPredictions; i++) {
                const classPrediction =
                  cc;
                labelContainer.childNodes[i].innerHTML = classPrediction;
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
    
 
     
 
 <script type="text/JavaScript">
        	 
	  var cnt0 = 0;
      var speed=(60/${dto.exer_kcal })*1000;
      var kcal=${dto.exer_kcal };
       
		  //counterFn();

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