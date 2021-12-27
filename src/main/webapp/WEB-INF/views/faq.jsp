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
</head>
<body>
 <main>
        <h1 class="faq-heading">FAQ: 자주 물어보는 질문</h1>
        <form action='...' method='POST' class='form-group'>
            <div class="form-horizontal">
              <input type="text" name="search"
                  class="form-control"
                  placeholder="원하는 내용을 검색해보세요. (로그인, 회원가입, 서비스이용 등)"
                  style="width:500px;display:inline-block; height:36px; margin-left: 300px;"/>
          
              <button type="submit"
                  class="btn btn-primary"
                  style="margin-left:-8px;margin-top:-2px;min-height:36px; width: 100px;"
                  value = "검색">
               </button>
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
            
        </section>
    </main>
    <script>
		var faq = document.getElementsByClassName("faq-title");
		var i;
		for (i = 0; i < faq.length; i++) {
			faq[i].addEventListener("click", function () {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");
				/* Toggle between hiding and showing the active panel */
				var body = this.nextElementSibling;
				if (body.style.display === "block") {
					body.style.display = "none";
				} else {
					body.style.display = "block";
				}
			});
		}



	</script>
</body>
</html>