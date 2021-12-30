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
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate','today');
	$("#endDate").datepicker('setDate','today');
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
		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data : scheduleData,
			url : "addschedule.do",
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
			<h1 class = "zTree-h1">병원 기록</h1>
		</div>
		<div class = "group-body">
			<form id = "scheduleData">
				<div class="top">
					<input class="subject" id="subject" type="text" name="hospital_name" placeholder="병원명을 입력해주세요.">
					<input type="hidden" id="userno" name="user_no">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">오늘날짜 </h3>
				</div>
				<div class="domain">
					<input class="date" id="startDate" type="text" name="regdate">
				</div>
				<div class="domain">
					<h3 class = "z-Tree-h3">예약일 </h3>
				</div>
				<div class="domain">
					<input class="date" id="endDate" type="text" name="resdate">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">메모 </h3>
				</div>
				<div class="domain">
					<textarea rows="10" cols="70" class="memo" id="memo" name="memo" style="resize:none;"></textarea>
				</div>
			</form>
				<button class="ok-button" type="button" onclick="click_ok();">확인</button>
		</div>
	</div>
</body>
</html>