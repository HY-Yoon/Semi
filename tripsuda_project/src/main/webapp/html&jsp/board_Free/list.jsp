<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_free/list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

	<script type="text/javascript">
		function writeForm(){
			location.href="${pageContext.request.contextPath}/html&jsp/board_Free/WriteForm.jsp"; 
		}
	</script>
</head>
	
<body>
<div id="wrap">
	<header>
		<jsp:include page="/html&jsp/default/default_header.jsp" />
	</header>
		<main>
			<div class="img">
				<img alt="배경"
					src="${pageContext.request.contextPath}/images/board_free/2.png">
			</div>
			<div class="container">
				<div class="board_list_wrap">
					<!-- 글 목록 위 부분 -->
					<div class="board_write_form">
						<c:if test="${sessionScope.sessionID!=null}">
							<input type="button" value="글쓰기" onclick="writeForm()">
						</c:if>
					</div>
					<br>
					<div class="board_list">
						<br>
						<table id="bList" padding:"10" width="1100" border="3"
							bordercolor="lightgray">
							<tr heigh="30">
								<th class="num">글번호</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="date">작성일</th>
								<th class="view">조회수</th>
							</tr>
							<c:forEach var="board" items="${requestScope.list}">
								<tr>
									<td>${board.anum}</td>
									<td align="left" id="titt"><a
										href="${pageContext.request.contextPath}/FBoardDetail?anum=${board.anum}">
											${board.title} </a></td>
									<td>${board.nick}</a>
									</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.regdate }" /></td>
									<td>${board.views}</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<!-- 페이지 넘버 부분 -->
					<br>
					<!-- page : 받는 page num 값이 없다면 1, 있다면 그 값을 진행 , 매개변수 param.p-->
					<c:set var="page" value="${(empty param.p)?1:param.p}" />
					<c:set var="startNum" value="${page - (page-1)%5}" />
					<!-- lastNum 표현 -->
					<c:set var="lastNum"
						value="${fn:substringBefore(Math.ceil(count/10), '.')}" />
					<!-- 10.2 -> 11, Math.ceil.(10.2) -> 11.0 로 만듦 , 11로 만들어줄 필요가 있음-->

					<div class="paging">

						<!-- startNum이 1보다 크다면 이전 버튼 링크 허용 -->
						<c:if test="${startNum>1}">
							<a href="?p=${startNum-1}&t=&q=" class="btn-prev">이전</a>
						</c:if>
						<c:if test="${startNum<=1}">
							<span class="btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
						</c:if>
						<c:forEach var="i" begin="0" end="4">
							<!-- lastNum보다 작을 때 번호가 출력되지 않도록 진행 -->
							<c:if test="${(i+startNum) <= lastNum}">
								<a href="?p=${i+startNum}&f=${param.f}&q=${param.q}" class="num">${i+startNum}</a>
							</c:if>
						</c:forEach>
						<c:if test="${4+startNum<lastNum}">
							<a href="?p=${4+startNum}&t=&q=" class="btn-next">다음</a>
						</c:if>
						<c:if test="${4+startNum>=lastNum}">
							<span class="btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
						</c:if>


						<div class="now">
							<h3 class="hidden">현재 페이지</h3>
							<!-- empty : null값, "" 둘다 커버 -->
							<div>
								<span class="text-orange text-strong">${(empty param.p)?1:param.p}</span>/
								${lastNum}
							</div>
						</div>
						<br>

					</div>

					<br>

					<div class="search">
						<form>
							<label class="hidden">검색분류</label> <select name="f">
								<!-- 검색 후에도 상태 유지 될 수 있게 함 -->
								<option %{(param.f== "title")?"selected":""}_ value="title">제목</option>
								<option %{(param.f== "content")?"selected":""}_ value="content">내용</option>
								<option %{(param.f== "nick")?"selected":""} value="nick">작성자</option>
								<!-- 제목+내용 검색 -->
							</select> <label class="hidden">검색어</label>
							<!-- get 얻어온 q값이 있으면 value값에 넣어주기 -->
							<input type="text" name="q" value="${param.q }" /> <input
								class="btn btn-search" type="submit" value="검색" />
						</form>
					</div>
				</div>
		</main>
		<footer>
		<jsp:include page="../default/default_footer.jsp" />
	</footer>
</div>	
<script src="${pageContext.request.contextPath}/js/board_free/default.js"></script>
</body>
</html>