<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<c:set var="member" value="${requestScope.memberInfo}"/>
<main class ="wrap">
	<div class="layout">

		<aside>
			<div class="side">
			<div class="profile">
				<div class="img"></div>
				<p>${member.name}님 환영합니다!</p>
			</div>
			<div class="mypage">
				<ul>
					<li class="list"><a href="${pageContext.request.contextPath}/memberModifyForm"><span class="txt">나의정보수정</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/html&jsp/Point/point.jsp"><span class="txt">포인트조회</span></a></li>
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
           <div class="form">
			<div class="input-box">
				<label id="title">아이디</label>
				<span>${member.id}</span>
			</div>
						
			<div class="input-box">
				<label id="title">이름</label>
				<span>${member.name}</span> 
			</div>
			
			<div class="input-box">
				<label id="title">닉네임</label>
				<span>${member.nick}</span>
			</div>
					
			<div class="input-box">
				<label id="title">전화번호</label>
				<span>${member.phone}</span>
			</div>
			
			<div class="input-box">
				<label id="title">생일</label>
				<span>${member.birth}</span>
			</div>
			<div class="input-box">
				<label id="title">관심지역</label>
				<span>${member.favorite}</span>
			</div>
					
			<div class="input-box">
				<label id="title">등급</label>
				<span>${member.grade}</span>
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