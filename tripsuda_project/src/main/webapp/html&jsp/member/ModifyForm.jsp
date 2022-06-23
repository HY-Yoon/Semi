<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<script type="text/javascript">

	function checkValue() {
		if (!document.userInfo.pwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}
    }
	function goMain(){
		  location.href="${pageContext.request.contextPath}/html&jsp/Menu.jsp";  //메인 화면으로 
	   }
</script>
<body>
  <c:set var="member" value="${requestScope.memberInfo}"/>

  <form method="post" action="${pageContext.request.contextPath}/memberModify" name="Info" onsubmit="return checkValue()">
		<table>
			<tr>
				<td id="title">아이디</td>
				<td id="title">${member.id}</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td><input type="pwd" name="pwd" maxlength="50"
					value="${member.pwd}"></td>
			</tr>
		</table>
		<br><br>
		<table>		
		    <tr>
				<td id="title">이름</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td id="title">닉네임</td>
				<td><input type="text" name="nick" value="${member.nick}" />
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td><input type="text" name="phone" value="${member.phone}" />
				</td>
			</tr>
			<tr>
				<td id="title">관심지역</td>
				<td><select name="favorite" id="favorite">
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
		<input type="button" value="취소" onclick="goMain()">
	    <input type="submit" value="수정"/>  

	</form>
</body>
</html>