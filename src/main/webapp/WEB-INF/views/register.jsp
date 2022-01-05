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
      
                      <form class="mx-1 mx-md-4" action = "regis.do" method = "post" autocomplete = "off">
      
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="user_name">이름</label>
                            <input type="text" id="user_name" class="form-control" name = "user_name" required = "true" autofocus/>
                            
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="user_id">아이디</label>
                            <input type="text" id="user_id" class="form-control" name = "user_id" required = "true"/>
                            <div class = row>
                              <div class = "col-md-6">
                              	<span class = "idchk"></span>
                            </div>
                              
                            <div class="d-flex flex-row align-items-center">
                              <div class="form-outline flex-fill mb-0">
                                <label class="form-label" for="user_pw">비밀번호</label>
                                <input type="password" id="user_pw" class="form-control" name = "user_pw" required = "true" placeholder="8-12자리 영문, 숫자 조합 "/>
                              </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center">
                              <div class="form-outline flex-fill mb-0">
                                <label class="form-label" for="pwchk">비밀번호 확인</label>
                                <input type="password" id="pwchk" class="form-control" required = "true" />
                              </div>
                            </div>
                            </div>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="email">이메일</label>
                            <input type="email" id="email" class="form-control" name = "email" required = "true" placeholder="careuser@carebank.com"/>
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="phone">휴대폰</label>
                            <input type="number" id="phone" class="form-control" name = "phone" required = "true" placeholder="'-'없이 숫자만 입력하세요."/>
                            <input type="number" id="phone_verify" class="form-control" required = "true" placeholder="인증번호 입력"/>
                            <input type = "button" class = "btn btn-success" value = "인증" onclick = "">
                            
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center">
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="birth">생년월일</label>
                            <input type="date" id="birth" class="form-control" name = "birth" required = "true"/>
                          </div>
                        </div>
      
      
                        <div class="form-check d-flex justify-content-center mb-5">
                          <input
                            class="form-check-input me-2"
                            type="checkbox"
                            value=""
                            id="form2Example3c"
                          />
                          <label class="form-check-label" for="form2Example3">
                            I agree all statements in <a href="#!">Terms of service</a>
                          </label>
                        </div>
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



      <section class="regis_1">
        <div class="container">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px;">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
      
                      <p class="text-center h1 fw-bold mx-1 mx-md-4 mt-4">회원가입</p>
                      <p class="text-center h6 fw-bold mb-1 mx-1 mx-md-4 mt-4">관심사 추가</p>
                      
                      <div class = row>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c1" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c2" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c3" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c4" onclick = "">
                        </div>
                      </div>
                      <div class = row>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c5" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c6" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c7" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c8" onclick = "">
                        </div>
                      </div> <div class = row>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c9" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c10" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c11" onclick = "">
                        </div>
                        <div class = "col-md-3">
                          <input type = "button" class = "btn btn-success" value = "c12" onclick = "">
                        </div>
                      </div>
                      </div>
                      	
                      	<input type = "submit" values = "가입">
                      </form>
                      
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
<script type = "text/javascript">
	$('#user_id').on("propertychange change keyup paste input", function(){

	console.log("keyup 테스트");	

});// function 종료



</script>
</body>
</html>