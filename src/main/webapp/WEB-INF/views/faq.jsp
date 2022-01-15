<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/faq_style.css">
    
    
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <p class = "faq-content" id = "${faqdto.faqno }">
                    		${faqdto.faqcontent}
                    </p>
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
    		
    		var new_title = "<h1 class='faq-title' id='modify'><input type='text' class='new-faq-title' id='"+faqno+"' value='"+faqtitle.text().trim()+"'></h1>"
    		var new_area = "<div class='new-faq-content'><textarea col = '10' rows = '10' class='new-faq-textarea' id='"+faqno+" style = 'resize: none;''>" + faqcontent + "</textarea><input type = 'button' onclick = 'faqupdate("+faqno+");' value = '수정'></button><input type = 'button' onclick = 'cancel();' value = '취소'></div>";
    		
    		faqone.prepend(new_title);
    		faqbody.append(new_area);
    	}
    	
    	//수정-취소 시
    	function cancel(){
    		$(".new-faq-content").remove();
    		$(".faq-title").show();
    		$("#modify").remove();
    		$(".faq-content").show();
    		$(".modify_btns").show();
    		
    		
    	}
    	
    	
    	
    	//관리자 FAQ 수정
    	function faqupdate(faqno){
    		
    		
    		var faqtitle = $("#"+faqno+".new-faq-title").val().trim();
    		var faqcontent = $("#" + faqno + ".new-faq-textarea").val().trim();
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