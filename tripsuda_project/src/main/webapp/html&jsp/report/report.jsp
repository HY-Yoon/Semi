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
<link rel="stylesheet" href="../../css/report/report.css?ver=<%=System.currentTimeMillis() %>">
</head>
<body>
<div id="report_div">
	<form id="report_form" action="<%=request.getContextPath() %>/report" method="post" enctype="application/x-www-form-urlencoded">
		<input type="hidden" name="mnum" value="<%=request.getParameter("mnum") %>">
		<div>
			<h1>신고 대상: 닉네임 입력</h1><br>
			<p style="font-size: 18px; color: red;">허위 신고를 작성할 경우 당신이 먼저 조져질 수 있어요.</p><br>
		</div>
		<div>
			<h2>사유</h2><br>
			<select name="reason">
				<option>불건전한 닉네임</option>
				<option>불량 채팅</option>
				<option>광고질 & 스팸질</option>
				<option>딱히 걸리는 건 없는데 은근 비매너임</option>
				<option>그냥... 그냥 좀 맘에 안 들게 생겼음</option>
				<option>심심해서</option>
			</select><br>
		</div>
		<div>
			<h2>(선택) 신고 사유</h2><br>
			<textarea name="reason_detail" cols="50" rows="10"></textarea><br>
		</div>
		<input type="submit" value="쓴 맛을 보여주기">
	</form>
</div>
</body>
<script src="../../js/common/header.js?ver=<%=System.currentTimeMillis() %>"></script>
<script src="../../js/board_party/default.js?ver=<%=System.currentTimeMillis() %>"></script>

</html>