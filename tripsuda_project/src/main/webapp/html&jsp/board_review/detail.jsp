<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.reviewboard.ReviewTagDao"%>
<%@page import="vo.reviewboard.ReviewTagVo"%>
<%@page import="util.DateUtil.DATEFORMAT"%>
<%@page import="util.DateUtil"%>
<%@page import="dao.reviewboard.ReviewCommDao"%>
<%@page import="vo.reviewboard.ReviewBoardVo"%>
<%@page import="dao.reviewboard.ReviewBoardDao"%>
<%@page import="vo.MemberVo"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 여행후기게시판 자세히보기 페이지--%>
<%
	//test 삭제할것
	session.setAttribute("id", "ccc");


	int anum= Integer.parseInt(request.getParameter("anum"));
	ReviewBoardVo vo1= ReviewBoardDao.getInstance().select(anum);
	MemberVo userInfo = MemberDao.getInstance().select(vo1.getMnum());
	String loginUser = (String)session.getAttribute("id");
	if(!loginUser.equals(userInfo.getId())){ //글쓴이가 보면 조회수 증가 X
		ReviewBoardDao.getInstance().updateView(anum);
	}
	ReviewBoardVo vo= ReviewBoardDao.getInstance().select(anum);
%>
<script type="text/javascript">
	sessionStorage.setItem("anum", "<%=anum %>");
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>
<div class="detail-wrap">
    <section class="thum-box">
        <img src="<%=vo.getThum() %>">
    </section>
    
    <div class="container">
        <section class="content-wrap">
            <div class="title">
                <p><%=vo.getTitle() %></p>
            </div>
            <div class="top-info">
                <p>지역</p>
                <p><%=vo.getLocation() %></p>
            </div>
            <div class="content">
                <p><%=vo.getContent() %></p>
            </div>
            <div id="hash"></div>
            <div id="bottom">
                <p id="date"><%=DateUtil.getText(vo.getRegdate(), "YYYY.MM.dd hh:mm") %></p>
                <p id="view">조회수 <%=vo.getViews() %></p>
                <c:choose>
                	<c:when test="${session.id == userInfo.getId()}">
                		<button onclick="edit()">수정</button>
                		<button onclick="delete()">삭제</button>
                	</c:when>
                	<c:otherwise>
                		<button class="report">신고하기</button>	
                	</c:otherwise>
                </c:choose>
                
            </div>
            <div class="comm-wrap">
                <p><b id="comm_cnt"><%=ReviewCommDao.getInstance().getCommCnt(anum) %></b>개의 답변</p>
                <div id="commList"></div>
            </div>
        </section>
        <section class="profile-wrap">
            <div class="profile-box">
                <div class="area-top">
                    <img src="${pageContext.request.contextPath }/images/common/icon/profile/1.svg">
                    <div class="profile_info">
                        <p id="profile_nickname"><%=userInfo.getNick() %></p>
                    </div>
                </div>
                <div class="area_middle">
                   	<button class="comm_btn" onclick="addComm()">답변하기</button>
                </div>
            </div>
        </section>
    </div>
</div>
<script src="${pageContext.request.contextPath }/js/board_review/detail.js"></script>