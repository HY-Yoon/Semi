<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/joinForm.css">
<script type="text/javascript">


function checkNick(){
		  
	   let nick = document.getElementById("nick").value;
	   console.log(nick);
	   let xhr=new XMLHttpRequest();
	   xhr.onreadystatechange=function(){
		   if(xhr.readyState==4 && xhr.status==200){
			   let data=xhr.responseText;
			   let result=JSON.parse(data);
			   console.log(result);
			   if(result.exist==true){
				   document.getElementById("u_nick_check").innerHTML="<font size=2px , font color=red>사용중인 닉네임입니다.</font>";
				   
			   }else{
				   document.getElementById("u_nick_check").innerHTML="<font size=2px , font color=red>사용가능한 닉네임입니다.</font>";
				   
			   }
		   }
	   };
	   xhr.open('get','CheckNickForm.jsp?nick=' + nick,true); 
	   xhr.send();
	  
  }

</script>
<body>
   <h2>TripSUDA</h2>
   <div id="warp">
   <div id="content">
      <!-- ID -->
      <form name="joinform" action="${pageContext.request.contextPath}/JoinForm" method="post" onsubmit="return checkValue()">
      <div>
      
         <h3 class="join_title">
            <label for="id">아이디</label>
         </h3>
         <span class="box int_id"> 
         <input type="text" name="id" id="id" class="int" maxlength="10"> 
         </span>
         <span class="check">
         <input type="button" id="id_check" value="아이디중복확인" onclick="checkId()"> 
         <p id="u_id_check"></p>
         <input type="hidden" name="idDuplication" value="" />
         </span> <span class="error_next_box"></span>
      </div>

      <!-- PW -->
      <div>
         <h3 class="join_title">
            <label for="pwd">비밀번호</label>
         </h3>
         <span class="box int_pass"> 
            <input type="text" name="pwd" id="pwd" class="int" maxlength="20"> 
         <span id="alertTxt">사용불가</span>
         <img src="m_icon_pass.png" id="pwd1_img1" class="pswdImg">
         </span> 
         <span class="error_next_box"></span>
      </div>

      <!-- PW2 -->
      <div>
         <h3 class="join_title">
            <label for="pwd2">비밀번호 재확인</label>
         </h3>
         <span class="box int_pass_check"> 
         <input type="text" name="pwd2" id="pwd2" class="int" maxlength="20"> 
         <img src="m_icon_check_disable.png" id="pwd2_img1" class="pswdImg">
         </span> <span class="error_next_box"></span>
      </div>

      <!-- NAME -->
      <div>
         <h3 class="join_title">
            <label for="name">이름</label>
         </h3>
         <span class="box int_name"> 
         <input type="text" name="name" id="name" class="int" maxlength="10">
         </span> <span class="error_next_box"></span>
      </div>

      <!-- NICK -->
      <div>
         <h3 class="join_title">
            <label for="nick">닉네임</label>
         </h3>
         <span class="box int_name"> 
         <input type="text" name="nick" id="nick" class="int" maxlength="10"> 
         </span>
         <span class="check">
         <input type="button" id="nick_check" value="닉네임중복확인" onclick="checkNick()">
         </span> <p id="u_nick_check"></p>
         <span class="error_next_box"></span>
      </div>

      <!-- MOBILE -->
      <div>
         <h3 class="join_title">
            <label for="phone">휴대전화</label>
         </h3>
         <span class="box int_mobile"> 
         <input type="tel" name="phone" id="phone" class="int" maxlength="16" placeholder="전화번호 입력">
         </span> <span class="error_next_box"></span>
      </div>

      <!-- BIRTH -->
      <div>
         <h3 class="join_title">
            <label for="yy">생년월일</label>
         </h3>

         <div id="bir_wrap">
            <!-- BIRTH_YY -->
            <div id="bir_yy">
               <span class="box"> 
               <input type="text" name="birth_yy" id="yy" class="int" maxlength="4" placeholder="년(4자)">
               </span>
            </div>

            <!-- BIRTH_MM -->
            <div id="bir_mm">
               <span class="box"> <select name="birth_mm" id="mm" class="sel">
                     <option>월</option>
                     <option value="01">1</option>
                     <option value="02">2</option>
                     <option value="03">3</option>
                     <option value="04">4</option>
                     <option value="05">5</option>
                     <option value="06">6</option>
                     <option value="07">7</option>
                     <option value="08">8</option>
                     <option value="09">9</option>
                     <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
               </select>
               </span>
            </div>

            <!-- BIRTH_DD -->
            <div id="bir_dd">
               <span class="box"> 
               <input type="text" name="birth_dd" id="dd" class="int" maxlength="2" placeholder="일">
               </span>
            </div>
         </div>
         <span class="error_next_box"></span>
      </div>

      <!-- favorite -->
      <div>
         <h3 class="join_title">
            <label for="favorite">관심지역</label>
         </h3>
         <span class="box"> 
         <select name="favorite" id="favorite">
               <option value="선택하기" selected>선택하기</option>
               <option value="서울">서울</option>
               <option value="경기도">경기도</option>
               <option value="강원도">강원도</option>
               <option value="제주도">제주도</option>
               <option value="부산">부산</option>
               <option value="충청도">충청도</option>
               <option value="경상도">경상도</option>
               <option value="전라도">전라도</option>
         </select>
         </span>
      </div>
      <div class="btn_area">
         <input type="button" id="btnJoin" value="가입하기"> 
         </button>
      </div>
      </form>
      </div>
   </div>
   <script src="${pageContext.request.contextPath }/js/board_free/joinForm.js"></script>
</body>
</html>