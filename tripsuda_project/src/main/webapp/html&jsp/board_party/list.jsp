<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="../../js/jQuary/jquery-3.6.0.js"></script>
<script src="../../js/summernote/summernote-lite.js"></script>
<script src="../../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../css/summernote/summernote-lite.css">

<div class="content_header">
	<h2>나와 맞는 여행동행과 싸움을 벌여보아요!</h2>
	<h1>여행 친구 잃기</h1>
</div>
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

<link rel="stylesheet" href="css/editor.css">
<script src="js/editor.js"></script>