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
 font-size:x-large;
 font-family: 'PT Serif', serif;
}
.playlist_container{
 display: flex; 
  justify-content: center;
}
.icons{
  position:absolute;
  top:250px; 
  width: 100%;
  align-items: center;
  justify-content: center;
}
.playlist{  
 width: 300px;
 height: 450px;
 top:70px;
 right:60px;
 position: absolute;
 border-radius: 10px;
 z-index: -1;
}
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
</style>
</head>


<body>
    <div>
	    <div class="textbox">
	    <span>Feelings come and go like clouds in a windy sky.<br>
	    Conscious breathing is my anchor -Thich Nhat Hahn</span>
    </div>

    <div id="iframe"></div>

    <div class="playlist_container"> 
        <div class="playlist" style="background-color: antiquewhite; opacity: 30%;">
            <h3 style="position: absolute; top:30px;left:50px;">차분한 명상을 위한 15분<br><hr></h3>
            <br>
            <img src="timer.png" style="width: 8%; position: absolute; right:20px; top:60px;">
            <img src="shuffle.png"style="width: 8%; position: absolute; right:60px; top:60px;">
            <br><br><br><br><hr>
    ````</div>

        <div class="icons">
           <!--  <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/10505239861585493162-512.png" style="width: 5%;margin-left:100px;"onclick="previousVideo();">
            <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/7557449971585493161-512.png" style="width: 5%;margin-left:40px;"onclick="pauseYoutube();">
            <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/11626400981585493160-512.png" style="width: 5%;margin-left:30px;" onclick="playYoutube();">
            <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/13804753961585493161-512.png" style="width: 5%;margin-left:30px;"onclick="nextYoutube();">
            <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/6139104011585493157-512.png" style="width: 5%;margin-left:30px;"onclick="changeVideoListObjectAndStart2();">
            <input type="image" name="button" src="https://pics.freeicons.io/uploads/icons/png/14170783851585493155-512.png" style="width: 5%;margin-left:30px;"nclick="changeVideoListObjectAndStart3();">
            -->
            <input type="image" name="button" src="resources/img/prev.png" style="width: 5%;margin-left:100px;"onclick="previousVideo();">
            <input type="image" name="button" src="resources/img/pause.png" style="width: 5%;margin-left:40px;"onclick="pauseYoutube();">
            <input type="image" name="button" src="resources/img/play.png" style="width: 5%;margin-left:30px;" onclick="playYoutube();">
            <input type="image" name="button" src="resources/img/next.png" style="width: 5%;margin-left:30px;"onclick="nextYoutube();">
            <input type="image" name="button" src="resources/img/playlist.png" style="width: 5%;margin-left:30px;"onclick="changeVideoListObjectAndStart2();">
            <input type="image" name="button" src="resources/img/playlist2.png" style="width: 5%;margin-left:30px;"onclick="changeVideoListObjectAndStart3();">
            <br><br>  <input type="range" value="50" min="0" max="100" style="margin-left:500px;" onChange="soundControl(this.value);"/>
        </div> 

        <div class="playlist">
            <div class="detail">
            <span style="top:150px; left:5px; position: absolute;"><img src="album.jpg" style="width: 19%;"></span>
            <span style="top:170px;position: absolute; left:100px; color:rgb(219, 216, 216); opacity: 70%;">chill out track 01</span>
            
            <span style="top:360px; left:5px;position: absolute;"><img src="album.jpg" style="width: 19%;"></span>
            <span style="top:380px;position: absolute; left:100px;  color:rgb(219, 216, 216);  opacity: 70%;">chill out track 01</span>

            <span style="top:220px; left:5px;position: absolute;"><img src="album.jpg" style="width: 19%;"></span>
            <span style="top:240px;position: absolute; left:100px; color:rgb(219, 216, 216);  opacity: 70%;">chill out track 01</span>

            <span style="top:290px; left:5px;position: absolute;"><img src="album.jpg" style="width: 19%;"></span>
            <span style="top:310px;position: absolute; left:100px; color:rgb(219, 216, 216);  opacity: 70%;">chill out track 01</span>
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
                videoId: '2N4eTTipm9I',   
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
  
        function changeVideoListObjectAndStart2() {
            player.loadPlaylist({
                'list': 'PL7by6RYPG3HCXn2l5Bhi0qoxgF3BzDHSt',
                'listType': 'playlist',
                'index': 0,
                'startSeconds': 0,
                'suggestedQuality': 'small'
            });
        }

        function changeVideoListObjectAndStart3() {
            player.loadPlaylist({
                'list': 'PLwRp13WDIrMMC69Hh-63vkRi_4VOkF4kr',
                'listType': 'playlist',
                'index': 0,
                'startSeconds': 0,
                'suggestedQuality': 'small'
            });
        }
 
 
    </script>
</body>
</html>