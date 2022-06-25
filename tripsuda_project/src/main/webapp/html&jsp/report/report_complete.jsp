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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report/report.css?ver=<%=System.currentTimeMillis() %>">
</head>
<body>
<div id="report_div">
	<form id="report_form" action="javascript:window.close()">
		<div>
			<% 
			String result = request.getParameter("result");
			if (result != null) {
				if (result.equalsIgnoreCase("ok")) { %>
					<h1>신고 완료</h1><br>
					<p style="font-size: 18px;">신고 작성이 끝났어요. 빠른 시일내에 처리할게요.</p><br>
				<% } else { %>
					<h1>신고 실패</h1><br>
					<p style="font-size: 18px; color: red;">다음과 같은 이유로 신고에 실패했어요.</p><br>
					<p style="font-size: 18px; color: red;"><%=request.getAttribute("no_reason") %></p>
			<% }
			} else { %>
					<h1>신고 실패</h1><br>
					<p style="font-size: 18px; color: red;">다음과 같은 이유로 신고에 실패했어요.</p><br>
					<p style="font-size: 18px; color: red;">정상적이지 않은 접근 </p>
			<% } %>
		</div>
		<input type="submit" value="닫기" onclick="window.close()">
	</form>
</div>
</body>
<script src="${pageContext.request.contextPath }/js/common/header.js?ver=<%=System.currentTimeMillis() %>"></script>

</html>