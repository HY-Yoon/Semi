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
   	<%-- 충청도 --%>
	<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
	<div id="pageInfo" style="display: none;">
	    <span id="course_id">363</span>
	    <span id="spotName">(청주)상수허브랜드</span>
	</div>
	
	<div class="top_inner">
	    <div class="container">
	        <div class="info_box">
	            <div class="title">
	                <div class="tag">
	                    <span>자연</span>
	                    <span>경치</span>
	                    <span>한천팔경</span>
	                    <span>힐링</span>
	                    <span>산/계곡</span>
	                </div>
	                <h2>
	                    <em id="page_title">
	                        월류봉(한천팔경)
	                    </em>
	                </h2>
	            </div>
	            <div class="summary">
	                달도 머물다 가는 월류봉
	            </div>
	            <ul class="summeary_list">
	                <li>
	                    <span>
	                        <i class="fa fa_map"></i>주소
	                    </span>
	                    충북 영동군 황간면 원촌리
	                </li>
	                <li>
	                    <span>
	                        <i class="fa fa_phone"></i>문의처
	                    </span>
	                    043-745-7741 / 043-740-3205 ~ 7 (영동군청 문화체육정책실)
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
	                <img src="https://tour.chungbuk.go.kr/DATA/tour/main/thumb/t_15124473403.jpg" alt="월류봉">
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
	                <p>높이 약 400m의 봉우리로 동서로 뻗은 능선은 6개의 봉우리로 이루어져있다. 깎아지른 절벽산인 월류봉 아래로 물 맑은 초강천(草江川) 상류가 휘감아 흘러 수려한 풍경을 이룬다. ‘달이 머물다 가는 봉우리’라는 뜻의 월류봉(月留峯)이란 이름처럼 직립한 절벽에 걸려 있는 달의 정경이 특히 아름답다고 알려져 있다. 예로부터 이 일대의 뛰어난 경치를 ‘한천팔경(寒泉八景)’이라 하였다.</p>
	                <p>한천팔경은 제1경인 월류봉을 비롯하여 사군봉(使君峯)·산양벽(山羊壁)·용연동(龍淵洞)·냉천정(冷泉亭)·화헌악(花獻岳)·청학굴(靑鶴窟)·법존암(法尊巖)으로 이루어져 있는데 대부분 월류봉의 여러 모습을 지칭한 것이다. 화헌악은 월류봉이 진달래와 철쭉으로 붉게 물든 모습을 가리키고, 용연동은 월류봉 아래의 깊은 소(沼)를 말하며, 산양벽(산양암)은 월류봉의 가파른 절벽을 이르는 것이다. <신증동국여지승람> 제16권 충청도 황간현(黃澗縣) 불우조에 ‘심묘사(深妙寺)의 팔경(八景)’으로 기록되어 있는 곳이 바로 한천팔경이다.</p>
	                <p>우암 송시열(宋時烈 1607~1689)은 한때 이곳에 머물며 작은 정사를 짓고 학문을 연구하였는데 월류봉 아래쪽에 우암을 기리기 위해 건립한 한천정사(寒泉精舍, 충청북도문화재자료 제28호)와 영동 송우암 유허비(충청북도기념물 제46호)가 있다.</p>
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
	                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=60f1233a-4eb7-497d-be6d-aa64382741cd" alt="이미지">
	                                        </div>
	                                        <div class="photo_slide" id="slide_2">
	                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=27e7a7bd-a6f6-4b41-8070-f316da3af72a" alt="이미지">
	                                        </div>
	                                        <div class="photo_slide" id="slide_3">
	                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f4e06bc6-486e-43ba-96d8-6d6efcc8f5a3" alt="이미지">
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
	                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDcMhxkQwl_PPTvbguHOoQj4GRxoSmFhUQ&q=월류봉,충청북도+영동군+황간면+원촌리+47&region=KR&language=ko" frameborder="0"></iframe>
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
	                <p>없음</p>
	                <p>
	                    <strong>휴무일</strong>
	                </p>
	                <p>연중무휴</p>
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
	                        <a href="https://www.goesanfestival.com/" target="_blank" title="페이지 이동">
	                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=beda4f18-9348-4f67-8599-8a38bc53059e)"></div>
	                            <div class="infor-element">
	                                <div class="infor-element-inner">
	                                    <p class="title">괴산대학찰옥수수축제</p>
	                                    <span class="small-text">
	                                        충청북도 괴산군에서 열리는 여름축제, 괴산대학찰옥수수축제
	                                    </span>
	                                    <span class="view">자세히 보기+ </span>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="https://www.danyang.go.kr/sobaeksan/650" target="_blank" title="페이지 이동">
	                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=d076348c-15d5-4f13-a951-b2a5b224e8b1);"></div>
	                            <div class="infor-element">
	                                <div class="infor-element-inner">
	                                    <p class="title">제38회 단양 소백산 철쭉제</p>
	                                    <span class="small-text">
	                                        개막식 콘서트 등 다양한 공연과 풍성한 체험행사로 연인 및 가족 모두가 즐길수 있는 축제로 분홍분홍한 봄빛에 물드는 하늘정원 소백산이 펼처진 단양에서 아름다운 추억을 만들어보자! <br>
	                                        대한민국 대표 관광지 단양에서 즐거운 추억도 만들GO 금 한 돈도 가져가GO~
	                                    </span>
	                                    <span class="view">자세히 보기+ </span>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="https://www.jincheon.go.kr/site/culture/sub.do?menukey=2832" target="_blank" title="페이지 이동">
	                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f6002c2a-5b71-4e0a-908a-40a7cbfb599d);"></div>
	                            <div class="infor-element">
	                                <div class="infor-element-inner">
	                                    <p class="title">생거진천 농다리축제</p>
	                                    <span class="small-text">
	                                        조상의 슬기를 배워가고자 농다리를 테마로한 이색적 축제
	                                    </span>
	                                    <span class="view">자세히 보기+ </span>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="http://pumba21.com/" target="_blank" title="페이지 이동">
	                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=9bc43273-2ec8-497c-b9e6-914ba351561e);"></div>
	                            <div class="infor-element">
	                                <div class="infor-element-inner">
	                                    <p class="title">음성 품바축제</p>
	                                    <span class="small-text">
	                                        품바, 사랑과 나눔으로 치유하다.
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