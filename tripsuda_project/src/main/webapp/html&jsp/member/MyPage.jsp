<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<script type="text/javascript">

	function changeForm(val) {
		if (val == "-1") {
			location.href = "${pageContext.request.contextPath}/html&jsp/Menu.jsp";
		} else if (val == "0") {
			location.href = "${pageContext.request.contextPath}/memberModifyForm";
		} else if (val == "1"){
			 if(confirm("탈퇴시 본인이 작성한 게시글과 댓글은 자동으로 지워지지 않습니다. 정말 탈퇴하시겠습니까?")) {
					location.href = "${pageContext.request.contextPath}/html&jsp/member/DeleteForm.jsp";
				}else{
			return false;
		}
		} 	
	}

	
</script>
<body>
   <!-- 회원정보를 가져와 member 변수에 담는다. 
    memberInfoController에서 setAttribute로 memberInfo 담았음-->
   <c:set var="member" value="${requestScope.memberInfo}"/>
   
   <!-- 가져온 회원정보를 출력한다. -->
		<table>
			<div id=input-box>
				<td id="title">아이디</td>
				<td>${member.id}</td>
			</div>
						
			<tr>
				<td id="title">이름</td>
				<td>${member.name}</td>
			</tr>
					
			<tr>
				<td id="title">전화번호</td>
				<td>${member.phone}</td>
			</tr>
			
			<tr>
			    <td id="title">생일</td>
			    <td>
			       ${member.birth}
			       </td>
			       
			</tr>
	
			<tr>
				<td id="title">관심지역</td>
				<td>
					${member.favorite}
				</td>
			</tr>
					
			<tr>
				<td id="title">등급</td>
				<td>${member.grade}</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="메뉴" onclick="changeForm(-1)">
		<input type="button" value="회원정보 변경" onclick="changeForm(0)">
		<input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>