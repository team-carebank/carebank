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


div#insert-area {
    height: 80vh;
    align-items: center;
    display: grid;
    justify-items: center;
    margin-top:30px;
}

body {
	background-color: #bcccc1;	
}

.change > *{
	margin-block: 10px;
	text-align: center;
}
input{
	width: 300px;
	height: 30px;
	text-align: center;
	border-radius: 4px;
	border: 1px solid #92a197;
	
}

.btn{
	width: 304px;
	background-color: #92a197;
	color: white;
}
.new_pw_input {
	display: none;
}

#setpw_btn {
	display: none;
}

span{
	color: #476e5d;
	display:none;
}
</style>
<body>
	<div class="insert-area" id="insert-area">
		<h2>비밀번호 변경</h2>
		<div class="change">
			<div>
				<span class = "error_msg"></span>
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

			<div class="btn_area">
				<input type="button" class="btn" id="chkpw_btn" value="확인"
					id="change_button" onclick="change();"> <input
					type="button" class="btn" id="setpw_btn" value="확인"
					id="change_button" onclick="set_newpw();">
			</div>

		</div>
	</div>


	<script type="text/javascript">

	function change(){
		var new_pw_input = $(".new_pw_input");
		
		var old_pw = $("#old_pw").val().trim();
		var chkpw = {"old_pw" : old_pw};
		
		var error_msg = $(".error_msg");
		console.log(error_msg);
	
		
		if(old_pw != null && old_pw != ""){
			$.ajax({
				url: "pwchk.do",
				type: "post",
				data: chkpw,
				
				success: 
					function(res){
					
						if(res){// 현재비번이 맞을경우 새 비번 입력창 보이기
							
							$("#old_pw").hide();
							$("#chkpw_btn").hide();
							error_msg.hide();
							
							$(".new_pw_input").show();
							$("#setpw_btn").show();
						}
						else{
							error_msg.html("비밀번호가 틀렸습니다.")
							error_msg.show();
						
						}
					},
				error:
					function(){
						alert("이전비밀번호-통신실패");
					}	
			});
		}
		else{
			$();
		}
	};
	
	function set_newpw(){
		var new_pw = $("#new_pw").val().trim();
		var confirm_pw = $("#confirm_pw").val().trim();
		var error_msg = $(".error_msg");

		if(new_pw == confirm_pw){// 동일하게 입력되었을때 비번 변경 function 실행
	
			changepw(new_pw);	
		}
		else{
			error_msg.html("비밀번호가 일치하지않습니다.");
			error_msg.show();
		}
	};
	
	function changepw(new_pw){
		var error_msg = $(".error_msg");
		if(new_pw != null && new_pw != ""){
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
				alert("새 비밀번호-통신실패")
			}
		});
	}
		else{
			error_msg.html("비밀번호를 새로 입력하세요.");
			error_msg.show();
		}
	}


</script>




</body>
</html>