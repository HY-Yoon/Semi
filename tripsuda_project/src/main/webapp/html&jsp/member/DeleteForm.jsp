<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/DeleteForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript">

	function checkValue(){
		  if(!document.deleteform.pwd.value){
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		 }
		  if(!confirm("탈퇴하시면 작성한 글과 댓글은 자동으로 지워지지 않습니다. 탈퇴하시겠습니까?")){
			  alert("탈퇴가 취소되셨습니다.");
		  }else{
			  alert("탈퇴되셨습니다.");
		  }
	   }
	   

	   function goMain(){
			  location.href="${pageContext.request.contextPath}/community";  //메인 화면으로 
		   }
	</script>
</head>

<body>
<header>
 	<jsp:include page="/html&jsp/default/mypage_header.jsp"/>
</header>

<c:set var="member" value="${requestScope.memberInfo}"/>
<main class ="wrap">
	<div class="layout">

		<aside>
			<div class="side">
			<div class="profile">
				<div class="img"></div>
				<p>${member.name}님 환영합니다!</p>
			</div>
			<div class="mypage">
				<ul>
					<li class="list"><a href="${pageContext.request.contextPath}/memberModifyForm"><span class="txt">나의정보수정</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/html&jsp/Point/point.jsp"><span class="txt">포인트조회</span></a></li>
					<li class="list"><a href="#"><span class="txt">여행후기</span></a></li>
					<li class="list"><a href="#"><span class="txt">자유게시판</span></a></li>
					<li class="list"><a href="#"><span class="txt">내코멘트</span></a></li>
					<li class="list"><a href="#"><span class="txt">내동행 게시글</span></a></li>
					<li class="list"><a href="#"><span class="txt">내QnA</span></a></li>
				</ul>
			</div>
			</div>
			</aside>
			

		<div class="content">
          <h1>회원 탈퇴</h1>
	<form name="deleteform" method="post" action="${pageContext.request.contextPath}/memberDelete" onsubmit="return checkValue()">

		<div class="input-box">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" maxlength="50"></td>
		</div>
        <div class="input-box"> 
            <input type="button" value="취소" onclick="goMain()"> 
		    <input type="submit" value="탈퇴">
		</div>    
	</form>
	   </div>


</main>

<footer>
	<jsp:include page="/html&jsp/default/default_footer.jsp"/>
</footer>



</body>
</html>