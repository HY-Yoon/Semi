<%@page import="util.DateUtil"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="dao.reviewboard.ReviewBoardDao"%>
<%@page import="vo.reviewboard.ReviewBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글 쓰기--%>

<!-- summernote -->
<script src="${pageContext.request.contextPath }/js/jQuary/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>
<%
	int anum= Integer.parseInt(request.getParameter("anum"));
	String id = (String)session.getAttribute("id");
	ReviewBoardVo vo= ReviewBoardDao.getInstance().select(anum);
	MemberVo user = MemberDao.getInstance().getUserInfo(id);
%>
<div class="detail-wrap">
    <div class="container">
        <section class="content-wrap">
            <div class="title">
                <p><%=vo.getTitle() %></p>
            </div>
            <div class="content">
                <p><%=vo.getContent() %></p>
            </div>
            <div id="bottom">
                <p id="date">작성일 <%=DateUtil.getText(vo.getRegdate(), "YYYY.MM.dd hh:mm") %></p>
            </div>
        </section>
    </div>
</div>
<div class="editor-wrap">
	<input type="hidden" id="anum" value="<%=anum%>">
	<input type="hidden" id="mnum" value="<%=user.getMnum()%>">
	<div class="container">
		<div id="summernote"></div> 					
		<div class="btn-box">
			<button id="cancle_btn" onclick="cancle()">취소</button>
			<button id="submit_btn" onclick="chkForm()">완료</button>
		</div>
	</div>
</div>
<aside id="popup">
	<div class="popup_inner">
		<button type="button" class="btn_close">닫기</button>
		<div class="popup_contents">
			<p class="popup_txt">내용을 제대로 입력해주세요!</p>
		</div>
		<div class="btn_area">
			<button type="button" class="btn">확인</button>
		</div>
	</div>
</aside>
<script src="${pageContext.request.contextPath }/js/board_review/commwrite.js"></script>