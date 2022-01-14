<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<style>
        body {
            overflow: scroll;
        }

        .container {
            width: 100%;
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: auto;
            justify-content: center;
            justify-content: center;
        }

        .admin-info {
            width: 100%;
            height: 100px;
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            justify-content: center;
            align-items: center;
            box-shadow: 0px 0px 2px gainsboro;
            background-color: #04AA6D;
            color: white;
            position: sticky !important;
        }

        .admin-info * {
            justify-self: center;
            align-self: center;
        }

        .admin-info *:not(.admin-info *:nth-child(2)):hover {
            cursor: pointer;
        }

        .admin-info *:nth-child(2) {
            grid-column: 2/4;
        }

        .body-content {
            width: 100%;
            display: grid;
            grid-gap: 0;
            grid-template-columns: repeat(5, 1fr);
            justify-items: center;
            place-content: center;
        }

        .content-admin-side {
            min-width: 300px;
            height: 105vh;
            min-height: 1000px;
            box-shadow: 0px 10px 10px gainsboro;
        }

        .content-admin-side,
        .content-admin-side div {
            justify-self: stretch;
        }

        .content-admin-side div * {
            display: block;
            padding-block: 20px;
            padding-left: 20px;
            border-bottom: 1px solid gainsboro;
        }

        .content-admin-side div span:hover {
            cursor: pointer;
        }
        
        #add{
        	cursor: pointer;
        
        }
        .content-admin-main {
            width: 80%;
            min-width: 1000px;
            grid-column: 2/6;
            justify-self: center;
        }


        .admin-main-description {
            height: 100px;
        }

        .admin-main-description>h1 {
            grid-column: 1/3;
        }

        .admin-main-description>span {
            grid-column: 3/5;
        }

        .board-header-content,
        .board-body-content {
            margin-block: 15px;
        }

        .board-header-content,
        .board-body-content,
        .admin-main-description {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            justify-items: center;
            align-items: center;
        }

        .board-body-content {
            padding-block: 10px;
        }

        .board-header,
        .board-body {
            background-color: white;
        }

        .board-header {
            margin-block-end: 0;
            font-weight: bold;
        }

        .board-body {
            margin-block-start: 0;
        }

        .board-header {
            border-top: 1px solid gainsboro;
            border-bottom: 1px solid gainsboro;
        }

        .board-content-name {
            grid-column: 2/4;
            
            border:none;
        }
        
  		.board-content-title{
            grid-column: 2/4;
         }
       

        .board-header#footer * {
            grid-column: 5;
        }
		.cancle{
			width: 50px;
			height:30px;
		}
   

     

        
    </style>
</head>
<body>
<header>
<%@include file = "../../header.jsp" %>
</header>
    <div class="container">
     
        <div class="body-content">
            <div class="content-admin-side">
                <div>
                    <h3>마이페이지</h3>
                    <!--메뉴 구분선-->
                    <h4>Information</h4>
                    <span>내 정보</span>
                    <span>관심사 </span>
                    <span>대시보드</span>
                    <!--메뉴 구분선-->
                    <h4></h4>
                  
                  
                    <!--메뉴 구분선-->
                    <h4>Customer Service</h4>
                    <span>공지사항</span>
                    <span>QnA</span>
                    <span>FAQ</span>
                </div>
            </div>
            <div class="content-admin-main">
                <div class="admin-main-description">
                    <h1>${login_info.user_name }님의 정보</h1>
                  
                    
                </div>
                <div class="admin-main-content">
                    <div class="main-content-board">
                        <div class="board-header">
                            <div class="board-header-content">
                                
                                <span class="board-content-title">관심사 설정하기</span>
                               
                            </div>
                        </div>
                        	
                        	<c:forEach items = "${preferlist }" var = "prefer">
                        		<span>${preferlist.subcat_name }</span>	
                        	
                        	</c:forEach>
                        	

                        
                        
                        
                        	
                        <div class="board-body">
                            <div class="board-body-content">
                                <span>이름</span>
                                <input type = "text" class="board-content-name" id = "user_name" value = "${login_info.user_name}" readonly = "true">
                               	<input type = "hidden" value = "${login_info.user_no }" id = "user_no">
                            </div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <div class="board-body-content">
                                <span>아이디</span>
                                <input type = "text" class="board-content-name" id = "user_id" value = "${login_info.user_id }" readonly = "true">
                                
                            </div>
                            <div class="board-body-content">
                                <span>핸드폰 번호:</span>
                                <input type = "number" class="board-content-name" id = "phone" value = "${login_info.phone }" readonly = "true">
                               
                            </div>
                            <div class="board-body-content">
                                <span>이메일:</span>
                                <input type = "email" class="board-content-name" id = "email" value = "${login_info.email }" readonly = "true">
                       
                            </div>
                            <div class="board-body-content">
                                <span>생년월일</span>
                                <input type = "date" class="board-content-name" id = "birth" value = "${login_info.birth }" readonly = "true">
                               
                            </div>
   
                            
                        </div>
                        <div class="board-header" id="footer">
                        		<input type = "button" id = "update"onclick = "change();" value = "수정하기">
                            <div class="board-header-content">
                             
                              <span class="board-content-config" id="add" onclick = "">비밀번호 재설정</span>
                            </div>
                            <div class="board-header-content">
                                <span class="board-content-config" id="add" onclick = "location.href = 'disable.do?user_no=${login_info.user_no}'">회원탈퇴</span>
                                								
                            </div>
                        </div>
                    </div>
              
                </div>
            </div>
        </div>
    </div>
    
    <script type = "text/javascript">
 
    
    
    </script>
    
    
    
</body>
</html>