<%@page import="vo.MemberVo"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	sessionStorage.setItem("context", "<%=request.getContextPath() %>");
</script>
<div class="container">
    <div class="location-box">
        <div class="legend">
            <p>지역 검색</p>
        </div>
        <div>
            <label for="loc_1">서울<input type="radio" name="location" id="loc_1" value="서울"></label>
            <label for="loc_2">강원도<input type="radio" name="location" id="loc_2" value="강원도"></label>
            <label for="loc_3">제주도<input  type="radio" name="location" id="loc_3" value="제주도"></label>
            <label for="loc_4">부산<input type="radio" name="location" id="loc_4" value="부산"></label>
            <label for="loc_5">경기도<input type="radio" name="location" id="loc_5" value="경기도"></label>
            <label for="loc_6">인천<input type="radio" name="location" id="loc_6" value="인천"></label>
            <label for="loc_7">충청도<input type="radio" name="location" id="loc_7" value="충청도"></label>
            <label for="loc_8">경상도<input type="radio" name="location" id="loc_8" value="경상도"></label>
            <label for="loc_9">전라도<input type="radio" name="location" id="loc_9" value="전라도"></label>
            <button class="search_location_btn" onclick="getList()">검색하기</button>
        </div>
    </div>
	
    <section>
	    <div class="list-top">
            <p>정렬</p>
            <div>
                <select id="order" onchange="getList()">
                    <option value="regdate">최신순</option>
                    <option value="views">조회순</option>
                </select>
            </div>
        </div>
        <div class="list-main">
        	<c:forEach var="vo" items="${list }">
	            	<div class="cont-box" onclick="javascript:goDetail(${vo.getAnum()})">
	            		<div>
	            			<img src="${vo.getThum() }">
	            		</div>
	            		<div class="location">
	            			<div class="loc-icon"></div>
	            			<p>${vo.getLocation()}</p>
	            		</div>
	            		<div class="cont-info">
	            			<p class="cont-tit">
	            				<c:if test="${vo.getNotice() == 'Y' }">
	            					<b>공지사항</b>
	            				</c:if>
	            				${vo.getTitle() }
	            			</p>
	            			<p class="cont-content">${vo.getContent() }</p>
	            			<div class="cont-bot">
	            				<div class="profile-box">
	            					<img src="${pageContext.request.contextPath}/images/common/icon/profile/<%=(int)Math.floor(Math.random() * 4 + 1) %>.svg">
	            					<div>
										<p>${vo.getNick() }</p>
	            					</div>
	            				</div>
	                            <div class="view_cnt">
	                                <div class="views">
	                                    <p>${vo.getViews() }</p>
	                                </div>
	                                <div class="comm_cnt">
	                                    <p>${vo.getCnt() }</p>
	                                </div>
	                            </div>
	            			</div>
	            		</div>
	            	</div>
	        
        	</c:forEach>
       	</div>

        <div class="list-bot">
            <c:if test="${startPage>10 }">
				<a href="${pageContext.request.contextPath }/board_review?pagenum=${startPage-1}&search=${search}&select=${select}">[이전페이지]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a class="active" href="${pageContext.request.contextPath }/board_review?pagenum=${i}&search=${search}&select=${select}"><span>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/board_review?pagenum=${i}&search=${search}&select=${select}"><span>${i }</span></a>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="${pageContext.request.contextPath }/board_review?pagenum=${endPage+1}&search=${search}&select=${select}">[다음페이지]</a>
			</c:if>	
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath }/js/board_review/list.js"></script>