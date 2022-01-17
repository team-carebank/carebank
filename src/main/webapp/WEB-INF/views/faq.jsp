<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   
    
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


body, pre{	
    font-family: 'S-CoreDream-3Light';
}
.faq-heading{
    border-bottom: #777;
    padding: 20px 60px;
}
.search-container{
    display: flex;
    
}
.search{
    width: 100px;
    height: 50px;
    text-align: center;
   
}
.search_btn{
    margin-left: auto;
    width: 50px;
    height: 50px;
    text-align: center;
    
}
.faq-container{
    display: flex;
    justify-content: center;
    flex-direction: column;
}
.search{
    width:10%;
    height:50px;
    padding:2px;
    margin: auto;
    margin-bottom: 10px;
}
.hr-line{
  width: 60%;
  margin: auto;
  
}

.faq-title {
    /* background-color: #eee; */
    color: #444;
    cursor: pointer;
    padding: 20px 10px;
    width: 60%;
    border: none;
    outline: none;
    transition: 0.4s;
    margin: auto;
}
.faq-title *{
	font-size: 13pt !important;
}
.faq-body{
    margin: auto;
    /* text-align: center; */
   width: 50%; 
   padding: auto;
}

.insert-area{
    justify-content: center;
}
.new-faq-title{
    width:60%;
    padding: 10px 10px;
    display:flex;
    margin:none;
}
.new-faq-content{
    width:60%;
    padding: 10px 10px;
    display:flex
}

.active,
.faq-title:hover {
    background-color: #287743;
    color: white;
}

.faq-body {
    padding: 0 18px;
    background-color: white;
    display: none;
    overflow: hidden;
}
.faq-title:after {
    content: '\02795'; /* 플러스 (+) 유니코드*/
    font-size: 13px;
    color: #777;
    float: right;
    margin-left: 5px;
}
.active:after {
    content: "\2796"; /* 마이너스 (-) 유니코드*/
}

#write_img{
	width:300px; 
	height:70px; 
	margin: 100px
	
}

.newfaq-content{
   display: grid;
    align-items: left;
    justify-content: left;
    margin-bottom: 30px;


}
.newfaq-title{
	
	width: 600px;
	height: 50px;
	margin-left: 80px;
	border: 1px solid RGB(127, 161, 138);
	border-radius:10px;

} 
.newfaq-textarea{
display:grid;
	align-items: center;
    justify-content: center;
	width: 600px;
	resize:none;
	border: 1px solid RGB(127, 161, 138);
	border-radius: 10px;
}

.new_btn{
	background-color: #287743;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 10px;
	grid-column: 1/3;
	margin-top: 10px;
}   
#cancel_btn{
	
	margin-bottom: 10px;
	width: 100px;
	background-color:RGB(211, 219, 214) !important;
	color: #287743 !important;

}
 pre{
 white-space: pre-wrap;
 font-size: 12pt;
 }

    
    </style>
</head>
<body>
<header>
	<%@ include file = "../../header.jsp" %>
</header>
 <main>
        <h1 class="faq-heading">FAQ: 자주 물어보는 질문</h1>
        <form action='search_faq.do' method='POST' class='form-group'>
            <div class="form-horizontal">
              <input type="text" name = "keyword" id = "keyword"
                  class="search form-control"
                  placeholder="원하는 내용을 검색해보세요. (로그인, 회원가입, 서비스이용 등)"
                  style="width:500px;display:inline-block; height:36px; margin-left: 300px;"/>
          
              <input type="button" onclick = "search();"
                  class="btn btn-primary"
                  style="margin-left:-8px;margin-top:-2px; min-height:36px; width: 100px;background-color: green;"
              value = "검색">
            </div>
          </form>
 
        <section class="faq-container">
         	<c:forEach items="${list}" var="faqdto">
            <div class="faq-one">
                <!-- faq question -->
      
                		<h5 class="faq-title" id = "${faqdto.faqno }">
                		${faqdto.faqtitle}
                		</h5>
              
                <!-- faq answer -->
                <div class = "faq-body">
                    <pre class = "faq-content" id = "${faqdto.faqno }">${faqdto.faqcontent}</pre>
					<c:if test = "${login_info.user_type == 'ADMIN' }">
		                	<div class = "modify_btns">
		                		<input type = "button" class = 'btn btn-primary' value = "수정" onclick = "change_area(${faqdto.faqno}, this);">
		                		<!-- <input type = "button" value = "삭제" onclick = "location.href='faqdelete.do?faqno=${faqdto.faqno}';"> -->
		                		<input type = "button"  class = 'btn btn-primary'value = "삭제" onclick = "deleteFunc(${faqdto.faqno});">	
		                		
		                	</div>
					</c:if>
                </div>
            </div>
            <hr class="hr-line">
			</c:forEach>
        <!-- 관리자 로그인시 작성 버튼 추가 -->
				<c:if test="${login_info.user_type == 'ADMIN' }">
					
					<img src="resources/img/faq_write.png" 
                         style = "width:300px; height:70px; margin-left: 550px; margin-top: 100px; cursor:pointer" onclick = "insertPop();">
				</c:if>
            	

        </section>
        
    </main>
    <script type = "text/javascript">
    
    //faq 토글
    window.onload = function(){
		var faq = document.getElementsByClassName("faq-title");
		var i;
		for (i = 0; i < faq.length; i++) {
			faq[i].addEventListener("click", function () {
				
				this.classList.toggle("active");
			
				//var body = this.nextElementSibling;
				var body = this.nextElementSibling;
				
				if (body.style.display === "block") {
					body.style.display = "none";
				} else {
					body.style.display = "block";
				}
			});
		};
    };
    
    function insertPop(){
    	var w = 600;
    	var h = 600;
    	
    	var option = getOption(w,h);
    	var url = "faqPopup.do"
    	var name = "faqPopup";
    	
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


    	//수정시 화면변경
    	function change_area(faqno, currentButton){
    		var faqbody = $(currentButton).parent().parent();
    		var faqtitle = $(faqbody).siblings(".faq-title");
    		var faqone = $(faqtitle).parent();
    		var p_area = $("#"+faqno+".faq-content").hide();
    		var faqcontent = p_area.text().trim();
    		var btn_area = $(".modify_btns").hide();
    		faqtitle.hide();
    		
    		var new_title = "<h1 class='faq-title' id='modify'><input type='text' class ='newfaq-title' id='"+faqno+"' value='"+faqtitle.text().trim()+"' autofocus = 'autofocus'></h1>"
    		var new_area = "<div class='newfaq-content'><textarea rows = '5' class='newfaq-textarea' id='"+faqno+"''>" + faqcontent + "</textarea><input type = 'button' class = 'new_btn' id = 'update_btn' onclick = 'faqupdate("+faqno+");' value = '수정'></button><input type = 'button' class = 'new_btn' id = 'cancel_btn' onclick = 'cancel();' value = '취소'></div>";
    		
    		faqone.prepend(new_title);
    		faqbody.append(new_area);
    	}
    	
    	//수정-취소 시
    	function cancel(){
    		$(".newfaq-content").remove();
    		$(".faq-title").show();
    		$("#modify").remove();
    		$(".faq-content").show();
    		$(".modify_btns").show();
    		
    		
    	}
    	
    	
    	
    	//관리자 FAQ 수정
    	function faqupdate(faqno){
    		
    		
    		var faqtitle = $("#"+faqno+".newfaq-title").val().trim();
    		var faqcontent = $("#" + faqno + ".newfaq-textarea").val().trim();
    		var faq_update = {"faqtitle" : faqtitle, "faqcontent" : faqcontent, "faqno":faqno};
    		
    		
    		console.log(faqtitle);
    		console.log(faqcontent);
  
    		$.ajax({
    			url: "faqupdate.do",
    			type: "post",
    			data: JSON.stringify(faq_update),
    			contentType:"application/json",
    			dataType: "json",
    			success:
    				function(res){
    					if(res > 0){
    						alert("수정되었습니다.")
    						window.location.reload();
    					}
    					else{
    						alert("수정에 실패했습니다.")
    					}
    				},
    			error: 
    				function(){
    					alert("통신실패")
    				},
    		});//ajax end
    	}
    	
    	
    	//삭제
    	function deleteFunc(faqno){
    		$.ajax({
    			url: "faqdelete.do?faqno="+faqno,
    			success: function(res){
    				
    				if(res > 0){
    					alert("삭제되었습니다");
    					window.location.reload();
    				}
    				else{
    					alert("삭제실패");
    				}
    			},
    			error:
    				function(){
    				alert("통신실패");
    			}
    			
    		});//ajax end	
    	}
    	
    	
    	//검색
    	function search(){
    		var keyword = document.getElementById("keyword").value.trim();
    		//console.log(keyword);
    		
    		
    	};
		
		



	</script>
</body>
</html>