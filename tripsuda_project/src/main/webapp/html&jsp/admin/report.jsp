<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/report.css">
</head>
<script type="text/javascript">
</script>
<body>

<main>
	<div class="wrap">
	<h2>신고내역</h2>
		<div class="list">
		<table>
		<tr>
			<th>번호</th><th>피신고자</th><th>신고자</th><th>신고이유</th><th>신고일자</th>
		</tr>	
		
		<c:forEach var="vo" items="${list }">
			<tr>
				<td class="rnum">${vo.rnum }</td>
				<td class="defend">${vo.def }</td> <!-- 번호가 아니라 아이디로.. -->
				<td class="plaint">${vo.pla }</td>
				<td class="reason">${vo.reason }</td>
				<td class="rdate">${vo.rdate }</td>
			</tr>
		</c:forEach>
				
	</table>
		</div>
	
	
	<div class="paging">
				<c:if test="${startPage>5 }"><a href="${pageContext.request.contextPath}/admin/report?pageNum=${startPage-1}">이전페이지</a>
				</c:if>
		
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${pageNum==i }"> 
										<a href="${pageContext.request.contextPath}/admin/report?pageNum=${i}"><span style="color: #0b81ff">${i }</span></a>		
											</c:when>
								
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/admin/report?pageNum=${i}"><span style="color: gray">${i }</span></a>
										</c:otherwise>
								</c:choose>
					</c:forEach>
		
				<c:if test="${endPage<pageCount }">
					<a href="${pageContext.request.contextPath}/admin/report?pageNum=${startPage+1}">다음페이지</a>
				</c:if>

		</div>



		</div>
		
		</main>
</body>
</html>