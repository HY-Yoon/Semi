<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="../../js/jQuary/jquery-3.6.0.js"></script>
<script src="../../js/summernote/summernote-lite.js"></script>
<script src="../../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../css/summernote/summernote-lite.css">

<div class="container">
	yo 맨 여기는 글 작성란 A yo
	<div id="limiter">
		<div id="region_select"> <!-- 지역 -->
		</div>
		<div id="gender_select"> <!-- 성별 제한 -->
		</div>
		<div id="age_select"> <!-- 나이 제한 -->
		</div>
		<div id="schedule_select"> <!-- 일정 -->
		</div>
		<div id="memcount_select"> <!-- 목표 인원 -->
		</div>
	</div>
	<div id="editor">
		<div id="backimg_edit"></div> <!-- 배경사진 -->
		<div id="title_edit"></div> <!-- 제목 -->
		<div id="summernote"></div> <!-- 편집기 -->
	</div>
	<div id="submitter">
		<input type="button" id="cancel_btn" value="취소">
		<input type="button" id="submit_btn" value="완료">
	</div>
	<form>
		
	</form>
</div>

<link rel="stylesheet" href="css/editor.css">
<script src="js/editor.js"></script>