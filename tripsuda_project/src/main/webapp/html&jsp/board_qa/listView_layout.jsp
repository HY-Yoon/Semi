<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트립수다 여행 Q&A</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">

</head>
<body> 
<%
	session.setAttribute("sessionID", "aaaa");
%>
<div id="wrap">
     <header>
        <jsp:include page="/html&jsp/default/default_header.jsp"/>
    </header>
    <main>
		<jsp:include page="/html&jsp/board_qa/listView.jsp"/>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
</div>
<script src="${pageContext.request.contextPath }/js/common/header.js"></script>
</body>
</html>