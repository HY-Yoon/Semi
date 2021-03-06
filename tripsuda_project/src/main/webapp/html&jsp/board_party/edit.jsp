<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
<% }
    Date date = Calendar.getInstance().getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String currdate = sdf.format(date);
	%>
<div class="container">
	<div id="limiter" style="border: 1px solid lightgray; padding: 15px">
		<div class="flexcon"> <!-- ?????? -->
			<div class="descbox">?????? ??????</div>
			<div id="region_select" class="select_box">
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">?????? ??????</div>
			<div id="gender_select" class="select_box"> <!-- ?????? ?????? -->
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">?????? ??????</div>
			<div id="age_select" class="select_box"> <!-- ?????? ?????? -->
				<span style="width: 250px;">
					<input type="checkbox" id="age_ignore_check" onchange="onCheckAgeIgnore()"> ?????? ?????? &nbsp;&nbsp;
				</span>
				<span id="age_limit_span">
					<input type="number" min="2" max="20" value="10">
					??? ~
					<input type="number" min="2" max="20" value="80">
					???
				</span>
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">?????? ??????</div>
			<div id="schedule_select" class="select_box flexcon"> <!-- ?????? -->
				<input type="date" min="<%=currdate %>" id="startdate" style="width: 100%" onchange="onChangeSchedule(true)">
				&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="date" min="<%=currdate %>" id="enddate" style="width: 100%" onchange="onChangeSchedule(false)">
			</div>
		</div>
		<div class="flexcon">
			<div class="descbox">????????????</div>
			<div id="memcount_select" class="select_box" style="display: flex"> <!-- ?????? ?????? -->
				<input type="range" min="2" max="100" value="2" id="memcount_range" style="width:100%;" oninput="onChangeMemCount()">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="memcount" style="display: flex; width: 80px;">2???</div>
			</div>
		</div>
	</div>
	<div id="editor"> 
		<div id="backimg_edit" style="margin:15px 0px;" onclick="onChangeImage()">
			<div id="backimg_input" style="display: flex; height:400px; background-color: lightgray; justify-content: center; align-items: center; overflow: hidden;">
				<p id="backimg_notice">????????? ?????? ?????? ??????</p>
				<img id="backimg_file">
			</div>
		</div> <!-- ???????????? -->
		<div style="margin:15px 0px;"> <!-- ?????? -->
			<input id="title_edit" type="text" placeholder="????????? ?????? ??????" style="box-sizing: border-box; border: 1px solid lightgray; width: 100%; height: 54px; padding: 20px;">
		</div>
		<div id="summernote"></div> <!-- ????????? -->
		<div style="margin:15px 0px;"> <!-- ?????? -->
			<input id="tag_edit" type="text" placeholder="????????? ?????? ??????(??????????????? ??????)" style="box-sizing: border-box; border: 1px solid lightgray; width: 100%; height: 54px; padding: 20px;">
		</div>
	</div>
	<div id="submitter" style="flex-direction: row; justify-content: space-between;">
		<input type="button" id="cancel_btn" style="background-color: lightgray;" class="submit_btn" value="??????">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="submit_btn" class="submit_btn" value="??????" onclick="sendForm()">
	</div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board_party/editor.css?ver=<%=System.currentTimeMillis() %>">
<script src="<%=request.getContextPath() %>/js/board_party/editor.js?ver=<%=System.currentTimeMillis() %>"></script>