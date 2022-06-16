<%@page import="org.jsoup.Jsoup"%>
<%@page import="dao.PartyBoardDao"%>
<%@page import="vo.PartyboardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pn = request.getParameter("pagenum");
	long pagenum = 1;
	if (pn != null)
		pagenum = Long.parseLong(pn);
	ArrayList<PartyboardVo> list = PartyBoardDao.getInstance().selectAll(pagenum);
%>
<div class="container">
	<div id="searcher" style="border: 1px solid lightgray; padding: 15px">
		<div class="flexcon"> <!-- 지역 -->
			<div class="descbox">지역 선택</div>
			<div id="region_select" class="select_box">
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">성별 조건</div>
			<div id="gender_select" class="select_box"> <!-- 성별 제한 -->
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">연령 조건</div>
			<div id="age_select" class="select_box"> <!-- 나이 제한 -->
				<span style="width: 250px;">
					<input type="checkbox" id="age_ignore_check" onchange="onCheckAgeIgnore()"> 제한 없음 &nbsp;&nbsp;
				</span>
				<span id="age_limit_span">
					<input type="number" min="2" max="20" value="10">
					세 ~
					<input type="number" min="2" max="20" value="80">
					세
				</span>
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">날짜 선택</div>
			<div id="schedule_select" class="select_box flexcon"> <!-- 일정 -->
				<input type="date" id="startdate" style="width: 100%" onchange="onChangeSchedule(true)">
				&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="date" id="enddate" style="width: 100%" onchange="onChangeSchedule(false)">
			</div>
		</div>
		<input type="button" class="submit_btn" value="이 조건으로 검색" style="height:60px">
	</div>
	<div id="list" style="flex-direction: row; flex-wrap: wrap;">
	<%
		for (PartyboardVo vo : list)
		{
	%>
		<div class="article" onclick="window.location.replace('<%=request.getContextPath() %>/html&jsp/board_party/detailpage.jsp?anum=<%=vo.getAnum() %>')">
			<div class="pic">
				<img src="<%=vo.getBackimg() %>">
				<div class="flexcon region">
					<span><%=vo.getDest() %></span><span class="schedule">&nbsp;06/01 ~ 06/30</span>
				</div>
			</div>
			<div class="content">
				<div style="font-weight: 500;">
					<%
						if (vo.getExpired().equalsIgnoreCase("Y"))
						{
							%><span class="expired">지난 여행</span><%
						}
						else
						{
							%><span class="hiring">모집 중</span><%
						}
					%>
					
					<span class="title"><%=vo.getTitle() %></span>
				</div>
				<div class="desc">
					<%=Jsoup.parse(vo.getContent()).text() %>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<div class="profile">
						프로필
					</div>
					<div class="view">
						조회수 <%=vo.getViews() %> / 댓글
					</div>
				</div>
			</div>
		</div>
	<%
		}
	%>
	</div>
	<div id="page" style="width: 100%; flex-direction: row; align-items: center; justify-content: center;">
	<% if (pagenum > 10) { %>
		<a href=""><< 이전</a>
	<% } %>
	<% for (long pnum = pagenum - (pagenum % 10) + 1; pnum <= Math.min(pagenum - (pagenum % 10) + 10, PartyBoardDao.getInstance().getPageCount()); pnum++) { %>
		<a href="<%=request.getContextPath() %>/html&jsp/board_party/listpage.jsp?pagenum=<%=pnum %>"><%=pnum %></a>
	<% }
		if (pagenum - (pagenum % 10) + 10 >= PartyBoardDao.getInstance().getPageCount())
		{
	%>
		<a href="">다음 >></a>
	<% } %>
	</div>
</div>

<link rel="stylesheet" href="../../css/board_party/list.css">
<script src="js/editor.js"></script>