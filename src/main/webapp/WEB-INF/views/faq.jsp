<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="resources/css/faq_style.css">
    
    
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
                <h1 class="faq-title">${faqdto.faqtitle}</h1>
                <!-- faq answer -->
                <div class="faq-body">
                    <p>${faqdto.faqcontent}
					</p>
                </div>
            </div>
            <hr class="hr-line">
            	</c:forEach>
            	
        <!-- 관리자 로그인시 보여질 화면 -->
        <c:if test = "${login.user_type == 'ADMIN' }">
            		
        <div class="insert-area">
				<h2>작성</h2>
				<div class="comment-write">
					<input type = "text" class = "new-faq-title" id = "new-faq-title" placeholder="FAQ 제목">
					<textarea class = "new-faq-content" id="new-faq-content" placeholder="내용을 입력하세요."></textarea>
					<input type="button" class = "new-faq" value="작성" id="insert-button" onclick = "insert();">
				</div>	
		</div>	
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
			
				var body = this.nextElementSibling;
				if (body.style.display === "block") {
					body.style.display = "none";
				} else {
					body.style.display = "block";
				}
			});
		};
    };
		
    	//관리자 FAQ 작성
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
								window.location.reload();
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
    	
    	//검색
    	function search(){
    		var keyword = document.getElementById("keyword").value.trim();
    		//console.log(keyword);
    		
    		
    	};
		
		



	</script>
</body>
</html>