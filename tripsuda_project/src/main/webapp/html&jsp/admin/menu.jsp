<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--관리자페이지 메뉴--%>
<%
    //test용 삭제해야함
    session.setAttribute("mnum","2");

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
        <a href="/admin/dash" class="link">
            <span class="name">대시보드</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="/admin/member" class="link">
            <span class="name">회원관리</span>
        </a>
    </li>
    <li class="link_wrap">
        <a href="/admin/member" class="link">
            <span class="name">신고관리</span>
        </a>
    </li>
</div>