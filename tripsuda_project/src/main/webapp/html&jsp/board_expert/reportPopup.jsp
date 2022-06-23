<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_expert/report.css">
</head>
<%
	int mnum = Integer.parseInt(request.getParameter("mnum"));
 %>
 <script type="text/javascript">
 
 </script>
 
<body>
<form action="${pageContext.request.contextPath}/board_expert/report" method="post">
<div class="report" >
<h1>해당 사용자를 신고하시겠습니까?</h1>
<textarea rows="10" cols="60" name="reason" placeholder="신고사유를 적어주세요. 허위 신고 시 불이익이 있을 수 있습니다.">
</textarea><br>
<input type="hidden" name ="mnum" value="<%=mnum %>" >
<input type="submit" value="신고하기">
</div> 
</form>

</body>
</html>