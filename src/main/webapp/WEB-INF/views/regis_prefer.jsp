<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
  @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
  }
  body {
    background-color: #287743;
      font-family: 'S-CoreDream-3Light';
    
  }
  #container{
      display: grid;
      place-items: center;
      
  }
  #whitespace{

    width: 1300px;
    min-height: 90vh;
    margin:30px;
   
    background-color: white;
    border-radius: 20pt;
    display: grid;
    place-items: center;
    grid-template-columns: 3fr 1fr 1fr;
    
  }


 
  img{
      margin-top:60px;
      width: 500px;
      height:550px;
  }

  h3{
    font-size: 1.75rem;
    border-bottom: 1px solid lightgray;
    width: 200px;
    padding: 10px;
    text-align: center;
    
  }
 
  label{
    font-size: 16pt;
    line-height: 40px;
    transition: all 0.2s;
  }

  label:hover{
      font-weight: bold;
      font-size: 18pt;
  }
  

input[type='checkbox']{
  margin-right: 30px;
  transform: scale(2.0);
  
}

input[type='checkbox']:checked + label {

font-style: italic;
font-weight: bold;
font-size:18pt;

border: 1px solid black;
border-radius: 10px;
border-width: 30px;
border:none;

color: #F16466;


} 

input[type='checkbox'	] + label {
 
  font-style: normal;
  
} 

#prefer_btn{

  width: 300px;
  height:50px;
  margin-left: 80px;
  font-size:15pt;
  font-family: 'S-CoreDream-3Light';

  position: relative;
  border: none;
  display: inline-block;
  padding: 15px;
  border-radius: 15px;
  
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  text-decoration: none;
  font-weight: 600;
  transition: 0.25s;
  background-color: #77af9c;
  color: #d7fff1;
}
#prefer_btn:hover {
  letter-spacing: 2px;
  transform: scale(1.1);
  cursor: pointer;
}

#prefer_btn:active {
    transform: scale(1.5);
}
.cat{
    width: 400px;
}

#title_m{
margin-top:30px;

}


#margin{
	margin-top: 100px;
	margin-bottom:0;
}



</style>
</head>
<body>
   
<div id = "container">
       

        <div id = "whitespace">
            
            <div class = "cat">
					<h3>#만성질환</h3>
					<c:forEach var = "allCat" items = "${allCat }">
							<c:if test = "${allCat.supercat_id eq 1 }">
									<input type = "checkbox" name = "prefer" id = "${allCat.subcat_id }" value = "${allCat.subcat_id }">
									<label for = "${allCat.subcat_id }">${allCat.subcat_name }</label><br>
								
							</c:if>
					</c:forEach>		
					<h3>#건강증진</h3>
					<c:forEach var = "allCat" items = "${allCat }">
							<c:if test = "${allCat.supercat_id eq 3 }">
									<input type = "checkbox" name = "prefer" id = "${allCat.subcat_id }" value = "${allCat.subcat_id }">
									<label for = "${allCat.subcat_id }">${allCat.subcat_name }</label><br> 
							</c:if>
					</c:forEach>		
            </div>
            
            <div class = "cat2">
            		<h3 id = "title_m">#멘탈관리</h3>
					<c:forEach var = "allCat" items = "${allCat }">
							<c:if test = "${allCat.supercat_id eq 2 }">
									<input type = "checkbox" name = "prefer" id = "${allCat.subcat_id }" value = "${allCat.subcat_id }">
									<label for = "${allCat.subcat_id }">${allCat.subcat_name }</label><br> 
							</c:if>
					</c:forEach>	
					<p class = "hidden" id = "margin">&nbsp;</p>
		
					<h3 id = "title_w">#체중관리</h3>
					<c:forEach var = "allCat" items = "${allCat }">
							<c:if test = "${allCat.supercat_id eq 4 }">
									<input type = "checkbox" name = "prefer" id = "${allCat.subcat_id }" value = "${allCat.subcat_id }">
									<label for = "${allCat.subcat_id }">${allCat.subcat_name }</label><br> 
							</c:if>
					</c:forEach>	
					<br><br>
            </div>
            <div>
                <img src="resources/img/prefer1.png" id = "prefer_img">
                <input type = "hidden" name = "user_no" id = "user_no" value = "${login_info.user_no }">
                <input type = "button" onclick ="setprefer();" value = "설정" id = "prefer_btn">
            </div>
        </div>
    </div>    


 
 <script type="text/javascript">
 	
	function setprefer(){
		var user_no = Number($("#user_no").val());
		var subcat_id = new Array();
		$("input[name=prefer]:checked").each(function(){
			subcat_id.push(Number(this.value));
		});
		
		console.log(subcat_id);
		let param = {"subcat_id":subcat_id, "user_no":user_no};
		console.log(param);
		
		$.ajax({
			url: "setprefer.do",
			type: "post",
			data: param,
			success: 
				function(res){
				if(res){
				alert("선호도가 설정되었습니다.");
			 	location.href = "myinfo.do";
					
				}
				else{
					alert("선호도 설정에 실패하였습니다.")
				}
				
				},
				
			fail:
				function(){
				
				alert("통신 실패")
			}
		});//ajax end 
		
		
		};
		
</script>


</body>
</html>