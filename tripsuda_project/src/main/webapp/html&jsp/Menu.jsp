<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지(메뉴 관리)</title>
</head>
<script type="text/javascript">
function changeView(value){
	
	if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동 
	{
		location.href="";
	}
	else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
	{	
		location.href="./member/LoginForm.jsp";
	}
	else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
	{	
		location.href="./member/JoinForm.jsp";  
	}
	else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 controller 
	{
		location.href="${pageContext.request.contextPath}/Logout"; //
	}
	else if(value == "4") // 내정보 버튼 클릭시 memberInfoController
	{
		location.href="${pageContext.request.contextPath}/memberInfo";
	}
	else if(value == "5") // 자유게시판 리스트 화면으로 이동
	{
		location.href="${pageContext.request.contextPath}/freelist";
	}
}
</script>
<body>
	<p>
		<input type="button" value="HOME" onclick="changeView(0)">

		<!-- // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다. -->
		<c:if test="${sessionScope.sessionID==null}">
			<input type="button" value="로그인" onclick="changeView(1)">
			<input type="button" value="회원가입" onclick="changeView(2)">
		</c:if>

		<!-- // 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다. -->
		<c:if test="${sessionScope.sessionID!=null}">
			<input type="button" value="로그아웃" onclick="changeView(3)">
			<input type="button" value="내정보" onclick="changeView(4)">

		</c:if>

		<input type="button" value="자유게시판" onclick="changeView(5)">

	</p>
</body>
</html>