<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
  @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
  }
  body {
    background-color: #287743;
      font-family: 'S-CoreDream-3Light';
    
  }
  .regis_1{
    width: 100%;
    height: 100%;
    padding-top: 30px;
    padding-bottom: 30px;
  }
 input{
   margin-bottom: 5px;
 }
.form-label{
  margin-bottom:0px;
}

/* 중복아이디 체크 */
.id_chk{

	display : none;
	font-size: 9pt;
	
}
.btn{
	width: 100px !important;
	font-size:10pt;
	
}
 em{
 	color: red;
 }
 
 #require_note{
 	font-size:10pt;
 }

</style>
</head>
<body>
   
    <section class="regis_1">
        <div class="container">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px;">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
      
                      <p class="text-center h1 fw-bold mx-1 mx-md-4 mt-4">회원가입</p>
                      <p class="text-center h6 fw-bold mb-1 mx-1 mx-md-4 mt-4">기본정보</p>
                      <p id = "require_note">* 필수 입력사항</p>
      

                      <form class="mx-1 mx-md-4" action = "regis.do" method = "post" autocomplete = "off" onsubmit="return validate();">

      
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="user_name">이름</label><em>*</em>
                            <input type="text" id="user_name" class="form-control" name = "user_name" required = "true" autofocus/>
                            
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="user_id">아이디</label><em>*</em>
                            <input type="text" id="user_id" class="form-control" name = "user_id" required = "true"/>
                            <div class = row>
                              <div class = "col-md-6">

                           		<span class = "id_chk"></span><br>
                 			</div>

                            <div class="d-flex flex-row align-items-center">
                              <div class="form-outline flex-fill mb-0">
                                <label class="form-label" for="user_pw">비밀번호</label><em>*</em>

                                <input type="password" id="user_pw" class="form-control" name = "user_pw" 
                                required = "true" placeholder="8-12자리 영문, 숫자 조합" 
                                onKeyPress = "pw_chk()" />
                                
                              </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center">
                              <div class="form-outline flex-fill mb-0">
                                <label class="form-label" for="pwchk">비밀번호 확인</label>
                                <input type="password" id="user_pw_re" class="form-control" required = "true" onchange = "pwchk();"/>
                                <div class = "col-md-6">

                           		<span class = "pwchk"></span><br>
                 			</div>
                              </div>
                            </div>
                            </div>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="email">이메일</label>
                            <input type="email" id="email" class="form-control" name = "email" placeholder="careuser@carebank.com"/>
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="phone">휴대폰</label>
                            <input type="number" id="phone" class="form-control" name = "phone" placeholder="'-'없이 숫자만 입력하세요."/>

                            
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="birth">생년월일</label>
                            <input type="date" id="birth" class="form-control" name = "birth" 
                            value = "2022-01-01" max = "2021-01-18">
                          
                          </div>
                        </div>
                         	
                      	<input type = "submit" value = "가입">
                      </form>
      
      
                   
                    </div>
                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
      
                      <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-registration/draw1.png" class="img-fluid">
      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>



 
 <script type="text/javascript">
 
 	//아이디 중복체크
	$('#user_id').on("propertychange change keyup paste input",function(){
		var user_id = $('#user_id').val();
		var idchk = {"user_id" : user_id}
		console.log(user_id);
		
		$.ajax({
			type: "post",
			url: "idchk.do",
			data: idchk,
			success: 
				function(res){
					var msg = document.getElementsByClassName("id_chk")[0];
				if(res == 'success'){
					
					msg.innerHTML = "사용가능한 아이디입니다."
					$('.id_chk').css({
						'display' : 'inline-block',
						'color' : 'green'
					});
					return true;
				}
				else{
					msg.innerHTML = "이미 사용중인 아이디입니다."
					$('.id_chk').css({
						'display':'inline-block',
						'color': 'red'
					});
					return false;
				}
			}
		});
	});
 	
 	//비밀번호 유효성검사
 	function pw_chk(){
 		var pw = $("#user_pw");
 		var num = pw.val().search(/[0-9]/g);
 		var eng = pw.val().search(/[a-z]/ig);
 		
 		if((window.event.key == "Enter") || (window.event.key == "Tab")){
 			if((pw.val().length < 8 || pw.val().length > 12) || (num < 0 || eng < 0)){
 				alert("8-12자리 이내의 영문, 숫자 조합으로 입력해주세요.");
 				setTimeout(function(){
	 				pw.focus();
 				});
 				return false;
 			}
 			else{
 				return true;
 			}
 			
 		}
 	};
 	
 	function validate(){
 		if(pw_chk() == fale){
 			return false;
 		}
 	}
 	
 	function pwchk(){
 		
 		var pw1 = $("#user_pw").val().trim();
 		var pw2 = $("#user_pw_re").val().trim();
 		var pwchk = document.getElementsByClassName("pwchk")[0];
 		
 		if(pw1 == pw2){
 			pwchk.innerHTML = "비밀번호가 일치합니다";
 				$('.pwchk').css({
					'color': 'green',
					'font-size' : '9pt'
				});
 		}
 		else if(pw1 != pw2){
 			
 			pwchk.innerHTML = "비밀번호가 틀립니다";
				$('.pwchk').css({
				'color': 'red',
				'font-size' : '9pt'
			});
 		}
 	}
 	
 	//회원가입 버튼 (유효성검사 확인)
 	/* function submit(){
 		if()	
 	} */
 	
 	
 
</script>
</body>
</html>