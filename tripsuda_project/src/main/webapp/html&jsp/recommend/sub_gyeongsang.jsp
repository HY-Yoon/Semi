<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripSUDA-관광지추천</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reco_sub.css">
<%--서브페이지를 위한 jQuery --%>
<script src="${pageContext.request.contextPath }/js/jQuary/jquery-3.6.0.js"></script>
</head>
<body>
<script type="text/javascript">
	sessionStorage.setItem("contextPath", "<%=request.getContextPath() %>");
</script>
<div id="wrap">
    <header>
        <jsp:include page="/html&jsp/default/default_header.jsp"/>
    </header>
    <main>
   	<%-- 경상도 --%>
		<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
		<div id="pageInfo" style="display: none;">
		    <span id="course_id">199</span>
		    <span id="spotName">(통영)미륵산</span>
		</div>
		
		<div class="top_inner">
		    <div class="container">
		        <div class="info_box">
		            <div class="title">
		                <div class="tag">
		                    <span>바다</span>
		                    <span>산</span>
		                    <span>아이와함께</span>
		                    <span>조망케이블카</span>
		                    <span>자연</span>
		                </div>
		                <h2>
		                    <em id="page_title">
		                        통영케이블카(미륵산)
		                    </em>
		                </h2>
		            </div>
		            <div class="summary">
		                맑은 산바람과 시원한 바닷바람을 동시에 느끼다
		            </div>
		            <ul class="summeary_list">
		                <li>
		                    <span>
		                        <i class="fa fa_map"></i>주소
		                    </span>
		                    경상남도 통영시 발개로 205
		                </li>
		                <li>
		                    <span>
		                        <i class="fa fa_phone"></i>문의처
		                    </span>
		                    1544-3303
		                </li>
		            </ul>
		            <div class="current_info">
		                <p class="tip">
		                    현재 날씨 정보
		                </p>
		                <div class="weather">
		                    <p class="time">
		                        <span class="today">00.00.일 00:00</span>
		                    </p>
		                    <span class="status_img">
		                        <img src="" alt="날씨">
		                    </span>
		                    <span class="status">
		                        
		                    </span>
		                </div>
		            </div>
		            <div class="btn_box">
		                    <button class="list-btn">목록</button>
		                    <button class="link-icon" id="twitter"></button>
		                    <button class="link-icon" id="facebook"></button>
		                    <button class="link-icon" id="band"></button>
		                    <!--  카카오 공유버튼은 API발급되지않아 실행 불가 -->
		                    <button class="link-icon" id="kakao"></button>
		                </div>
		        </div>
		        <div class="thumb">
		            <div>
		                <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e913e2a8-e574-4f64-8f85-07927a9b30da" alt="미륵산">
		            </div>
		        </div>
		    </div>
		</div>
		<div class="middle_inner">
		    <div class="container">
		        <div class="item">
		            <div class="title">
		                <h3>상세소개</h3>
		            </div>
		            <div class="obj">
		                <p>통영 미륵산에 설치된 통영케이블카는 2선(bi-cable) 자동순환식 곤돌라 방식으로 스위스의 최신기술에 의해 설치되었으며, 길이는 1975m다. 평균속도 1초당 4m로 상부역사까지 약 9분이 소요될 예정이며 승객용 곤돌라 47기, 화물용 1기 등 48개의 곤돌라가 순환하게 된다.</p>
		                <p>특히, 친환경적인 설계에 의해 중간지주는 1개만 설치하여, 환경보호는 물론 탑승객에게 아주 편안한 승차감을 제공한다. 또한, 8인승 곤돌라 47대가 연속적으로 탑승객을 운송함으로써 지체 없이 탑승이 가능하며, 가까운 사람끼리 오붓하게 아름다운 한려수도의 경치를 감상할 수 있다. 펫 프렌들리 케이블카 오픈으로 반려동물과 함께 탑승이 가능하다.</p>
		                <div id="tab_wrap" class="tab_wrap">
		                    <div class="tit_wrap">
		                        <ul class="menu_wrap">
		                            <li><button href="#obj2-1" class="ov"><span class="ico ico1"></span>포토갤러리<em>다양한 사진을 확인하세요.</em><span class="arr"></span></button></li>
		                            <li><button href="#obj2-2" class=""><span class="ico ico2"></span>지도<em>지도에서 오시는길을 확인하세요.</em><span class="arr"></span></button></li>
		                        </ul>
		                    </div>
		                    <div class="con_wrap">
		                        <div class="con ov" id="obj2-1">
		                            <p class="skip">포토갤러리</p>
		                            <div class="cont"><!--슬라이드 시작-->
		                                <div class="photo_slide_wrap">
		                                    <div class="photo_slides">
		                                        <div class="photo_slide" id="slide_1">
		                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=edf09934-13ea-4c4e-876f-4b5edd424975" alt="이미지">
		                                        </div>
		                                        <div class="photo_slide" id="slide_2">
		                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=4a14d4f5-e0ca-4e87-8036-5b9bd8c89024" alt="이미지">
		                                        </div>
		                                        <div class="photo_slide" id="slide_3">
		                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=288d0503-fe33-4a2a-b8bf-fdd5281c1554" alt="이미지">
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="controll">
		                                        <button type="button" data-controll="prev" class="prev"></button>
		                                        <div class="paging">
		                                            <span class="indi"></span>
		                                            <span class="indi"></span>
		                                            <span class="indi"></span>
		                                            <span class="indi"></span>
		                                        </div>
		                                        <button type="button" data-controll="next" class="next"></button>
		                                    </div>
		                                </div>
		                            </div><!--슬라이드 끝-->
		                        </div>
		
		                        <div class="con" id="obj2-2">
		                            <p class="skip">지도</p>
		                            <div class="cont">
		                                <iframe 
		                                    width="100%"
		                                    height="450"
		                                    style="border: 0;"
		                                    loading="lazy"
		                                    allowfullscreen
		                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDcMhxkQwl_PPTvbguHOoQj4GRxoSmFhUQ&q=통영케이블카&region=KR&language=ko" frameborder="0"></iframe>
		                            </div>
		                        </div>
		
		                    </div>
		
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <div class="title">
		                <h3>이용안내</h3>
		            </div>
		            <div class="obj add-info">
		                <p>
		                    <strong>이용시간</strong>
		                </p>
		                <p>- 동절기(10월~3월) 평일 09:30~16:00, 주말·공휴일 09:30~16:00 <br>
		                    - 춘·추계(4,9월) 평일 09:30~17:00, 주말·공휴일 09:30~17:00 <br>
		                    - 성수기·하절기(5~8월) 평일 09:30~18:00 주말·공휴일 09:30~18:00 <br>
		                    ※ 날씨 관계로 휴장하거나 운행이 중단될 수 있으니 사전 확인 필요 <br>
		                    ※ 매표는 운행종료 2~3시간 전에 조기마감 될 수 있음 <br>
		                    ※ 5월, 8월, 10월은 조기운행 및 연장운행 할 수 있음 <br>
		                    ※ 상기 운행시간은 상황에 따라 변동될 수 있으므로 사전확인 필요</p>
		                <p>
		                    <strong>휴무일</strong>
		                </p>
		                <p>매월 2,4주차 월요일(두번쨰, 네번째 월요일이 공휴일인 경우 익일)</p>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="attractions">
		    <div class="container">
		        <div class="item">
		            <div class="title">
		                <h3>연관 추천 정보</h3>
		            </div>
		            <div class="obj">
		                <ul class="article_list">
		                    <li>
		                        <a href="https://www.timf.org/kr/" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=17ad2638-5bac-417c-a5cc-06898da77513)"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">통영국제음악제</p>
		                                    <span class="small-text">
		                                        ‘다양성 속의 비전(Vision in Diversity)’
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="http://www.hansanf.org" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=3a3f019f-031b-4780-8060-4828d35bcbb5);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">통영한산대첩축제</p>
		                                    <span class="small-text">
		                                        한산대첩의 위대한 승리를 생생하게 느껴보자
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="http://www.k-island.org/" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=89702246-9eee-4d74-9de6-4a3a4661968e);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">제2회 섬의 날</p>
		                                    <span class="small-text">
		                                        섬, 쉼이되다
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="http://ttaf.kr" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=bdabc791-48cb-467d-ba21-73b0b4644b98);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">통영연극예술축제</p>
		                                    <span class="small-text">
		                                        통영시는 통제영 당시 12공방의 예술혼이 면면히 이어져 온 예술의 고장으로 통영만의 독특한 전통 공연예술인 통영오광대, 남해안별신굿, 승전무 등이 아직도 살아 숨 쉬고 있다.
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </div>
		</div>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
</div>
<!-- sub page javaScript -->
<script src="${pageContext.request.contextPath }/js/recommend_sub.js"></script>
</body>
</html>