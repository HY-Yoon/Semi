<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 보기</title>
</head>
<script type="text/javascript">
function changeView(value){
	
	if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동 
	{
		location.href="";
	}
	else if(value == "1") // 전문가
	{	
		location.href="${pageContext.request.contextPath}/AExpertListController";
	}
	else if(value == "2") // 자유
	{	
		location.href="${pageContext.request.contextPath}/AFreeListController";
	}
	else if(value == "3") // 동행
	{
		location.href="${pageContext.request.contextPath}/APartyController"; //
	}
	else if(value == "4") // 질문
	{
		location.href="${pageContext.request.contextPath}/AQ_AListController";
	}
	else if(value == "5") // 리뷰
	{
		location.href="${pageContext.request.contextPath}/AReviewController";
	}
}
</script>
<body>
<input type="button" value="HOME" onclick="changeView(0)">
 <c:set var="member" value="${requestScope.memberInfo}"/>
    <input type="button" value="전문가게시판" onclick="changeView(1)">
	<input type="button" value="자유게시판" onclick="changeView(2)">
	<input type="button" value="동행게시판" onclick="changeView(3)">
	<input type="button" value="질문게시판" onclick="changeView(4)">
	<input type="button" value="리뷰게시판" onclick="changeView(5)">

</body>
</html>