<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/mypage.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>
<header>
 	<jsp:include page="/html&jsp/default/mypage_header.jsp"/>
</header>


<main class ="wrap">
	<div class="layout">

		<aside>
			<div class="side">
			<div class="profile">
				<div class="img"></div>
				<p>로그인한 아이디</p>
			</div>
			<div class="mypage">
				<ul>
					<li class="list"><a href="#"><span class="txt">계정관리</span></a></li>
					<li class="list"><a href="#"><span class="txt">포인트조회</span></a></li>
					<li class="list"><a href="#"><span class="txt">여행후기</span></a></li>
					<li class="list"><a href="#"><span class="txt">자유게시판</span></a></li>
					<li class="list"><a href="#"><span class="txt">내코멘트</span></a></li>
					<li class="list"><a href="#"><span class="txt">내동행 게시글</span></a></li>
					<li class="list"><a href="#"><span class="txt">내QnA</span></a></li>
				</ul>
			</div>
			</div>
			</aside>


		<div class="content">
		
		</div>
	
	</div>

</main>

<footer>
	<jsp:include page="/html&jsp/default/default_footer.jsp"/>
</footer>



</body>
</html>