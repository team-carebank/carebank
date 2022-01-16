<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'S-CoreDream-3Light';
	margin: 0;
}

body {
	background-color: #bcccc1;
}

.new_pw_input {
	display: none;
}

#setpw_btn{
	display: none;
}


</style>
<body>
	<div class="insert-area" id="insert-area">
		<h2>비밀번호 변경</h2>
		<div class="change">
			<div>
				<input type="password" class="password" id="old_pw"
					placeholder="현재 비밀번호를 입력하세요.">
			</div>
			<div class="new_pw_input">
				<div>
					<input type="password" class="password" id="new_pw"
						placeholder="새로운 비밀번호를 입력하세요.">
				</div>
				<div>
					<input type="password" class="password" id="confirm_pw"
						placeholder="비밀번호를 다시 입력하세요.">
				</div>
			</div>
			
			<div class = "btn_area">
			<input type="button" class="btn" id = "chkpw_btn" value="확인" id="change_button"
				onclick="change();">
				
			<input type="button" class="btn" id = "setpw_btn" value="확인" id="change_button"
				onclick="set_newpw();">
			</div>
			
		</div>
	</div>


	<script type="text/javascript">

function change(){
	var new_pw_input = $(".new_pw_input");
	
	var old_pw = $("#old_pw").val().trim();
	var chkpw = {"old_pw" : old_pw};

	
	if(old_pw != null || old_pw != ""){
		$.ajax({
			url: "pwchk.do",
			type: "post",
			data: chkpw,
			
			success: 
				function(res){
				
					if(res){// 현재비번이 맞을경우
						$(".new_pw_input").css({
							'display' : 'inline-block'
						});
						$("#chkpw_btn").css({
							'display': 'none'
						});
						$("#setpw_btn").css({
							'display' : 'inline-block'
						});
					
						
					}
					else{
						alert("비밀번호가 틀렸습니다.")
					}
				},
			error:
				function(){
				alert("이전 비밀번호-통신실패");
			}	
		});
	}
	else{
		alert("비밀번호를 입력해주세요.");
	}
	
		
	};
	
	function set_newpw(){
		var new_pw = $("#new_pw").val().trim();
		var confirm_pw = $("#confirm_pw").val().trim();

		if(new_pw == confirm_pw){// 동일하게 입력되었을때
	
			changepw(new_pw);	
		}
	}
	
	function changepw(new_pw){
		$.ajax({
			url: "changepw.do",
			type: "post",
			data: {"new_pw":new_pw},
			
			success: 
				function(res){
					if(change){
			
						alert("비밀번호가 변경되었습니다.")
						window.close();
						opener.location.reload();
					}
					else{
						alert("비밀번호 변경에 실패했습니다.")
					}
				},
			
			fail:
				function(){
				alert("통신실패")
			}
		});
	}


</script>




</body>
</html>