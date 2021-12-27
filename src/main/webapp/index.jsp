 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>        
<script src="https://cdn.jsdelivr.net/npm/p5@1.4.0/lib/p5.min.js"></script>
<title>Document</title>
<style type="text/css">
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
 
 
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
 
</style>
</head>



<body>
    <div id="int">
        <h1 style="color: rgb(30, 41, 32);">Carebank</h1><br>
        <p style="color:rgb(3, 27, 2)">케어뱅크는 개인화된 헬스 케어 서비스를 제공하는 플랫폼입니다.<br> 
        케어뱅크와 식단, 운동, 영양소의 밸런스를 손쉽게 유지해 보세요.<br><br>
        이 모든 서비스를 무료로 <br><br><button class="button-68"  onclick="location.href='main.do'">시작하기</button></p>
    </div>

    <div id="particle_container"/>

 

<script type="text/javascript"> 

let t = 0;
let arr=['heart','diet','mindfulness','migraine','acne']; //임의의 text배열 
let one=[];

class Particle {
  constructor(){
    this.x = random(0,width);
    this.y = random(0,height);
    this.r = random(50,90);
    this.xSpeed = random(-1,0);
    this.ySpeed = random(-1,0);
  }
  createParticle() {
	noStroke();
    if (dist (this.x,this.y,mouseX,mouseY) < this.r){
      	fill('rgba(255, 188, 0,0.8)');
  		circle(this.x, this.y, this.r+25);  
        		if(mouseIsPressed==true){
         		fill(0,t);
        		t=text(arr[Math.floor(Math.random()*arr.length)],this.x, this.y);
  				}  
	}else{
		fill('rgba(40,119,67,0.8)');
    	circle(this.x,this.y,this.r);
  	}
  }

  moveParticle() {
    if(this.x < 0 || this.x > width)
      this.xSpeed*=-1;
    if(this.y < 0 || this.y > height)
      this.ySpeed*=-1;
    this.x+=this.xSpeed;
    this.y+=this.ySpeed;
  }

  joinParticles(paraticles) {
    particles.forEach(element =>{
      let dis = dist(this.x,this.y,element.x,element.y);
      if(dis<85) {
        stroke('rgba(255,255,255,0.2)');
        line(this.x,this.y,element.x,element.y);
      }
    });
  }
}

function randomText(arr){
  const random=Math.floor(Math.random()*arr.length);
  return arr[random];
}  


  // while(arr.length>2){
  //   var movenum=arr.splice(Math.floor(Math.random()*arr.length),1)[0]
  //   one.push(movenum)
  //   console.log(one)
  //   // console.log(arr)

   

// //텍스트 랜덤값 추출1
// function random(a){
//   return a[Math.floor(Math.random()*a.length)];
// }


let particles = [];
let canvas;

function setup() {
  canvas=createCanvas(windowWidth , 400);
  canvas.parent('particle_container'); 
  t=text(arr[Math.floor(Math.random()*arr.length)],this.x, this.y);

  for(let i = 0;i<width/50;i++){
    particles.push(new Particle());
  }
}


let x = 0;
let y = 0;

function draw() {
  background('#white');
  for(let i = 0;i<particles.length;i++) {
    particles[i].createParticle();
    particles[i].moveParticle();
    particles[i].joinParticles(particles.slice(i));

    x = lerp(x, mouseX, 0.01);
 	y = lerp(y, mouseY, 0.01);

    stroke('rgba(247,238,223,0.09)');
    fill('rgba(247,238,223,0.01)');
    ellipse(x, y, 66, 66);
  } 
}
 
</script>
</body>
</html> 