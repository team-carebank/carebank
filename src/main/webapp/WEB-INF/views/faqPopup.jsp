<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

 
    @font-face {
    font-family: 'S-CoreDream-3Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
 }
* {
    font-family: 'S-CoreDream-3Light'; 
    margin: 0;
}
body{
    background-color: #bcccc1;

}
    .new-faq-title{
        width: 500px;
        height: 20px;
        border-radius: 10px;
        border:none;
        margin-bottom: 10px;
        padding: 30px;
    }
    .new-faq-content{
        width: 500px;
        height: 300px;
        resize: none;
        border-radius:10px;
        margin-bottom: 10px;
        padding: 30px;
        border:none;
    }
h2{
    margin-bottom: 30px;
    margin-top:10px;
    
}

 .insert-area{
    display:grid;
    justify-items: center;

 }

 #insert-button{
     width: 80px;
     height: 50px;
     border:none;
     border-radius:4px;

 }
 
 #insert-button:hover{
    background-color: #96b5a0;
}

</style>
<body>
	<div class="insert-area" id="insert-area">
		<h2>FAQ 작성</h2>
		<div class="comment-write">
			<div>
				<input type="text" class="new-faq-title" id="new-faq-title"
					placeholder="FAQ 제목">
			</div>
			<div>
				<textarea class="new-faq-content" id="new-faq-content"
					placeholder="내용을 입력하세요."></textarea>
			</div>
			<input type="button" class="new-faq" value="작성" id="insert-button"
				onclick="insert();">
		</div>
	</div>


<script type = "text/javascript">

function insert(){
	var faqtitle = document.getElementById("new-faq-title").value.trim();
	var faqcontent = document.getElementById("new-faq-content").value.trim();
	var newfaq = {"faqtitle" : faqtitle, "faqcontent" : faqcontent};
	//console.log(newfaq);
	
	if(faqtitle == null ||faqtitle == "")
	{
		alert("제목을 입력하세요.")
	}
	else if(	faqcontent == null || faqcontent == ""){
		alert("내용을 입력하세요.")
	}
	else{
		$.ajax({
			url: "faqinsert.do",
			type: "post",
			data: JSON.stringify(newfaq),
			contentType: "application/json",
			dataType: "json",
			success: 
				function(res){
				
					if(res > 0){
						
						alert("새로운 FAQ가 작성되었습니다.")
						opener.parent.location.reload();
						window.close();
					
					}
					else{
						alert("작성에 실패하였습니다. 다시 시도해주세요.")
					}
				}
			,
			error:
				function(){
				alert("통신실패");
			}	
		});
	}
}

</script>
	



</body>
</html>