<%@page import="dao.PartyBoardDao"%>
<%@page import="vo.PartyboardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	PartyboardVo vo = PartyBoardDao.getInstance().select(Long.parseLong(request.getParameter("anum")));
	String gender = vo.getGender().equalsIgnoreCase("선택 안함") ? "제한 없음" : vo.getGender();
	String age = (vo.getAge_min() == 0 && vo.getAge_max() == 0) ? "제한 없음" : vo.getAge_min() + "세부터 " + vo.getAge_max() + "세까지";
%>
<div class="content_header">
	<img src="<%=vo.getBackimg() %>" width="100%">
</div>
<div class="container">
	<div id="main_content" class="contentbox" style="flex: 0 1 800px;">
		<div>
			<h1><%=vo.getTitle() %></h1>
		</div>
		<div class="line"></div>
		<div class="desc">
			<span class="desctext">지역</span> <%=vo.getDest() %><br>
			<span class="desctext">모집인원</span> <%=vo.getMemcnt() %>명<br>
			<span class="desctext">일자</span> <%=vo.getStartDate().toString() %> ~ <%=vo.getEndDate().toString() %><br>
			<span class="desctext">성별</span> <%=gender %><br>
			<span class="desctext">연령</span> <%=age %>
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

<link rel="stylesheet" href="../../css/board_party/detail.css">
<script src="../../js/board_party/detail.js"></script>