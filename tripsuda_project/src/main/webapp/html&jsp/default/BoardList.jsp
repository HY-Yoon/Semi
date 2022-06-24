<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시글 목록 -->
	<div id="board">
		<table id="bList" width="800" border="3" bordercolor="lightgray">
			<tr heigh="30">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		<c:forEach var="board" items="${requestScope.list}">
			<tr>
				<td>${board.anum}</td>
				<td align="left">
				
					<a href="${pageContext.request.contextPath}/FBoardDetail?anum=${board.anum}">
					${board.title}
					</a>
				</td>
				<td>
					${board.nick}
					</a>
				</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
				<td>${board.views}</td>
			</tr>
		</c:forEach>
		</table>
	</div>	
	
		
	<!-- 페이지 넘버 부분 -->
	<br>
        <!-- page : 받는 page num 값이 없다면 1, 있다면 그 값을 진행 , 매개변수 param.p-->
	    <c:set var="page" value="${(empty param.p)?1:param.p}"/>
	
	    <c:set var="startNum" value="${page - (page-1)%5}" />
	    <!-- lastNum 표현 -->
	    <c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}" />

	    <!-- 10.2 -> 11, Math.ceil.(10.2) -> 11.0 로 만듦 , 11로 만들어줄 필요가 있음-->			
			
			<div class="indexer margin-top align-right">
				<h3 class="hidden">현재 페이지</h3>
				<!-- empty : null값, "" 둘다 커버 -->
				<div><span class="text-orange text-strong">${(empty param.p)?1:param.p}</span> ${lastNum}</div>
			</div>

			<div class="margin-top align-center pager">	
		
	<div>
	
	
	<!-- startNum이 1보다 크다면 이전 버튼 링크 허용 -->	
		<c:if test="${startNum>1}">
		   <a href="?p=${startNum-1}&t=&q=" class="btn btn-prev" >이전</a>
		</c:if>
		<c:if test="${startNum<=1}">
		   <span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
		</c:if>
		
	</div>
	
	<!-- startNum + i의 값을 각 페이지 번호 정렬, a링크도 허용 -->
	<ul class="-list- center">
	    <c:forEach var="i" begin="0" end="4">
	    <!-- lastNum보다 작을 때 번호가 출력되지 않도록 진행 -->
	    <c:if test="${(i+startNum) <= lastNum}">
	    <!-- EL " "안에서는 ''으로 써준다 , page가 성립될 때만 bold orange , i+startNum = 현재 페이지 -->
		<li><a class="-text- ${(page==(i+startNum))?'orange':''} bold" href="?p=${i+startNum}&f=${param.f}&q=${param.q}">${i+startNum}</a></li>
		</c:if>
		</c:forEach>		
	</ul>
	<div>
		
		<c:if test="${4+startNum<lastNum}"> 
			<a href="?p=${4+startNum}&t=&q="  class="btn btn-next">다음</a>
		</c:if>
		<c:if test="${4+startNum>=lastNum}">
			<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
		</c:if>
	</div>
	
</body>
</html>