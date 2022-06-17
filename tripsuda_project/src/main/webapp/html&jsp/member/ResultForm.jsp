<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
<c:set var="msg" value="${sessionScope.msg}" scope="session" />
	<c:choose>
		<c:when test="${msg!=null && msg=='0'}">
			회원정보가 수정되었습니다.
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:when test="${msg!=null && msg=='1'}">
			회원가입을 축하드립니다.
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:when test="${msg!=null && msg=='-1'}">
			회원가입을 실패하였습니다.
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:otherwise>
			회원정보가 삭제되었습니다.
		</c:otherwise>
	</c:choose>

	<br><br>
	<input type="button" value="메인으로" onclick="javascript:window.location='<%=request.getContextPath() %>/html&jsp/Menu.jsp'"/>
</body>
</html>