<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript">

  //submit 제출 시 입력값들을 검사한다.
  function checkValue(){
	  var form = document.joinform;
	  var id=form.id.value;
	  var pwd=form.pwd.value;
	  var pwd2=form.pwd2.value;
	  var name=form.name.value;
	  var nickname=form.nickname.value;
	  var phone=form.phone.value;
	  var favorite=form.favorite;
	  
	  if(id==""){
		 alert("아이디를 입력하세요"); //css처리, <p>위치에 처리
		 //document. INNERHtml 이용
		 id.focuse();
		 return false; //포커스 id.focus(); >회원가입 실패
	  }
	  
	  if((id <"0" || id > "9") && (id <"A" || id >"Z") && (id<"a" || id>"z")){
		  alert("아이디는 영문자와 숫자 조합으로만 가능합니다.");
		  return false;
	  }
	  
	  if(id.length < 4 || id.length > 12){
		  alert("아이디는 4자~12자 사이만 가능합니다");
		  return false;
	  }
	  if(joinform.idDuplication.value!="idCheck"){
		  alert("아이디 중복 체크를 해주세요");
	  }
	  
	  if(pwd==""){
		 alert("비밀번호를 입력하세요");
		 return false;
	  }
	  
	  if(pwd.length < 8 || pwd.length > 20){
		  alert("비밀번호는 8자~20자 사이만 가능합니다");
		  return false;
	  }
	  
	  
	  
	  
	  if(pwd2==""){
		 alert("비밀번호 확인란을 입력하세요");
		 return false;
	  }
	  
	  if(pwd!=pwd2){
	     alert("비밀번호를 같아야합니다");
	     return false;
	  }
	  
	  if(name==""){
		 alert("이름을 입력하세요");
		 return false;
	  }
	  
	  if(name.length < 7 ){
		  alert("이름은 6자까지만 가능합니다");
		  return false;
	  }
		  
	  if(nickname==""){
		 alert("닉네임을 입력하세요");
		 return false;
      }
	  
	  if(nickname.length < 4 || nickname.length > 12){
		  alert("닉네임는 4자~12자 사이만 가능합니다");
		  return false;
	  }
	  
	  //닉네임 중복체크를 꼭 눌러야함
	  
	  if(phone==""){
	     alert("전화번호를 입력하세요");
	     return false;
      }
	  
	  if(isNaN(phone)){
	     alert("전화번호는 - 제외한 숫자만 입력하세요");
	     return false;
      }
	  
	  if(phone.length < 12){
		  alert("핸드폰 번호는 최대 11자리입니다.");
		  return false;
	  }
		  
	  if(favorite.selectedIndex==0){
		  alert("관심지역을 선택하세요");
		  return false;
	  }	  
	
   }
   function goMain(){
	  location.href="${pageContext.request.contextPath}/html&jsp/Menu.jsp";  //메인 화면으로 
   }
	
   function checkId(){
	  
	   let id = document.getElementById("id").value;
	   console.log(id);
	   let xhr=new XMLHttpRequest();
	   xhr.onreadystatechange=function(){
		   if(xhr.readyState==4 && xhr.status==200){
			   let data=xhr.responseText;
			   let result=JSON.parse(data);
			   console.log(result);
			   if(result.exist==true){
				   document.getElementById("u_id_check").innerHTML="사용중인 아이디입니다.";
				   joinform.idDuplication.value=="idCheck";
				   
			   }else{
				   document.getElementById("u_id_check").innerHTML="사용가능한 아이디입니다.";
				   joinform.idDuplication.value=="idCheck";
				   
			   }
		   }
	   };
	   xhr.open('get','CheckIdForm.jsp?id=' + id,true); //
	   xhr.send();
	  
   }
   
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
				   document.getElementById("u_nick_check").innerHTML="사용중인 닉네임입니다.";
				   
			   }else{
				   document.getElementById("u_nick_check").innerHTML="사용가능한 닉네임입니다.";
				   
			   }
		   }
	   };
	   xhr.open('get','CheckNickForm.jsp?nick=' + nick,true); 
	   xhr.send();
	  
   }
   
</script>
</head>
<body>
<h1>회원 가입</h1>
<form name="joinform" action="${pageContext.request.contextPath}/JoinForm." method="post" onsubmit="return checkValue()">
  <table>
    <tr>
       <td>아이디</td>
       <td>
           <input type="text" name="id" id="id" placeholder="ID를 입력하세요"  autofocus>
           <input type="button" id="id_check" value="아이디중복확인" onclick="checkId()">
           <p id="u_id_check"></p>
           <input type="hidden" name="idDuplication" value="idUncheck"/>
        </td>   
    </tr>
    
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pwd" id="pwd" size="20" placeholder="영문숫자 조합 8자리 이상이어야 합니다.">
            <p>영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.</p>
        </td>
    </tr>
    
    <tr>
         <td>비밀번호 확인</td>
         <td>
            <input type="password" name="pwd2" id=pwd2 size="20" placeholder="위와 똑같이 입력하세요.">
          </td>  
     </tr>
     
     <tr>
        <td>이름</td>
        <td>
            <input type="text" name="name" id="name">
         </td>
     </tr>
     
     <tr>
        <td>닉네임</td>
        <td>
             <input type="text" name="nick" id="nick">
             <input type="button" id="nick_check" value="닉네임중복확인" onclick="checkNick()">
             <p id="u_nick_check"></p>
         </td>
     </tr>            
                 
     <tr>
         <td>핸드폰 번호</td>
         <td>
             <input type="text" name="phone" id="phone" placeholder="하이픈(-)없이 입력하세요">
          </td> 
      <tr>
          <td>생일</td>
          <td>
              <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)">
              <select name="birth_mm">
                <option value="">월</option>
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
              <input type="text" name="birth_dd" maxlength="2" placeholder="일">
           </td>
       </tr>    
     <tr>
        <td>관심지역</td>
        <td>
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
     </select></td>
     </tr>
     </table>
     <input type="submit" value="가입하기">
    <input type="reset" value="취소" onclick="goMain()">

</form>
</body>
</html>