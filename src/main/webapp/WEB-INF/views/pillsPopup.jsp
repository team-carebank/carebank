<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	display: grid;
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
$(function(){
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',	//input display formay 변경
		showOtherMonths : true,		//빈 공간에 현재월의 앞뒤월의 날짜를 표기
		showMonthAfterYear : true,	//년도 먼저 나오고, 뒤에 월표시
		changeYear : true,			//콤보박스에서 년 선택 가능
		changeMonth : true,			//콤보박스에서 월 선택 가능
		yearSuffix : "년",			//달력의 년도 부분 뒤에 붙는 텍스트
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],					//달력의 월 부분 텍스트
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],		//달력의 월 부분 tooltip 텍스트
		dayNamesMin : ['일','월','화','수','목','금','토'],											//달력의 요일 부분 텍스트
		dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],							//달력의 요일 부분 tooltip 텍스트
		
	});
	$("#startDate").datepicker();
	
	$("#startDate").datepicker('setDate','today');
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
		var pillsData = JSON.stringify($("form#pillsData").serializeObject());
		
		
		$.ajax({
			data : pillsData,
			url : "pillschedule.do",
			type : "post",
			dataType : "json",
			accept : "application/json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				opener.parent.location.reload();
				window.close();
			}
		});
	};
</script>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class = "group-head">
			<h1 class = "zTree-h1">&#128155 영양제 기록 &#128138</h1>
		</div>
		<div class = "group-body">
			<form id = "pillsData">
				<div class="top">
					<input type="hidden" id="user_no" name="user_no">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">영양제 섭취 날짜</h3>
				</div>
				<div class="domain">
					<input class="date" id="startDate" type="text" name="regdate">
				</div>
			</form>
				<button class="ok-button" type="button" onclick="click_ok();">영양제 기록하기!</button>
		</div>
	</div>
</body>
</html>