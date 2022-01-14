<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- detepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

<!--  datetiempicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" /> -->
 
 <style>
 	body{
	display : grid;
	width : 100vh;
	height : 100vh;
	justify-items : center;
	align-items : center;
}
body>div{
	display : grid;
	width : 100vh;
	height: 100vh;
	box-shadow: 0 0 10px gainsboro;
}
.group{
	background-color: beige;
	display: grid;
	justify-items: center;
	align-items: center;
	justify-items: center;
	display: grid;
}
.top{
	display : grid;
	align-items: center;
	justify-items: center;
}
.domain{
	display: grid;
	align-items: center;
	justify-items: center;
}
.domain>*{
	margin-block-end: 10px;
}
.ok-button{
	width: 100%;
	height: 50px;
	font-size: large;
	border: none;
	background-color: transparent;
}
.ok-button:hover {
	font-weight: bold;
	cursor: pointer;
}
 </style>
 
<script type="text/javascript">
$(function() {

	var regdate = '<fmt:formatDate value="${dto.regdate }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>';
	var resdate = '<fmt:formatDate value="${dto.resdate }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>';
	
	console.log(regdate);
	console.log(resdate);

});

$.fn.serializeObject = function(){
	var o = {};
	var a = this.serializeArray();
	$.each(a, function(){
		var name = $.trim(this.name),
			value = $.trim(this.value);
		
		if(o[name]){
			if(!o[name].push) {
				o[name] = [o[name]];
			}
			o[name].push(value || '');
		}else{
			o[name] = value || '';
		}
	});
	return o;
};
	 function click_ok(){
		var updateData = $("form#updateData").serializeObject();
		$.ajax({
			data : JSON.stringify(updateData),
			url : "scheduleupdate.do",
			type : "post",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			
			success : function(data){
				console.log(data);
				alert("수정 성공!!");
				 window.location.href = "http://localhost:8787/carebank/diary.do";
			}
		});
	}; 
	
	 function click_button(){
		var updateData = JSON.stringify($("form#updateData").serializeObject());
		
		$.ajax({
			data : updateData,
			url : "scheduledelete.do",
			type : "post",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			
			success : function(data){
				console.log(data);
				alert("삭제 성공!");
				window.location.href = "http://localhost:8787/carebank/diary.do";
			}
		});
	};
	
	$(document).on("change", "#endDate", function(e){
		console.log(e);
	});
	
</script>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class = "group-head">
			<h1 class = "zTree-h1">&#128198 병원 기록 &#127973</h1>
		</div>
		<div class = "group-body">
			<form id = "updateData">
				<div class="top">
					<input class="subject" id="subject" type="text" name="hospital_name" placeholder="병원명을 입력해주세요." value="${dto.hospital_name }">
					<input type="hidden" id="user_no" name="user_no">
					<input type="hidden" id="hospital_no" name="hospital_no" value="${dto.hospital_no }">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">오늘날짜 </h3>
				</div>
				<div class="domain">								
				<fmt:formatDate value="${dto.regdate }" type="both" pattern="yyyy-MM-dd" var="date"/>
				<fmt:formatDate value="${dto.regdate }" type="both" pattern="HH:mm" var="time"/>
					<input type="datetime-local" class="date" id="startDate" name="regdate" value='${date }T${time}' readonly="readonly">
				</div>
				<div class="domain">
					<h3 class = "z-Tree-h3">예약일 </h3>
				</div>
				<div class="domain">					
					<fmt:formatDate value="${dto.resdate }" type="both" pattern="yyyy-MM-dd" var="date2"/>
					<fmt:formatDate value="${dto.resdate }" type="both" pattern="HH:mm" var="time2"/>
					<input type="datetime-local" class="date" id="endDate" name="resdate" value='${date2 }T${time2}'>
				</div>
				<div class="domain">
					<h3 class="zTree-h3">메모 </h3>
				</div>
				<div class="domain">
					<textarea rows="10" cols="70" class="memo" id="memo" name="memo" style="resize:none;" >${dto.memo }</textarea>
				</div>
			</form>
				<button class="ok-button" type="button" onclick="click_ok();">다이어리에 병원기록 수정하기!</button>
				<button class="ok-button" type="button" onclick="click_button();">다이어리에 병원기록 삭제하기!</button>
		</div>
	</div>
</body>
</html>