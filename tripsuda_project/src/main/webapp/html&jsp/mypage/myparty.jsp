<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 게시글</title>
</head>
<body>
<header>
</header>

<main>
	<div class="wrap">
		<h2>동행게시판 게시글</h2>
		
		<div class="list">
			<table>
		<tr>
			<th>게시글번호</th><th>제목</th><th>작성일</th>
		</tr>	
		
		<c:forEach var="vo" items="${list }">
			<tr>
				<td class="anum">${vo.anum }</td>
				<td class="title">${vo.title }</td> 
				<td class="reg">${vo.regdate }</td>
			</tr>
		</c:forEach>
				
	</table>
		</div>
		
			<div class="paging">
				<c:if test="${startPage>5 }"><a href="${pageContext.request.contextPath}/mypage/review?pageNum=${startPage-1}">이전페이지</a>
				</c:if>
		
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${pageNum==i }"> 
										<a href="${pageContext.request.contextPath}/mypage/review?pageNum=${i}"><span style="color: #0b81ff">${i }</span></a>		
											</c:when>
								
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/mypage/review?pageNum=${i}"><span style="color: gray">${i }</span></a>
										</c:otherwise>
								</c:choose>
					</c:forEach>
		
				<c:if test="${endPage<pageCount }">
					<a href="${pageContext.request.contextPath}/mypage/review?pageNum=${startPage+1}">다음페이지</a>
				</c:if>

		</div>
		
		
		
	</div>
</main>

<footer>
</footer>
</body>
</html>