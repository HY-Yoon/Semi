<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIPSUDA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board_review/commwrite.css">
</head>
<body>
	<header>
        <jsp:include page="/html&jsp/default/default_header.jsp"/>
    </header>
    <main>
    	<jsp:include page="/html&jsp/board_review/commwrite.jsp"/>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
    <script src="${pageContext.request.contextPath }/js/common/header.js"></script>
    <script src="${pageContext.request.contextPath }/js/common/header_login.js"></script>
</body>
</html>