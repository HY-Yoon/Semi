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
</head>
<body>
<%
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
	ArrayList<ChatroomVo> chatrooms = (ArrayList<ChatroomVo>)session.getAttribute("chatrooms");
	String channel = "" + session.getAttribute("channel");
%>
<h1>환영한다! <%=userdata.getId() %>!</h1>
<h2>현재 채널 - <%=channel %></h2>
<form action="chat/room" method="post">
	<input type="text" id="channel">
	<input type="submit" value="채널 변경">
</form>

<ul>
<%
	for (ChatroomVo vo : chatrooms)
	{
		%>
		<li><a href="#"><%=ChatroomDao.getInstance().getArticleName(vo.getaNum()) %></a></li>
		<%
	}
%>
</ul>


<textarea rows="20" cols="50" id="msglist" readonly="readonly">
<%=chatrooms.size() %>
</textarea>
<br>
<input type="text" id="msg">
<input type="button" id="sendmsg" value="보내기" onclick="sendMsg()">

</body>

<script type="text/javascript">
	function sendMsg()
	{
		let txt = document.getElementById("msg");
		console.log(txt.value);
	}
</script>

</html>