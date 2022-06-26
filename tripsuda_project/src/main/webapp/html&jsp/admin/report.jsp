<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIPSUDA-관리자페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin/memberDetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/list.css">
</head>
<body>
	<header>
		<jsp:include page="/html&jsp/default/mypage_header.jsp" />
	</header>
	<main>
		<div class="container">
			<section class="menu_section">
				<jsp:include page="/html&jsp/admin/menu.jsp" />
			</section>
			<section class="content_section">
				<h2>신고내역</h2>
				<div class="list">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>피신고자</th>
								<th>신고자</th>
								<th>신고이유</th>
								<th>신고일자</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td class="rnum">${vo.rnum }</td>
								<td class="defend">${vo.def }</td>
								<!-- 번호가 아니라 아이디로.. -->
								<td class="plaint">${vo.pla }</td>
								<td class="reason">${vo.reason }</td>
								<td class="rdate">${vo.rdate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>


				<div id="page">
					<c:if test="${startPage>5 }">
						<a
							href="${pageContext.request.contextPath}/admin/report?pageNum=${startPage-1}">이전페이지</a>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${pageNum==i }">
								<a
									href="${pageContext.request.contextPath}/admin/report?pageNum=${i}"><span
									style="color: #0b81ff">${i }</span></a>
							</c:when>

							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/report?pageNum=${i}"><span
									style="color: gray">${i }</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${endPage<pageCount }">
						<a
							href="${pageContext.request.contextPath}/admin/report?pageNum=${startPage+1}">다음페이지</a>
					</c:if>

				</div>
			</section>
		</div>
	</main>
	<footer>
		<jsp:include page="/html&jsp/default/default_footer.jsp" />
	</footer>
	<script
		src="${pageContext.request.contextPath }/js/admin/meberdetail.js"></script>
</body>
</html>