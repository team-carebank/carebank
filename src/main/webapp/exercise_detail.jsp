<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Document</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
*{
 margin:0px;
 padding: 0px;
 font-family: 'Noto Sans KR', sans-serif;
}
.workoutcontainer{
  display: flex; 
  top:200px;
  margin-top: 0px;
  height:80vh;
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
  right: 50px;
}
.checkchart{
 width: 200px;
  height:130px;
  margin-left: 23px;
  margin-top:20px;
}
.done{
  position: absolute;
  right:30px;
  top:190px;
}
.calories{
 top:500px;
 position: absolute;
 right: 160px;
}
.checkchart{
 overflow: hidden;
 display: flex;
 align-items: center;
 justify-content: center;
}
.timer_container{
  display: flex;
  align-items: center;
  justify-self: center; 
  width: 100%;
  height: 100px;
}
.timer{
  text-align: center;
}
</style>
</head>


<body>
   
    <div class="textbox">
        <h2 style="font-size: 20px;">(동작notice)허리를 굽히지 마세요!</h2>
    </div>

    <div class="workoutcontainer">
	        <div class="webcam">
	            <img src="resources/img/webcam.png">
	        </div>
	        <div class="video">
	            <img src="resources/img/doing.png">
	        </div>
    </div>

    <div class="checkbox">
        <h3>이번달도 고지가 눈앞에!</h3>
        <div class="checkchart">
            <img src="resources/img/chart.jpg">
        </div>
        <button class="done">DONE</button>
    </div>

    <div class="calories">
      <h3>벌써</h3><br><h1>121kcal나</h1><br><h3>불태웠어요</h3>
    </div>

    <div class="timer_container">
        <h1 style="position: absolute; left:590px">03:21</h1>
    </div>
    
</body>
</html>