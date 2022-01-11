<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 기록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<style>
body {
	display: grid;
	width: 100vh;
	height: 100vh;
	justify-items: center;
	align-items: center;
}

body>div {
	display: grid;
	width: 80vh;
	height: 80vh;
	box-shadow: 0 0 10px gainsboro;
}

.popup-content {
	background-color: lightyellow;
	display: grid;
	justify-items: center;
	align-items: center;
	justify-items: center;
	display: grid;
}

.popup-body-form {
	display: grid;
	margin-block: 20px;
	align-items: center;
	justify-items: center;
}

.popup-body-form>* {
	margin-block-end: 10px;
}

input:not(input[type="radio"]) {
	width: 200px;
	text-align: center;
	font-size: 12pt;
}

#meal_name {
	border: 0;
	background: linear-gradient(to top, #FFE400 50%, transparent 50%);
}

#regdate {
	margin-block-end: 0;
}

#mymeal, #delete-mymeal {
	width: 100%;
	height: 20px;
	border: none;
	background-color: transparent;
}

#mymeal:hover, #delete-mymeal:hover {
	font-weight: bold;
	cursor: pointer;
}

.popup-body-button{
	padding-bottom: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
<script>
$(function(){
	var currentMealTime = document.querySelectorAll("input[name='meal_time']");
	
	for (var i=0; i<currentMealTime.length; i++){
		if (currentMealTime[i].value == '${before.meal_time}'){
			$(currentMealTime[i]).attr("checked", "checked");
		}
	}
});
	function today() {
		let d = new Date();
		let currDate = d.getDate();
		let currMonth = d.getMonth() + 1;
		let currYear = d.getFullYear();
		return currYear + "-"
				+ ((currMonth < 10) ? '0' + currMonth : currMonth) + "-"
				+ ((currDate < 10) ? '0' + currDate : currDate);
	}
	
	$(document).on("change", "#regdate", function(e) {
		if (e.currentTarget.value > today()) {
			alert("오늘 날짜 이후로는 기록할 수 없습니다!");
			e.currentTarget.value = today();
		}
	});
	$(document).on("click", "input[type='button']#mymeal", function(e) {
		let record_id = document.querySelector("input[name='record_id']").value;
		let meal_name = document.querySelector("input[name='meal_name']").value;
		let meal_time = document.querySelector("input[name='meal_time']:checked").value;
		let regdate = document.querySelector("input[name='regdate']").value;

		if (meal_name == "" || meal_name == null) {
			alert("식단을 입력하세요.");

			return false;
		}

		$.ajax({
			url : 'updatemymeal.do',
			type : 'post',
			data : JSON.stringify({
				record_id : record_id,
				meal_name : meal_name,
				meal_time : meal_time,
				regdate : regdate
			}),
			contentType : 'application/json',
			success : function(res) {
				if (res) {
					alert("다이어리에 기록되었습니다!");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("다이어리에 기록되지 않았습니다.");
					window.close();
				}
			},
			error : function() {
				alert("통신 실패");
			}
		});
	});
	$(document).on("click", "input[type='button']#delete-mymeal", function(e) {
		var confirmVal = confirm("정말로 지우시겠습니까?");
		
		if(confirmVal){
			let record_id = document.querySelector("input[name='record_id']").value;

			$.ajax({
				url : 'deletemymeal.do',
				type : 'post',
				data : JSON.stringify({record_id}),
				contentType: "application/json",
				success : function(res) {
					if (res) {
						alert("다이어리에서 기록을 지웠어요!");
						opener.parent.location.reload();
						window.close();
					} else {
						alert("다이어리에서 기록을 지우지 못했어요.");
						window.close();
					}
				},
				error : function() {
					alert("통신 실패");
				}
			});
		}
	});
	
	$(document).on("click", "#meal_name", function(e){
		var w = 600;
		var h = 600;
		var option = getOption(w, h);
		var url = "tm.do"
		var name = "tm/tmpage";
		window.open(url, name, option);
	});
</script>
</head>
<body>
	<div>
		<div class="popup-content">
			<div class="popup-head">
				<h1>&#127828 식단 기록 &#127834</h1>
			</div>
			<div class="popup-body">
				<div class="popup-body-form">
					<input type="hidden" name="record_id" value="${before.record_id }">
					<h3>오늘 먹은 것은...</h3>
					<input type="text" id="meal_name" name="meal_name"
						readonly="readonly" placeholder="클릭하여 식단 기록하기!"
						value="${before.meal_name }">
				</div>
				<div class="popup-body-form">
					<h3>언제 먹었나요?</h3>
					<div>
						<input type="radio" name="meal_time" id="breakfast" value="아침"
							checked> <label for="breakfast">아침</label> <input
							type="radio" name="meal_time" id="lunch" value="점심"> <label
							for="lumch">점심</label> <input type="radio" name="meal_time"
							id="dinner" value="저녁"> <label for="dinner">저녁</label>
					</div>
				</div>
				<div class="popup-body-form">
					<h3>날짜를 기록하세요.</h3>
					<input type="date" name="regdate" id="regdate"
						value="${before.regdate }">
				</div>
				<div class="popup-body-button">
					<input type="button" id="mymeal" value="다이어리에 기록하기!"> <input
						type="button" id="delete-mymeal" value="다이어리에서 지우기!">
				</div>
			</div>
		</div>
	</div>
</body>
</html>