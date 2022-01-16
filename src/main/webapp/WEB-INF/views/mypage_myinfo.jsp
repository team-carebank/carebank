<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
body {
	overflow: scroll;
}

.container {
	width: 100%;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	justify-content: center;
	justify-content: center;
}

.admin-info {
	width: 100%;
	height: 100px;
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	justify-content: center;
	align-items: center;
	box-shadow: 0px 0px 2px gainsboro;
	background-color: #04AA6D;
	color: white;
	position: sticky !important;
}

.admin-info * {
	justify-self: center;
	align-self: center;
}

.admin-info *:not(.admin-info *:nth-child(2)):hover {
	cursor: pointer;
}

.admin-info *:nth-child(2) {
	grid-column: 2/4;
}

.body-content {
	width: 100%;
	display: grid;
	grid-gap: 0;
	grid-template-columns: repeat(5, 1fr);
	justify-items: center;
	place-content: center;
}

#add {
	cursor: pointer;
}

.content-admin-main {
	width: 80%;
	min-width: 1000px;
	grid-column: 2/6;
	justify-self: center;
}

.admin-main-description {
	height: 100px;
}

.admin-main-description>h1 {
	grid-column: 1/3;
}

.admin-main-description>span {
	grid-column: 3/5;
}

.board-header-content, .board-body-content {
	margin-block: 15px;
}

.board-header-content, .board-body-content, .admin-main-description {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	justify-items: center;
	align-items: center;
}

.board-body-content {
	padding-block: 10px;
}

.board-header, .board-body {
	background-color: white;
}

.board-header {
	margin-block-end: 0;
	font-weight: bold;
}

.board-body {
	margin-block-start: 0;
}

.board-header {
	border-top: 1px solid gainsboro;
	border-bottom: 1px solid gainsboro;
}

.board-content-name {
	grid-column: 2/4;
	border: none;
}

.board-content-title {
	grid-column: 1/3;
}

.board-header#footer * {
	grid-column: 5;
}

.cancle {
	width: 50px;
	height: 30px;
}

.preferlist_btn {
	text-align: center;
	width: 200px;
	height: 50px;
	margin: 10px;
	font-size: 12pt;
	border-radius: 10px;
	border: none;
	background-color: #287743;
	color: white;
}

.preferlist {
	margin-left: 600px;
}

#myinfo {
	background-color: #287743;
	color: white;
}

input {
	height: 30px;
	font-size: 12pt;
	background-color: #f1f2f0;
	border-radius: 8px;
	text-align: center;
}

.update_img {
	width: 250x;
	height: 60px;
	cursor: pointer;
	margin-top: 30px;
}

.new_btn {
	height: 40px;
	width: 80px;
	margin-left: 10px;
	background-color: #F6D860;
	border: none;
}
</style>
</head>
<body>
	<header>
		<%@include file="../../header.jsp"%>
	</header>
	<div class="container">

		<div class="body-content">
			<%@ include file="mypage_side.jsp"%>
			<div class="content-admin-main">
				<div class="admin-main-description">
					<h1>${login_info.user_name }님의 정보</h1>


				</div>
				<div class="admin-main-content">
					<div class="main-content-board">
						<div class="board-header"></div>
						<div class="board-body">
							<div class="board-body-content">
								<span class="sub_title">이름:</span> <input type="text"
									class="board-content-name" id="user_name"
									value="${login_info.user_name}" readonly="true"> <input
									type="hidden" value="${login_info.user_no }" id="user_no">
							</div>
							<div class="board-body-content">
								<span class="sub_title">아이디:</span> <input type="text"
									class="board-content-name" id="user_id"
									value="${login_info.user_id }" readonly="true">

							</div>
							<div class="board-body-content">
								<span class="sub_title">핸드폰 번호:</span> <input type="number"
									class="board-content-name" id="phone"
									value="${login_info.phone }" readonly="true">

							</div>
							<div class="board-body-content">
								<span class="sub_title">이메일:</span> <input type="email"
									class="board-content-name" id="email"
									value="${login_info.email }" readonly="true">

							</div>
							<div class="board-body-content">
								<span class="sub_title">생년월일:</span> <input type="date"
									class="board-content-name" id="birth"
									value="${login_info.birth }" readonly="true">

							</div>


						</div>
						<div class="board-header" id="footer">
							<img src="resources/img/info_update.png" class="update_img"
								onclick="change();">


							<div class="board-header-content">

								<span class="board-content-config" id="add" onclick="changePop();">비밀번호
									재설정</span>
							</div>
							<div class="board-header-content">
								<span class="board-content-config" id="add"
									onclick="disable(${login_info.user_no})">회원탈퇴</span>

							</div>
						</div>
						<div class="board-header">
							<div class="admin-main-description">
								<h1>${login_info.user_name }님의 관심사</h1>
							</div>

						</div>

						<div class="perferlist">
							<c:choose>
								<c:when test="${fn:length(preferlist) == 0 }">
									<div>관심사가 없습니다.</div>
								</c:when>

								<c:otherwise>
									<c:forEach items="${preferlist }" var="preferDto">
										<input type="button" class="preferlist_btn"
											value="#${preferDto.subcat_name }">
									</c:forEach>
						</div>
						<img src="resources/img/prefer_btn.png" class="update_img"
							onclick="location.href = 'regis_prefer.do?user_no=${login_info.user_no}'">

						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>



		</div>

	</div>
	</div>
	</div>
	</div>

	<script type="text/javascript">
    
    	//속성 변경
    	function change(){
    		var input= $('.board-content-name');
    		var new_btn = "<input type = 'button' id = 'new_update' onclick = 'update();' class = 'new_btn' value = '수정'><input type = 'button' id = 'cancel' onclick = 'cancel();' class = 'new_btn' value = '취소'>";
    		    		//readonly 속성 제거 후 focus
    		for(var i = 0; i < input.length; i++){
		   		input[i].removeAttribute('readonly')
    		}
    		input[0].focus();
    		
    		//수정버튼 클릭시 수정버튼 숨김/ 취소버튼 보이기
   			var update_btn = $("#footer").children().hide();
    	
   			$("#footer").append(new_btn);
    	};
    	
    	//취소시 버튼 다시 보이기
    	function cancel(){
    		$('#new_update').remove();
    		$('#cancel').remove();
    		$('#footer').children().show();
    		
    		var input= $('.board-content-name');
    		for(var i = 0; i < input.length; i++){
		   		input[i].setAttribute('readonly', 'true')
    		}
    	};
    	
    	function update(){
    	
    		var user_no = $('#user_no').val();
    		var user_name = $('#user_name').val();
  			var user_id = $('#user_id').val();
  			var phone = $('#phone').val();
  			var email =$('#email').val();
  			var birth = $('#birth').val();
  			
  			var update_val = {"user_no" : user_no, "user_name" : user_name, "user_id" : user_id, "phone" : phone,
  								"email" : email, "birth" : birth}
  			$.ajax({
  				url: "myinfoUpdate.do",
  				type: "post",
  				data: JSON.stringify(update_val),
  				contentType: "application/json",
  				dataType: "json",
  				success:
  					function(res){
  					if(res){
  						alert("정보가 수정되었습니다.")
  						window.location.reload();
  						
  					}
  					else{
  						alert("수정에 실패하였습니다.");
  					}
  				},
  				fail:
  					function(){
  						alert("통신실패")
  				}
  			});//ajax end
    	};
    
		function disable(user_no){
			var result = confirm("정말 탈퇴하시겠습니까?");
			
			if(result){
				var idchk = prompt("탈퇴를 위해 회원님의 아이디를 입력해주세요", "");
				var user_id = "${login_info.user_id}";
				if (user_id === idchk){
					alert("탈퇴되었습니다.")
					location.href = "disable.do?user_no="+user_no;
				}
				else{
					alert("아이디가 일치하지않습니다. 다시시도하세요.");
					return;
				}
			}
			
		};
		
		function changePop(){
	    	var w = 300;
	    	var h = 300;
	    	
	    	var option = getOption(w,h);
	    	var url = "changePop.do"
	    	var name = "changepw_Popup";
	    
	    	window.open(url, name, option);
			
			
		}
		
		 function getOption(w, h){
		        //팝업이 화면의 중앙에 오게 설정
		        var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
		        var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
		        var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
		        var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
		        var left = ((width / 2) - (w / 2)) + dualScreenLeft;
		        var top = ((height / 2) - (h / 2)) + dualScreenTop;

		        return "width="+w+", height="+h+", left="+left+", top="+top+", location=no, resizable=no";
		    }
    
    
    </script>



</body>
</html>