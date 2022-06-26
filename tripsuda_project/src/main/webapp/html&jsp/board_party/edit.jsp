<%@page import="vo.PartyboardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="<%=request.getContextPath() %>/js/jQuary/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath() %>/js/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css">

<%
	PartyboardVo vo = (PartyboardVo)session.getAttribute("board_party_edit_cache");
	session.setAttribute("board_party_edit_cache", null);
	if (vo != null)
	{
		System.out.print(vo.getAnum());
%>
<script type="text/javascript" charset="utf-8">

	var edit_cache = {
		anum : <%=vo.getAnum() %>,
		region : `<%=vo.getDest() %>`,
		gender : `<%=vo.getGender() %>`,
		age_min : <%=vo.getAge_min() %>,
		age_max : <%=vo.getAge_max() %>,
		start_date : `<%=vo.getStartDate() %>`,
		end_date : `<%=vo.getEndDate() %>`,
		mem_count : <%=vo.getMemcnt() %>,
		back_img : `<%=vo.getBackimg() %>`,
		title : `<%=vo.getTitle() %>`,
		content : `<%=vo.getContent() %>`,
		tags : `<%=vo.getTags() %>`
	};
	sessionStorage.setItem("edit_cache", JSON.stringify(edit_cache));
	/*
	sessionStorage.setItem("region", "<%=vo.getDest() %>");
	sessionStorage.setItem("gender", "<%=vo.getGender() %>");
	sessionStorage.setItem("age_min", "<%=vo.getAge_min() %>");
	sessionStorage.setItem("age_max", "<%=vo.getAge_max() %>");
	sessionStorage.setItem("start_date", "<%=vo.getStartDate() %>");
	sessionStorage.setItem("end_date", "<%=vo.getEndDate() %>");
	sessionStorage.setItem("mem_count", "<%=vo.getMemcnt() %>");
	sessionStorage.setItem("back_img", "<%=vo.getBackimg() %>");
	sessionStorage.setItem("content", "<%=vo.getContent() %>");
	sessionStorage.setItem("tags", "<%=vo.getTags() %>");
	*/
</script>
<% } %>
<div class="container">
	<div id="limiter" style="border: 1px solid lightgray; padding: 15px">
		<div class="flexcon"> <!-- 지역 -->
			<div class="descbox">지역 선택</div>
			<div id="region_select" class="select_box">
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">성별 조건</div>
			<div id="gender_select" class="select_box"> <!-- 성별 제한 -->
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">연령 조건</div>
			<div id="age_select" class="select_box"> <!-- 나이 제한 -->
				<span style="width: 250px;">
					<input type="checkbox" id="age_ignore_check" onchange="onCheckAgeIgnore()"> 제한 없음 &nbsp;&nbsp;
				</span>
				<span id="age_limit_span">
					<input type="number" min="2" max="20" value="10">
					세 ~
					<input type="number" min="2" max="20" value="80">
					세
				</span>
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">날짜 선택</div>
			<div id="schedule_select" class="select_box flexcon"> <!-- 일정 -->
				<input type="date" id="startdate" style="width: 100%" onchange="onChangeSchedule(true)">
				&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="date" id="enddate" style="width: 100%" onchange="onChangeSchedule(false)">
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">모집인원</div>
			<div id="memcount_select" class="select_box" style="display: flex"> <!-- 모집 인원 -->
				<input type="range" min="2" max="100" value="2" id="memcount_range" style="width:100%;" oninput="onChangeMemCount()">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="memcount" style="display: flex; width: 80px;">2명</div>
			</div>
		</div>
	</div>
	<div id="editor"> 
		<div id="backimg_edit" style="margin:15px 0px;" onclick="onChangeImage()">
			<div id="backimg_input" style="display: flex; height:400px; background-color: lightgray; justify-content: center; align-items: center; overflow: hidden;">
				<p id="backimg_notice">이곳에 배경 사진 입력</p>
				<img id="backimg_file">
			</div>
		</div> <!-- 배경사진 -->
		<div style="margin:15px 0px;"> <!-- 제목 -->
			<input id="title_edit" type="text" placeholder="이곳에 제목 입력" style="box-sizing: border-box; border: 1px solid lightgray; width: 100%; height: 54px; padding: 20px;">
		</div>
		<div id="summernote"></div> <!-- 편집기 -->
		<div style="margin:15px 0px;"> <!-- 제목 -->
			<input id="tag_edit" type="text" placeholder="이곳에 태그 입력(띄어쓰기로 구분)" style="box-sizing: border-box; border: 1px solid lightgray; width: 100%; height: 54px; padding: 20px;">
		</div>
	</div>
	<div id="submitter" style="flex-direction: row; justify-content: space-between;">
		<input type="button" id="cancel_btn" style="background-color: lightgray;" class="submit_btn" value="취소">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="submit_btn" class="submit_btn" value="완료" onclick="sendForm()">
	</div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board_party/editor.css?ver=<%=System.currentTimeMillis() %>">
<script src="<%=request.getContextPath() %>/js/board_party/editor.js?ver=<%=System.currentTimeMillis() %>"></script>