<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripSUDA</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board_qa/basic.css">

</head>
<body> 

<div id="wrap">
    <header>
        <jsp:include page="/html&jsp/default/default_header.jsp"/>
    </header>
    <main>
    	<jsp:include page="/html&jsp/board_qa/qaHeader.html"/>
    	<jsp:include page="/html&jsp/board_qa/qinsert.jsp"/>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
</div>
</body>
</html>