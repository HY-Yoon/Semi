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
<link rel="stylesheet" href="./css/common.css">

</head>
<body> 
<%
	session.setAttribute("id", 1234);
	session.invalidate();
%>
<div id="wrap">
    <header>
        <jsp:include page="./html&jsp/default/default_header.jsp"/>
    </header>
    <main>
    </main>
    <footer>
        <jsp:include page="./html&jsp/default/default_footer.jsp"/>
    </footer>
</div>

</body>
</html>