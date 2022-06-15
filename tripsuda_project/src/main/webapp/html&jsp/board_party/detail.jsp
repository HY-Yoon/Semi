<%@page import="dao.PartyBoardDao"%>
<%@page import="vo.PartyboardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	PartyboardVo vo = PartyBoardDao.getInstance().select(Long.parseLong(request.getParameter("anum")));
%>
<div class="content_header">
	<img src="<%=vo.getBackimg() %>" width="100%">
</div>
<div class="container">
	<div id="main_content" class="contentbox" style="flex: 0 1 800px;">
		<div>
			<h1 style=""><%=vo.getTitle() %></h1>
		</div>
		<div class="line"></div>
		<div class="desc">
			지역, 모집인원<br>
			일자 언제부터 ~ 언제까지<br>
			성별 조건 (있으면)<br>
			연령 조건 (있으면)
		</div>
		<div style="min-height: 300px;">
			<%=vo.getContent() %>
		</div>
		<div class="content_footer">
			<div>
				태그 일람
			</div>
			일자 | 조회수 | 메시지수(?) | 신고버튼
		</div>
	</div>
	<div id="sidebar" class="contentbox desc" style="flex: 0 1 300px;">
		<div class="">
			프로필 카드
		</div>
		<div class="line"></div>
		<input type="button" value="동행 신청/취소">
		<input type="button" value="채팅방가기">
	</div>
</div>

<link rel="stylesheet" href="css/detail.css">
<script src="js/detail.js"></script>