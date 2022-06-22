<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripSUDA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../css/common.css">

</head>
<body>
<div id="wrap">
    <header>
        <jsp:include page="../default/default_header.jsp"/>
    </header>
    <main>
        <jsp:include page="pageheader.html"/>
        <jsp:include page="edit.jsp"/>
    </main>
    <footer>
        <jsp:include page="../default/default_footer.jsp"/>
    </footer>
</div>
<script src="../../js/common/header.js?ver=<%=System.currentTimeMillis() %>"></script>
<script src="../../js/board_party/default.js?ver=<%=System.currentTimeMillis() %>"></script>
</body>
</html>