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
%>
<link rel="stylesheet" href="../../css/board_chat/chat.css?ver=<%=System.currentTimeMillis() %>">
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
	sessionStorage.setItem("userNum", "<%=userdata.getMnum() %>");
</script>
<div class="chatbox">
	<div class="chat-topside">
		<div class="chat-tbcell" style="width: 350px;">
			<h3>유저 목록</h3>
		</div>
		<div class="chat-tbcell boxhead">
			<div class="room-title">
				<h3 id="channel_title">유저명 입력</h3>
			</div>
		</div>
	</div>
	<div class="chat-center">
		<div class="chat-tbcell" style="vertical-align: top; overflow: auto;">
			<div id="adminchat_userlist">
			</div>
		</div>
		<div class="chat-tbcell">
			<div class="chat-flex">
				<div class="messagebox" id="adminchat_chatlist">
				</div>
				<div class="line"></div>
				<div class="sendbox">
					<div id="adminchat_reader" style="display: none;"></div>
					<div class="msgbox">
						<input type="text" id="adminchat_msg" onkeypress="AdminChatManager.sendManageChat(event)" placeholder="이곳에 채팅 입력">
					</div>
					<input type="submit" id="sendmsg" style="color: #0b81ff" value="전송" onclick="AdminChatManager.sendManageChat(event)">
				</div>
			</div>
		</div>
	</div> 
</div> 
<script type="text/javascript" charset="utf-8">
	window.addEventListener('load', function()
	{
		AdminChatManager.getUserList();
	});
</script>
