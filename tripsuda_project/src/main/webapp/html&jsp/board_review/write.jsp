<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- summernote -->
<script src="${pageContext.request.contextPath }/js/jQuary/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>

<%
	MemberVo userdata = (MemberVo)session.getAttribute("userdata");
%>
<div class="editor-wrap">
	<section class="bg-box"></section>
	<input type="hidden" id="mnum" value="<%=userdata.getMnum()%>">
	<div class="container">
		<div class="location-box">
			<div class="legend">
				<p>지역 선택</p>
			</div>
			<div>
				<label for="loc_1">서울<input type="radio" name="location" id="loc_1" value="서울"></label>
				<label for="loc_2">강원도<input type="radio" name="location" id="loc_2" value="강원도"></label>
				<label for="loc_3">제주도<input type="radio" name="location" id="loc_3" value="제주도"></label>
				<label for="loc_4">부산<input type="radio" name="location" id="loc_4" value="부산"></label>
				<label for="loc_5">경기도<input type="radio" name="location" id="loc_5" value="경기도"></label>
				<label for="loc_6">인천<input type="radio" name="location" id="loc_6" value="인천"></label>
				<label for="loc_7">충청도<input type="radio" name="location" id="loc_7" value="충청도"></label>
				<label for="loc_8">경상도<input type="radio" name="location" id="loc_8" value="경상도"></label>
				<label for="loc_9">전라도<input type="radio" name="location" id="loc_9" value="전라도"></label>
			</div>
		</div>
		<div class="thum-box" onclick="onChangeImage()">
			<div class="icon-wrap"></div>
			<div id="thum_input">
				<p id="thum_notice">배경사진을 선택해주세요</p>
				<!-- <img id="thum_img"> -->
			</div>
		</div>
		 
		<div>
			<input type="text" name="title" id="title" placeholder="제목을 입력하세요">
		</div>
		<div id="summernote"></div> 			
		<div>
			<input type="text" name="hashtag" id="hashtag" placeholder="태그 입력(띄어쓰기로 구분)">
		</div>
		
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
			<p class="popup_txt">제목 또는 내용을 제대로 입력해주세요!</p>
		</div>
		<div class="btn_area">
			<button type="button" class="btn">확인</button>
		</div>
	</div>
</aside>
<script src="${pageContext.request.contextPath }/js/board_review/write.js"></script>