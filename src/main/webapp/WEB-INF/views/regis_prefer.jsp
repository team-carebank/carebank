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
                      <p class="text-center h6 fw-bold mb-1 mx-1 mx-md-4 mt-4">관심사 설정</p>
      
                        <div class="d-flex flex-row align-items-center">
                            <div class="form-outline flex-fill mb-0">
                                <h3>만성질환</h3>
                                <!--<label class="form-label" for="user_id">만성질환</label><br><br>-->
                                    <input type = "checkbox" name = "prefer" value = "1">편두통<br>
                                    <input type = "checkbox" name = "prefer" value = "2">변비<br>
                                    <input type = "checkbox" name = "prefer" value = "3">여드름/두피염/아토피<br>
                                    <input type = "checkbox" name = "prefer" value = "4">빈혈과 어지러움/저혈압<br>
                                    <input type = "checkbox" name = "prefer" value = "5">비염<br>
                                    <input type = "checkbox" name = "prefer" value = "6">소화불량<br>
                                    <input type = "checkbox" name = "prefer" value = "7">심장의 뻐근함/혈액순환<br>
                                    <input type = "checkbox" name = "prefer" value = "8">디스크/허리통증/관절<br>
                                    <input type = "checkbox" name = "prefer" value = "9">고지혈증/고혈압<br>
                                <hr>
                            </div>

                            <div class="form-outline flex-fill mb-0">
                                    <h3>건강증진</h3>
                                    <!--<label class="form-label" for="user_id">건강증진</label><br><br>-->
                                    <input type = "checkbox" name = "prefer" value = "10">노화예방<br>
                                    <input type = "checkbox" name = "prefer" value = "11">면역력 강화<br>
                                    <input type = "checkbox" name = "prefer" value = "12">여성건강<br>
                                    <input type = "checkbox" name = "prefer" value = "13">남성건강<br>
                                    <input type = "checkbox" name = "prefer" value = "14">눈건강<br>
                                    <input type = "checkbox" name = "prefer" value = "15">흡연자를 위한<br>
                                <hr>
                                </div>


                            </div><!--end-->
                            
                        <div class="d-flex flex-row align-items-center">
                            <div class="form-outline flex-fill mb-0">
                                <h3>멘탈관리</h3>
                                  <!--<label class="form-label" for="user_id">멘탈관리</label><br><br>-->
                                
                                  <input type = "checkbox" name = "prefer" value = "16">스트레스 완화<br>
                                  <input type = "checkbox" name = "prefer" value = "17">세로토닌 완화<br>
                                  <input type = "checkbox" name = "prefer" value = "18">불면증/수면관리<br>
                                  <input type = "checkbox" name = "prefer" value = "19">명상<br>

                                  <hr>
                            </div>
      
                            <div class="form-outline flex-fill mb-0">
                                <h3>다이어트</h3>
                                <!--<label class="form-label" for="user_id">다이어트</label><br><br>-->
           
                                <input type = "checkbox" name = "prefer" value = "20">균형잡힌 식단<br>
                                <input type = "checkbox" name = "prefer" value = "21">체중감량<br>
                                <input type = "checkbox" name = "prefer" value = "22">체중증량<br>
                                <hr>
                            </div>
                        </div><!--end22-->
                        	<input type = "hidden" name = "user_no" id = "user_no" value = "${login_info.user_no }">
                      	<input type = "button" onclick ="setprefer();" value = "설정">
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
	function setprefer(){
		var user_no = Number($("#user_no").val());
		var subcat_id = new Array();
		$("input[name=prefer]:checked").each(function(){
			subcat_id.push(Number(this.value));
		});
		
		console.log(subcat_id);
		let param = {"subcat_id":subcat_id, "user_no":user_no};
		console.log(param);
		
		$.ajax({
			url: "setprefer.do",
			type: "post",
			data: param,
			success: 
				function(res){
				if(res){
				alert("선호도가 설정되었습니다.");
			 	location.href = "myinfo.do";
					
				}
				else{
					alert("선호도 설정에 실패하였습니다.")
				}
				
				},
				
			fail:
				function(){
				
				alert("통신 실패")
			}
		});//ajax end 
		
		
		};
		
		
	
 	
 	
 
</script>


</body>
</html>