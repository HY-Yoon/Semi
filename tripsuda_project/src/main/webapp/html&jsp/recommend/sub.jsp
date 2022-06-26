<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--관광지 추천 서브페이지 controller 사용을 위한 jsp --%>
<%
	String pageName = (String)request.getAttribute("pageName");
%>
<jsp:include page="<%=pageName %>"/>