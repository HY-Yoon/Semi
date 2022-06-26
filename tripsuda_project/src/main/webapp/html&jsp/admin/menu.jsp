<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--관리자페이지 메뉴--%>
<%
	int mnum = Integer.parseInt((String)session.getAttribute("mnum"));
	MemberVo user = MemberDao.getInstance().select(mnum);
%>
<div class="profile-box">
    <div>
        <img src="${pageContext.request.contextPath}/images/common/icon/profile/1.svg">
   </div>
   <p><%=user.getNick()%>님 환영합니다.</p>
</div>
<div class="mypage_menu">
    <li class="link_wrap">
        <a href="${pageContext.request.contextPath}/admin/main" class="link">
            <span class="name">대시보드</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="${pageContext.request.contextPath}/admin/member/list?w=0" class="link">
            <span class="name">일반회원관리</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="${pageContext.request.contextPath}/admin/member/list?w=1" class="link">
            <span class="name">탈퇴회원관리</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="${pageContext.request.contextPath}/html&jsp/admin/memberChatManagePage.jsp" class="link">
            <span class="name">1:1 채팅 상담</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="${pageContext.request.contextPath}/admin/report" class="link">
            <span class="name">신고관리</span>
        </a>
    </li>
</div>