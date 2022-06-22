<%@page import="dao.ChatDao"%>
<%@page import="vo.ChatroomVo"%>
<%@page import="java.util.Arrays"%>
<%@page import="dao.ChatroomDao"%>
<%@page import="dao.PartyWaitDao"%>
<%@page import="vo.PartywaitVo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="util.DateUtil.DATEFORMAT"%>
<%@page import="util.DateUtil"%>
<%@page import="vo.MemberVo"%>
<%@page import="dao.PartyBoardDao"%>
<%@page import="vo.PartyboardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
	PartyboardVo vo = PartyBoardDao.getInstance().select(Long.parseLong(request.getParameter("anum")));
	String gender = vo.getGender().equalsIgnoreCase("선택 안함") ? "제한 없음" : vo.getGender();
	String age = (vo.getAge_min() == 0 && vo.getAge_max() == 0) ? "제한 없음" : vo.getAge_min() + "세부터 " + vo.getAge_max() + "세까지";
%>
<div class="content_header">
	<img src="<%=vo.getBackimg() %>" width="100%">
</div>
<div class="detail_container">
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
				<%=DateUtil.getText(vo.getRegDate(), DATEFORMAT.YMDHM) %> · 조회수 <%=vo.getViews() %> · 메시지수 <%=ChatDao.getInstance().getChatCnt(vo.getAnum()) %><br>
				<a href="" style="text-decoration: underline;" >신고하기</a>
			</div>
		</div>
		<div id="sidebar" class="contentbox desc" style="flex: 0 1 300px;">
			<div class="">
				프로필 카드
			</div>
			<div class="line"></div>
			<%
				if (userdata != null)
				{
					if (vo.getExpired().equalsIgnoreCase("Y")) // 마감됨
					{
						Date currDate = Calendar.getInstance().getTime();
						if (currDate.after(vo.getEndDate())) // 완전 마감
						{
							%><input type="button" disabled="disabled" value="지난 여행이에요."><%
						}
						else if (userdata.getMnum() == vo.getMnum()) // 그건 아닌데 작성자인 경우
						{
							%><input type="button" value="모집 다시 활성화하기" onclick="sendForm(<%=vo.getAnum() %>, 'activate')"><%
						}
						else // 일반인이 보는 경우
						{
							%><input type="button" disabled="disabled" value="모집이 끝났어요."><%
						}
					}
					else // 마감 안됨
					{
						if (userdata.getMnum() == vo.getMnum()) // 작성자
						{
							%><input type="button" value="모집 마감하기" onclick="sendForm(<%=vo.getAnum() %>, 'deactivate')"><%
						}
						else
						{
							PartywaitVo pwvo = PartyWaitDao.getInstance().select(vo.getAnum(), userdata.getMnum());
							if (pwvo == null)
							{ 
								%><input type="button" value="동행 신청" onclick="sendForm(<%=vo.getAnum() %>, 'join')"><%
							}
							else
							{
								if (pwvo.getYn().equalsIgnoreCase("Y"))
								{
									%><input type="button" disabled="disabled" value="동행중!"><%
								}
								else
								{ 
									%><input type="button" disabled="disabled" value="동행 대기중..."><%
								}
								%><input type="button" value="동행 신청 취소하기" onclick="sendForm(<%=vo.getAnum() %>, 'leave')"><%
							}
						}
					}
					ChatroomVo room = ChatroomDao.getInstance().getRoomfromAnum(vo.getAnum());
					PartywaitVo wait = PartyWaitDao.getInstance().select(vo.getAnum(), userdata.getMnum());
					if (wait != null)
					{
						if (wait.getYn().equalsIgnoreCase("Y"))
						{
							%><input type="button" value="채팅방 열기" onclick="window.location.replace('<%=request.getContextPath()%>/board_chat/main?anum=<%=vo.getAnum() %>')"><%
						}
					}
				}
			%>
		</div>
</div>

<link rel="stylesheet" href="../../css/board_party/detail.css?ver=<%=System.currentTimeMillis() %>">
<script src="../../js/board_party/detail.js?ver=<%=System.currentTimeMillis() %>"></script>