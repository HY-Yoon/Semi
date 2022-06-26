<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 게시글</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/mypage.css">

</head>
<body>
<header>
	 	<jsp:include page="../default/mypage_header.jsp"/>
</header>
<main>
	<div class="wrap">
		<div class="layout">
			<aside>
				<div class="side">
				<div class="profile">
					<div class="img"></div>
					<p>${member.name}님 환영합니다!</p>
				</div>
				<div class="mypage">
					<ul>
						<li class="list"><a href="${pageContext.request.contextPath}/memberModifyForm"><span class="txt">회원정보수정</span></a></li>
						<li class="list"><a href="${pageContext.request.contextPath}/html&jsp/Point/point.jsp"><span class="txt">포인트</span></a></li>
						<li class="list"><a href="${pageContext.request.contextPath}/mypage/review"><span class="txt">여행후기</span></a></li>
						<li class="list"><a href="${pageContext.request.contextPath}/mypage/free"><span class="txt">자유게시판</span></a></li>
						<li class="list"><a href="${pageContext.request.contextPath}/mypage/party"><span class="txt">내동행 게시글</span></a></li>
						<li class="list"><a href="${pageContext.request.contextPath}/mypage/qna"><span class="txt">QnA</span></a></li>
					</ul>
				</div>
				</div>
				</aside>
		<div class="content">
		<h2>동행게시판 게시글</h2>
		
		<div class="list">
			<table>
		<thead>
			<tr>
				<th>게시글번호</th><th>제목</th><th>작성일</th>
			</tr>	
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td class="anum">${vo.anum }</td>
					<td class="title">${vo.title }</td> 
					<td class="reg">${vo.regDate }</td>
				</tr>
			</c:forEach>
		</tbody>
				
	</table>
		</div>
		
			<div id="page">
				<c:if test="${startPage>5 }"><a href="${pageContext.request.contextPath}/mypage/party?pageNum=${startPage-1}">이전페이지</a>
				</c:if>
		
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${pageNum==i }"> 
										<a href="${pageContext.request.contextPath}/mypage/party?pageNum=${i}"><span style="color: #0b81ff">${i }</span></a>		
											</c:when>
								
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/mypage/party?pageNum=${i}"><span style="color: gray">${i }</span></a>
										</c:otherwise>
								</c:choose>
					</c:forEach>
		
				<c:if test="${endPage<pageCount }">
					<a href="${pageContext.request.contextPath}/mypage/party?pageNum=${startPage+1}">다음페이지</a>
				</c:if>

		</div>
		</div>
		
		
	</div>	
	</div>
</main>

<footer>
	<jsp:include page="/html&jsp/default/default_footer.jsp"/>
</footer>

</body>
</html>