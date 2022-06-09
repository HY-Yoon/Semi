<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="vo.ChatroomVo"%>
<%@page import="dao.ChatroomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/testchat.css">
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>
<script type="text/javascript" src="js/chat_lib.js"></script>
</head>
<body>
<%
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
	ArrayList<ChatroomVo> chatrooms = (ArrayList<ChatroomVo>)session.getAttribute("chatrooms");
	boolean hasChannel = session.getAttribute("channel") != null;
	String channel = "" + (hasChannel ? session.getAttribute("channel") : "");
%>
	<h1>환영한다! <%=userdata.getId() %>!</h1>
	<h2 id="channel_title">현재 채널 - <%=hasChannel ? "연결 안됨" : channel %></h2>
	
	<div class="chatbox">
		<ul class="roomlist">
		<%
			for (ChatroomVo vo : chatrooms)
			{
				%>
				<li><a href="javascript:ChatManager.connectRoom(<%=vo.getrNum() %>)"><%=ChatroomDao.getInstance().getArticleName(vo.getaNum()) %></a></li>
				<% 
			}
		%>
		</ul>
		<div class="chatlist">
			이곳에 텍스트 입력 
		</div> 
	</div> 
	<br>
	<form action="javascript:ChatManager.sendChat()" method="post" onsubmit="return false;">
		<input type="hidden" id="rnum" value="<%=channel %>">
		<input type="text" id="msg">
		<input type="submit" id="sendmsg" value="보내기" onclick="ChatManager.sendChat()">
	</form>
</body>
</html>