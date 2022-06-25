<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/ModifyForm.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript">
function checkValue() {
	    if(document.Info.pwd.value==""){
	    	alert("비밀번호를 입력하세요");
	    	return false;
	    }
	    	
	    	
		if (document.Info.pwd.value!=document.Info.pwd2.value) {
			alert("비밀번호는 같아야 합니다");
			return false;
		}
		
		if(favorite.selectedIndex==0){
			  alert("관심지역을 선택하세요");
			  return false;
		  }	
		
    }
	function goMain(){
		location.href="${pageContext.request.contextPath}/community";  //메인 화면으로 
	   }
	
	function deleteinfo(){
		location.href="${pageContext.request.contextPath}/html&jsp/member/DeleteForm.jsp";
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
           <form method="post" action="${pageContext.request.contextPath}/memberModify" name="Info" onsubmit="return checkValue()">
			<div class="input-box">
				<label id="title">아이디</label>
				<span>${member.id}</span>
			</div>
			<div class="input-box">
				<label id="title">비밀번호</label>
				<input type="password" name="pwd" maxlength="50">
			</div>
			<div class="input-box">
				<label id="title">비밀번호 확인</label>
				<input type="password" name="pwd2" maxlength="50">
			</div>
			<div id="err"></div>			
			<div class="input-box">
				<label id="title">이름</label>
				<span>${member.name}</span> 
			</div>
			
			<div class="input-box">
				<label id="title">닉네임</label>
				<input type="text" name="nick" value="${member.nick}">
			</div>
					
			<div class="input-box">
				<label id="title">전화번호</label>
				<input type="text" name="phone" value="${member.phone}" >
			</div>
			
			<div class="input-box">
				<label id="title">생일</label>
				<span>${member.birth}</span>
			</div>
			<div class="input-box">
				<label id="title">관심지역</label>
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
			</div>
					
			<div class="input-box">
				<label id="title">등급</label>
				<span>${member.grade}</span>
			</div>
			<div class="input-box">
	           <input type="submit" value="수정"/>  
	           <input type="button" value="취소" onclick="goMain()">
	           <input type="button" value="탈퇴하기" onclick="deleteinfo()"/>  
	        </div>
			</form>
		</div>
	   </div>


</main>

<footer>
	<jsp:include page="/html&jsp/default/default_footer.jsp"/>
</footer>



</body>
</html>