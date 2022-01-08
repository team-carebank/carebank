<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Document</title>


<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
@import url('https://fonts.googleapis.com/css2?family=PT+Serif:ital@1&display=swap');
body{
 background-image: url('resources/img/background1.jpg');
 background-size: cover;
 background-repeat:no-repeat;
 width: 100%; 
 }
.textbox{
 top:100px;
 left:40px;
 position: relative;
 font-size:large;
 font-family: 'PT Serif', serif;
 
  display: inline-block; 
  padding: 10px;
  animation: fadein 3s; 
  -webkit-animation: fadein 10s;  
} 
@-webkit-keyframes fadein { 
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
} 
.playlist_container{
 display: flex; 
  flex-direction: column;
  align-items: center;
  margin-top:150px;
  
}
.icons{ 
  top:200px; 
  width: 100%;
   text-align: center;
} 

.icons-first{
opacity:70%;}
.detail{
 z-index: 1;
}
*{
 margin: 0;
 border:0;
}
img{
 opacity: 80%;
}
#iframe{
 display: none;
}


input[type=range] { width:30%; -webkit-appearance: none; background: transparent; }

  input[type=range]::-webkit-slider-runnable-track { 
    width: 100%;
     height: 2.4px; 
     cursor: pointer; 
     box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
    background: #ffffff; 
    border-radius: 1.3px; 
    opacity:60%;
    /* border: 0.2px solid #010101;  */
  }
    
    input[type=range]:focus::-webkit-slider-runnable-track {
       background: #cbcec0;
       opacity:100%; }
       
       input[type=range]::-webkit-slider-thumb { 
         -webkit-appearance: none; 
         background:  #ffffff; 
         cursor: pointer; 
         /* border: 1px solid #000000;  */
         height: 15px; 
         width: 10px; 
         opacity:100%;
         margin-top: -14px; 
         box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d; 
         border-radius: 1.3px; }

.play-btn {
  width: 45px;
  height: 45px;
  /* background: radial-gradient( rgba(167, 138, 185, 0.8) 20%, rgba(255, 255, 255, 1) 92%); */
  background: transparent;
  border-radius: 50%;
  top:-33px;
  position: relative; 
  box-shadow: 0px 0px 25px 3px rgba(7, 61, 3, 0.8);
}

/* triangle */
.play-btn::after {
	
  content: "";
  position: absolute;
  left: 50%;
  top: 50%;
  -webkit-transform: translateX(-40%) translateY(-50%);
  transform: translateX(-40%) translateY(-50%);
  transform-origin: center center;
  width: 0;
  height: 0;
  border-top: 15px solid transparent;
  border-bottom: 15px solid transparent;
  border-left: 25px solid #fff;
  z-index: 100;
  -webkit-transition: all 400ms cubic-bezier(0.55, 0.055, 0.675, 0.19);
  transition: all 400ms cubic-bezier(0.55, 0.055, 0.675, 0.19);
}

/* pulse wave */
.play-btn:before {
  content: "";
  position: absolute;
  width: 150%;
  height: 150%;
  -webkit-animation-delay: 0s;
  animation-delay: 0s;
  -webkit-animation: pulsate1 2s;
  animation: pulsate1 2s;
  -webkit-animation-direction: forwards;
  animation-direction: forwards;
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
  -webkit-animation-timing-function: steps;
  animation-timing-function: steps;
  opacity: 1;
  border-radius: 50%;
  border: 2px solid rgba(255, 255, 255, .75);
  top: -30%;
  left: -30%;
  background: rgba(198, 16, 0, 0);
}

@-webkit-keyframes pulsate1 {
  0% {
    -webkit-transform: scale(0.6);
    transform: scale(0.6);
    opacity: 2;
    box-shadow: inset 0px 0px 25px 3px rgba(255, 255, 255, 0.75), 0px 0px 25px 10px rgba(255, 255, 255, 0.75);
  }
  100% {
    -webkit-transform: scale(3);
    transform: scale(3);
    opacity: 0;
    box-shadow: none;

  }
}

@keyframes pulsate1 {
  0% {
    -webkit-transform: scale(0.6);
    transform: scale(0.6);
    opacity: 1;
    box-shadow: inset 0px 0px 25px 3px rgba(255, 255, 255, 0.75), 0px 0px 25px 10px rgba(255, 255, 255, 0.75);
  }
  100% {
    -webkit-transform: scale(1, 1);
    transform: scale(1);
    opacity: 0;
    box-shadow: none;

  }
}

.buttons {
    margin: 4%;
    text-align: center;
}

.btn-hover {
    width: 120px;
    font-size: 13px;
    font-weight: 600;
    color: rgb(172, 172, 172);
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 10px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}
 
.btn-hover.color-8 {
    background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
    box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
} 

</style>
</head>


<body>
    <div>
	    <div class="textbox"> 
	    <div style="width:400px;">${dto.med_quote }</div>
	 
	 
 
	 
 
    </div>

    <div id="iframe"></div>
        

	<div class="playlist_container">
        <div class="icons">
            <div class="icons-first"> 
            <input type="image" name="button" src="resources/img/med_prev.png" style="width: 5%;"onclick="previousVideo();">
            <button class="play-btn"  onclick="playYoutube();"></button>
            <input type="image" name="button" src="resources/img/med_pause.png"  style="width: 5%;"onclick="pauseYoutube();">
            <input type="image" name="button" src="resources/img/med_next.png" style="width: 5%;"onclick="nextYoutube();">
            <!-- <input type="image" name="button" src="resources/img/med_sleep.png" style="width: 4%;"onclick=" ();">-->
            </div>
            <div class="icons-second">
            <input type="range" value="50" min="0" max="100" onChange="soundControl(this.value);"/>
         
            <div class="buttons">
          <!--  <input type="image" name="button" src="resources/img/playlist.png" style="width: 5%; "onclick="playlist1();">
            <input type="image" name="button" src="resources/img/playlist2.png" style="width: 5%; "onclick="playlist2();">
             <input type="image" name="button" src="resources/img/playlist2.png" style="width: 5%; "onclick="playlist3();"> -->
              
       <button class="btn-hover color-8" onclick="playlist1();">GUIDE 1</button> 
        <button class="btn-hover color-8" onclick="playlist2();">GUIDE 2</button> 
        <button class="btn-hover color-8" onclick="playlist3();">GUIDE 3</button> 
       </div>
            </div>
        </div> 
	</div>
 
    </div>
    
    
    <script type="text/javascript">
        var tag = document.createElement('script');
        tag.src = "http://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('iframe', {
                height: '315',        
                width: '560',          
                videoId:'${dto.med_url_play}',
                playerVars: {            
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,          
                    'onStateChange': onPlayerStateChange
                }
            });
        }

        function onPlayerReady(event) {
            console.log('onPlayerReady 실행');
        }
        
        var playerState;
        
        function onPlayerStateChange(event) {
            playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                    event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                    event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                    event.data == -1 ? '시작되지 않음' : '예외';
 
            console.log('onPlayerStateChange 실행: ' + playerState);
            collectPlayCount(event.data);
        }
 
        function playYoutube() {
            player.playVideo();
        }
        function pauseYoutube() {
            player.pauseVideo();
        }
        function stopYoutube() {
            player.seekTo(0, true); 
            player.stopVideo();
        }
        function nextYoutube(){
            player.nextVideo();
        }
        function previousYoutube(){
            player.previousVideo();
        }
   		function soundControl(number) {
        	player.setVolume(number);
    	}

        var played = false;
        
        function collectPlayCount(data) {
            if (data == YT.PlayerState.PLAYING && played == false) {
                played = true;
                console.log('statistics');
            }
        }
        
         
        function playlist1() {
            player.loadPlaylist({ 
                'list': '${dto.med_url_playlist1}', 
                'listType': 'playlist',
                'index': 0,
                'startSeconds': 0,
                'suggestedQuality': 'small'
            });
        }

        function playlist2() {
            player.loadPlaylist({
            	  'list': '${dto.med_url_playlist2}', 
                'listType': 'playlist',
                'index': 0,
                'startSeconds': 0,
                'suggestedQuality': 'small'
            });
        }
        
        function playlist3() {
            player.loadPlaylist({
           	  'list': '${dto.med_url_playlist3}', 
                'listType': 'playlist',
                'index': 0,
                'startSeconds': 0,
                'suggestedQuality': 'small'
            });
        }
 
 
    </script>
</body>
</html>


