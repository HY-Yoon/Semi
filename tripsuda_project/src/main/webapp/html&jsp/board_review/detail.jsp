<%@page import="dao.reviewboard.ReviewRecoDao"%>
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
	int anum= Integer.parseInt(request.getParameter("anum"));
	//현재 글 작성자와 로그인 회원이 같은 사람인지 확인하기 위한 vo
	ReviewBoardVo vo= ReviewBoardDao.getInstance().select(anum);
	MemberVo editorInfo = MemberDao.getInstance().select(vo.getMnum());
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
	if(userdata != null){
		//글쓴이가 보면 조회수 증가 X
		if(!userdata.getId().equals(editorInfo.getId())){ 
			ReviewBoardDao.getInstance().updateView(anum);
		}
	}else{
		ReviewBoardDao.getInstance().updateView(anum);
	}
	
	//공지사항 설정을 위해 로그인한 회원등급정보 가져오기
	request.setAttribute("grade", userdata.getGrade());
%>

<script type="text/javascript">
	sessionStorage.setItem("anum", "<%=anum %>");
	sessionStorage.setItem("mnum", "<%=userdata.getMnum() %>");
	sessionStorage.setItem("notice", "<%=vo.getNotice() %>");
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
                <p id="reco">추천수 <%=ReviewRecoDao.getInstance().getRecoCount(anum) %></p>
                <c:choose>
                	<c:when test="${userdata.getId() == editorInfo.getId()}">
                		<button onclick="edit()">수정</button>
                		<button onclick="del()">삭제</button>
                	</c:when>
                	<c:when test="${userdata != null}">
                		<button class="report">신고하기</button>	
                	</c:when>
                </c:choose>
                
                <c:if test="${userdata.getGrade() == '관리자'}">
                	<!-- 관리자일때만 -->
                	<button class="notice" onclick="setNotice()">공지사항설정</button>
                </c:if>
                
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
                        <p id="profile_nickname"><%=editorInfo.getNick() %></p>
                    </div>
                </div>
                <div class="area_middle">
                	<%--작성자는 본인 글 추천불가 --%>
	                <button class="reco_btn" <c:if test="${userdata.getId() != editorInfo.getId()}"> onclick="setReco()"</c:if>>추천하기</button>
               		<%-- 로그인안한 회원은 댓글작성 불가 --%>
               		<button class="comm_btn" <c:if test="${userdata != null}">onclick="addComm()"</c:if>>댓글작성</button>
                </div>
            </div>
        </section>
    </div>
</div>
<script src="${pageContext.request.contextPath }/js/board_review/detail.js"></script>