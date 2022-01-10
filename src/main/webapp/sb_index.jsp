
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
               
               top:40vh;
               
               left:20vw; 
               width:30vw;
               height:20vh;
               
               
               font-size:1.1vw;
                          /* z-index: 1; */
           font-family: 'Noto Sans KR', sans-serif; 
           
           }
body {
  overflow: hidden;
  margin: 0;
  
	}
	
	h1{
	color:#287743;
	}
       #bubbles {
  position: absolute;
  width: 100vw;
  height: 100vh;
  top: 0px; 
  margin-left:200px;
  
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

  <div id="bubbles"></div>

  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.js'></script>

  
  

    <script type="text/javascript">
        var nodes = new vis.DataSet([
  {label: "migraine"},
  {label: "constipation"},
  {label: "acne"},
  {label: "anemia"},
  {label: "rhinitis"},
  {label: "digestion"},
  {label: "myocarditis"},
  {label: "joint"},
  {label: "hypertension"},
  {label: "anti-aging"},
  {label: "Mindfulness"}
]);
var edges = new vis.DataSet();

var container = document.getElementById('bubbles');
var data = {
  nodes: nodes,
  edges: edges
};
 
var options = {
  nodes: {
      borderWidth:0,
      shape:"circle",
      font:{color:'#fff'},
      border:'#90ba00', 
      //color:'#287743'
      color:{background:'#287743', highlight:{background:'#90ba00', border: '#b9a600', borderWidth:0}}
    },
    //color:{background:'#287743', highlight:{background:'#59a600', border: '#b9a600', borderWidth:100}}
    //color:'#fc2b00'
  physics: {
    stabilization: false,
    minVelocity: 0,//뭉쳐있는정도 	
    solver: "repulsion",
    repulsion: {	
      nodeDistance: 70
    }
  }
};
var network = new vis.Network(container, data, options);


// Events
network.on("click", function(e) {
  if (e.nodes.length) {
    var node = nodes.get(e.nodes[0]); 
    nodes.update(node);
  }
});
    </script>


    <div id="int">
        <h1>Carebank</h1><br>
        <p style="color:rgb(3, 27, 2)">케어뱅크는 개인화된 헬스 케어 서비스를 제공하는 플랫폼입니다.<br> 
        케어뱅크와 식단, 운동, 영양소의 밸런스를 손쉽게 유지해 보세요.<br><br>
        <br><br><button class="button-68"  onclick="location.href='main.do'">시작하기</button></p>
    </div>
 
</body>
</html> 
