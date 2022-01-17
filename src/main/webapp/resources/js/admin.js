function getOption(w, h) {
	//팝업이 화면의 중앙에 오게 설정
	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	var left = ((width / 2) - (w / 2)) + dualScreenLeft;
	var top = ((height / 2) - (h / 2)) + dualScreenTop;

	return "width=" + w + ", height=" + h + ", left=" + left + ", top=" + top + ", location=no, resizable=no";
}

function resize(obj) {
	obj.style.height = "1px";
	obj.style.height = (12 + obj.scrollHeight) + "px";
}

$(document).on("click", "#upload", function(e) {
	var w = 600;
	var h = 600;

	var option = getOption(w, h);

	var url = "upreq.do";
	var name = "이미지 업로드";

	window.open(url, name, option);
});
