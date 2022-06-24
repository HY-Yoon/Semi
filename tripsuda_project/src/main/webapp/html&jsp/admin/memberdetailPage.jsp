<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIPSUDA-관리자페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/memberDetail.css">
</head>
<body>
	<header>
        <jsp:include page="/html&jsp/default/default_header.jsp"/>
    </header>
    <main>
    	<div class="container">
    		<section class="menu_section">
    			<jsp:include page="/html&jsp/admin/menu.jsp"/>
    		</section>
    		<section class="content_section">
    			<jsp:include page="/html&jsp/admin/memberdetail.jsp"/>
    		</section>
    	</div>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
    <script src="${pageContext.request.contextPath }/js/admin/meberdetail.js"></script>
</body>
</html>