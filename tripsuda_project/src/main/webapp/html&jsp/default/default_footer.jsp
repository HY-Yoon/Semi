<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <h1 class="f_logo">
        <img src="${pageContext.request.contextPath }/images/common/logo_SUDA.svg" alt="logo">
    </h1>
    <div>
        <span>고객센터 070-8240-3211 </span>
        <jsp:include page="../board_chat/adminchat.jsp??ver=<%=System.currentTimeMillis() %>"/>    
    </div>
    <div>
        <p>이 웹페이지는 공부를 위해 만든 프로젝트 페이지입니다.</p>
        <p>참고 웹사이트 : 트립소다(<a href="https://tripsoda.com" target="_blank">https://tripsoda.com</a> )</p>
    </div>
</div>