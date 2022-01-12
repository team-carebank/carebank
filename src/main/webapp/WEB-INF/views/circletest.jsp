<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.jsdelivr.net/npm/p5@1.4.0/lib/p5.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#here{
z-index:-1;
}

</style>
</head>
<body>

    <div id="here"></div>
    <script type="text/javascript">
        let size=120;
        let len=3;
        const colors=['#fff','#fff','#00f3f1']

        let speed=40;

        function setup(){
            here=createCanvas(windowWidth,windowHeight);
            here.parent('here');
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
</body>
</html>