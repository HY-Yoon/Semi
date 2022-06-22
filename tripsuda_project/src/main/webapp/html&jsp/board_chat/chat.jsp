<%@page import="dao.ChatDao"%>
<%@page import="util.DateUtil"%>
<%@page import="dao.PartyWaitDao"%>
<%@page import="vo.PartyboardVo"%>
<%@page import="dao.PartyBoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="vo.ChatroomVo"%>
<%@page import="dao.ChatroomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
	ArrayList<ChatroomVo> chatrooms = (ArrayList<ChatroomVo>)session.getAttribute("chatrooms");
	boolean hasChannel = session.getAttribute("channel") != null;
	String channel = "" + (hasChannel ? session.getAttribute("channel") : "");
%>
<link rel="stylesheet" href="../../css/board_chat/chat.css?ver=<%=System.currentTimeMillis() %>">
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
	sessionStorage.setItem("userNum", "<%=userdata.getMnum() %>");
</script>
<script type="text/javascript" src="../../js/board_chat/chat_lib.js?ver=<%=System.currentTimeMillis() %>"></script>
<h1>환영한다! <%=userdata.getId() %>!</h1>
<h2 id="channel_title">현재 채널 - <%=hasChannel ? "연결 안됨" : channel %></h2>

<div class="chatbox">
	<div class="chat-topside">
		<div class="chat-tbcell" style="width: 350px;">
			<h3>참여한 채팅 목록</h3>
		</div>
		<div class="chat-tbcell boxhead">
			<h3>여기에 타이틀 입력</h3>
		</div>
	</div>
	<div class="chat-center">
		<div class="chat-tbcell" style="vertical-align: top; overflow: auto;">
			<div>
				<%
					for (ChatroomVo vo : chatrooms)
					{
						PartyboardVo pbvo = PartyBoardDao.getInstance().select(vo.getaNum());
						int memCnt = PartyWaitDao.getInstance().getMemCnt(vo.getaNum()) + 1;
						String dateDiff = DateUtil.getDiffer(ChatDao.getInstance().getRecentChatDate(vo.getaNum()));
						%>
						<div class="room-ele" id="room-ele-<%=vo.getaNum() %>">
							<div>
								<a href="javascript:ChatManager.connectRoom(<%=vo.getaNum() %>, true)">
								[ <%=pbvo.getStartDate() %> ~ <%=pbvo.getEndDate() %> ] <br>
								<%=pbvo.getTitle() %> </a>
							</div>
							<%=memCnt %>명 | <%=dateDiff %> <% if (pbvo.getMnum() != userdata.getMnum()) { %>| <a href="javascript:ChatManager.leaveRoom(<%=vo.getaNum() %>)" style="text-decoration: underline;">나가기</a> <% } %>
						</div>
						<% 
					}
				%>
			</div>
		</div>
		<div class="chat-tbcell">
			<div class="chat-flex">
				<div class="messagebox" id="chatlist">
				</div>
				<div class="line"></div>
				<div class="sendbox">
					<input type="hidden" id="anum" value="<%=channel %>">
					<div class="msgbox">
						<input type="text" id="msg" placeholder="이곳에 채팅 입력">
					</div>
					<input type="submit" id="sendmsg" style="color: #0b81ff" value="전송" onclick="ChatManager.sendChat()">
				</div>
			</div>
		</div>
	</div> 
</div> 
<br>