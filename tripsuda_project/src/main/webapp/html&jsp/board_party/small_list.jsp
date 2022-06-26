<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>

<div id="pb_head">
	<div>취향저격 동행찾기</div>
	<div><a href="<%=request.getContextPath() %>/html&jsp/board_party/list?pagenum=1">더보기</a></div>
</div>
<div id="pb_list" style="flex-direction: row; flex-wrap: wrap;">
</div>

<script src="<%=request.getContextPath() %>/js/board_party/small_list.js?ver=<%=System.currentTimeMillis() %>"></script>
