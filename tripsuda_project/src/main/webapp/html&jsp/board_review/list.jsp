<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="location-box">
        <div class="legend">
            <p>지역 선택</p>
        </div>
        <div>
            <label for="loc_1">서울<input type="radio" name="location" id="loc_1" value="서울"></label>
            <label for="loc_2">강원도<input type="radio" name="location" id="loc_2" value="강원도"></label>
            <label for="loc_3">제주도<input type="radio" name="location" id="loc_3" value="제주도"></label>
            <label for="loc_4">부산<input type="radio" name="location" id="loc_4" value="부산"></label>
            <label for="loc_5">경기도<input type="radio" name="location" id="loc_5" value="경기도"></label>
            <label for="loc_6">인천<input type="radio" name="location" id="loc_6" value="인천"></label>
            <label for="loc_7">충청도<input type="radio" name="location" id="loc_7" value="충청도"></label>
            <label for="loc_8">경상도<input type="radio" name="location" id="loc_8" value="경상도"></label>
            <label for="loc_9">전라도<input type="radio" name="location" id="loc_9" value="전라도"></label>
            <button>검색하기</button>
        </div>
    </div>

    <section>
        <div class="list-top">
            <p>정렬</p>
            <div>
                <select id="order">
                    <option value="regdate">최신순</option>
                    <option value="views">조회순</option>
                </select>
            </div>
        </div>
		
        <div class="list-main">
            	<div class="cont-box">
            		<div>
            			<img src="${vo.getThum() }">
            		</div>
            		<div class="location">
            			<div class="loc-icon"></div>
            			<p>${vo.getLocation()}</p>
            		</div>
            		<div class="cont-info">
            			<p>${vo.getTitle() }</p>
            			<p>${vo.getContent() }</p>
            			<div class="cont-bot">
            				<div class="profile-box">
            					<img src="${pageContext.request.contextPath}/images/common/icon/profile/<%=(int)Math.floor(Math.random() * 4 + 1) %>.svg">
            					<div>
            					<%String nick = MemberDao.getInstance().select() %>
            						<p></p>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
        </div>

        <div class="list-bot">

        </div>
    </section>
</div>