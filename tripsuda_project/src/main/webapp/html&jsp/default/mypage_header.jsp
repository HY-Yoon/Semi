<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="h_top">
        <div class="h_left">
            <a href="/community" target="_self"> <img src="${pageContext.request.contextPath }/images/common/logo_SUDA.svg" alt="logo"></a>
            <div class="h_nav">
                <button class="top_navi">커뮤니티</button>
                <button class="top_navi">관광추천</button>
            </div>
        </div>

        <div class="h_right">                    
            <c:choose>
                <c:when test="${empty sessionScope.id}">
                    <button class="login">로그인</button>
                    <button class="join">회원가입</button>
                </c:when>
                <c:otherwise>
                    <button class="btn_notice"></button>
                    <button class="btn_profile">
                        <img src="${pageContext.request.contextPath }/images/common/vector_profile_default.svg" alt="프로필">
                    </button>
                    <div class="notice_popup">
                        <div class="notice_top">
                            <button class="chat active">채팅</button>
                            <button class="alarm">알림</button>
                        </div>
                        <div class="notice_content">
                            <button onclick="window.location.replace('<%=request.getContextPath()%>/board_chat/main')">전체 채팅방으로 이동하기</button>
                        </div>
                    </div>
                    <div class="info_popup">
                        <div class="area_porfile">
                            <img src="${pageContext.request.contextPath }/images/common/vector_profile_default.svg" alt="프로필">    
                            <div>
                                <p>${sessionScope.id}</p>
                                <button>마이페이지</button>
                            </div>
                        </div>
                        <button class="btn_logout">로그아웃</button>
                    </div>
                </c:otherwise>
            </c:choose>
            <button class="btn_write">글쓰기</button>
            <div class="write_popup">
                <button onclick="window.location.replace('<%=request.getContextPath()%>/html&jsp/board_party/editpage.jsp')">
                    <img src="${pageContext.request.contextPath }/images/common/letter_color.svg" alt="이미지">
                    <p>여행친구 찾기</p>
                </button>
                <button>
                    <img src="${pageContext.request.contextPath }/images/common/magnifier_color.svg" alt="이미지">
                    <p>여행 질문하기</p>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath }/js/common/header.js"></script>
<%--로그인했을때--%>
<c:choose>
     <c:when test="${not empty sessionScope.id}">
     	<script src="${pageContext.request.contextPath }/js/common/header_login.js"></script>
     </c:when>
</c:choose>
