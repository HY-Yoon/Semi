<%@page import="java.util.Date"%>
<%@page import="util.DateUtil"%>
<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//mnum으로 불러온 회원정보
	MemberVo user = (MemberVo)request.getAttribute("user");
	String today = DateUtil.getText(new Date(), "yyyy-MM-dd");
	request.setAttribute("sysdate", today);
	request.setAttribute("withdraw", user.getWithdraw());
%>
<script>
	sessionStorage.setItem("context", "<%=request.getContextPath()%>");
</script>
<h1 class="tit"><span>회원관리</span></h1>
<div class="content_inner">
	<input type="text" value="<%=user.getMnum() %>" id="mnum">
    <div>
        <p class="section_tit">아이디</p>
        <p><%=user.getId() %></p>
    </div>
    <div>
        <p class="section_tit">이름</p>
        <p><%=user.getName() %></p>
    </div>
    <div>
        <p class="section_tit">닉네임</p>
        <p><%=user.getNick() %></p>
    </div>
    <div>
        <p class="section_tit">전화번호</p>
        <p><%=user.getPhone() %></p>
    </div>
    <div>
        <p class="section_tit">생년월일</p>
        <p><%=user.getBirth() %></p>
    </div>
    <div>
        <p class="section_tit">관심지역</p>
        <p><%=user.getFavorite() %></p>
    </div>
    <div>
        <p class="section_tit">등급</p>
        <p><%=user.getGrade() %></p>
    </div>
    <div>
        <p class="section_tit">회원정지기한</p>
        <p><input type="date" id="stop" min="<%=today %>" value="<%=user.getStop() %>"></p>
    </div>
    <div>
        <p class="section_tit">탈퇴여부</p>
        <p>
	        <select id="withdraw">
	        	<option value="N" <c:if test="${withdraw == N }">selected="selected"</c:if>>N</option>
	        	<option value="Y" <c:if test="${withdraw == Y }">selected="selected"</c:if>>Y</option>
	        </select>
        </p>
    </div>
    <div class="btn-box">
		<button id="cancle_btn" onclick="cancle()">취소</button>
		<button id="submit_btn" onclick="sendForm()">완료</button>
	</div>
</div>