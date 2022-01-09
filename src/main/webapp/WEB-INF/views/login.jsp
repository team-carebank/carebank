<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
body {
    font-family: 'S-CoreDream-3Light';
   
}

.main-head{
    height: 150px;
    background: #FFF;
}

.sidenav {
    height: 100%;
    background-color: #287743;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }  
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 50%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 20%;
    }

  
}
@keyframes blink {
  to {
    opacity: 0;
  }
}
.blink {
  animation: blink 0.5s infinite;
  font-size: 20pt;
}
.login-main-text{
    margin-top: 10%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}
.id {
    margin-bottom: 20px;
}
.btn{
    margin-top:30px;
    min-width: 100px;
    padding: 10px;
}

#login_btn:hover{
    background-image: radial-gradient( circle farthest-corner at 10% 20%,
    rgb(57, 152, 99) 0%, #287743);
    border:none;
    width:100px;
    height:46px;
}

#loginChk{
	color:red;
}

img{
    cursor: pointer;
}

.intro{
   margin-top: 20%;
   margin-bottom: 30px;
   
}
.text{
    font-size: 20px;
}
.intro{
    min-height: 70px;
}
.btns{
    text-align: center;
}

</style>

<body>
  
    
    <div class="sidenav">
        <div class="login-main-text">
           <h2>CARE BANK<br></h2>
           <br>
           <h6>케어뱅크는 개인화된 헬스 케어 서비스를 제공하는 플랫폼입니다.</h3>
           <h6>케어뱅크와 식단, 운동, 영양소의 밸런스를 손쉽게 유지해 보세요!</h3>
           </pre>
        </div>
     </div>
     <div class="main">
        <div class="row intro">
            <div class="col-sm-6 col-sm-12">
                <span class="text"></span><span class="blink">|</span>
            </div>
        </div>

        <div class="col-md-6 col-sm-12 login">
           <div class="login-form">
            			<p id = "loginChk">아이디 혹은 비밀번호를 확인해주세요</p>
              <form action = "login.do" method = "post" autocomplete = "off" id = "loginform">
                 <div class="form-group">
                    <label>User ID</label>
                    <input type="text" class="form-control id" name = "user_id" id = "user_id" placeholder="User ID" autocomplete = "off" onKeyDown = "onEnter(this);">
                 </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name = "user_pw" id = "user_pw" placeholder="Password" onKeyDown = "onEnter(this);">
                 </div>
                 <div class = "btns">
                    <button type="button" class="btn btn-success" id = "login_btn" onclick = "login();" return false;">로그인</button>
                    <button type="button" class="btn btn-secondary" id = "regis_btn" onclick = "location.href = 'regisform.do'">회원가입</button>
               </div>
            </form>
          </div>  <hr>
            <div class="row">
                <div class = "container-fluid">
                    <div class = "row">
                        <div class="col-sm-2 col-2 offset-sm-3">
                            <img class = "img-fluid rounded-circle" src="resources/img/kakao.png" onclick = "">
                        </div>
                        <div class="col-sm-2 col-2">
                            <img class = "img-fluid rounded-circle" src="resources/img/naver.png" onclick = "">
                        </div>
                        <div class="col-sm-2 col-2">
                        <img class = "img-fluid rounded-circle" src="resources/img/google.png" onclick = "">
                        </div>
                    </div>
                </div> 
            </div>
        </div>
   
        </div>
     
 <script type = "text/javascript">
	window.onload = function()
	{
		const content = "케어뱅크에 오신 것을 환영합니다! \n 서비스 이용을 위해 로그인을 해주세요!";
        const text = document.querySelector(".text");
        let i = 0;

        function typing(){
            if (i < content.length) {
            let txt = content.charAt(i);
            text.innerHTML += txt=== "\n" ? "<br/>": txt;
            i++;
            }
        }
        setInterval(typing, 200); 
        
	}

	$(function(){
		$("#loginChk").hide(); 
	});
	
	function onEnter(event){
		var keycode = event.keyCode;
	
		if(keycode == 13){
			loginform.login(); 			
		}
	};

	function login(){	
		var user_id = $("#user_id").val().trim();
		var user_pw = $("#user_pw").val().trim();
		console.log(user_id + user_pw);
		
		var loginInfo = {
				"user_id":user_id,
				"user_pw":user_pw
		};
		
		if(user_id == null || user_id == "" || user_pw == null || user_pw == "") {
			alert("아이디 또는 비밀번호를 입력해주세요.");
		}
		else{
			$.ajax({
				type: "POST",
				url:	 "login.do",
				data: JSON.stringify(loginInfo),
				contentType: "application/json",
				dataType: "json",
				success: 
					function(msg){
						if(msg.check == true){
							location.href = "main.do";
						}
						else{
							$("#loginChk").show(); 
						}
					},
				error: function(){
					alert("에러: 통신실패");
				}
			});
		}
	}
	
	 
</script>
</body>
</html>