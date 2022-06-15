<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 서울 --%>
<link rel="stylesheet" href="./css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">57</span>
    <span id="spotName">(서울)롯데월드</span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>랜드마크</span>
                    <span>쇼핑</span>
                    <span>공원</span>
                    <span>산책</span>
                    <span>공연</span>
                </div>
                <h2>
                    <em id="page_title">
                        롯데월드타워
                    </em>
                </h2>
            </div>
            <div class="summary">
                글로벌 상징성과 한국의 전통미, 인간과 기술, 첨단과 자연이 공존하는 롯데월드타워
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    서울 송파구 올림픽로 300 (신천동 29)  
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    02-3213-5000
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
                <img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14920&fileTy=MEDIA&fileNo=1&thumbTy=L" alt="롯데월드타워">
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
                <p>글로벌 상징성과 한국의 전통미, 인간과 기술, 첨단과 자연이 공존하는 롯데월드타워는 하나의 건축물에 도시생활의 모든 것을 구현한 수직도시이다. </p>
                <p>555m, 123층의 거대한 수직도시 롯데월드타워에는 국내 최고 높이(500m) 전망대인 서울스카이(SEOUL SKY), 국내 최고 수준의 호텔 시그니엘서울(SIGNIEL SEOUL), 프리미엄 헬스케어센터와 피트니스센터, 파이낸스센터가 입점한 포디엄이(PODIUM) 위치하여 그 높이만큼 특별한 가치를 경험할 수 있다.</p>
                <p>또한 글로벌 패션 허브 롯데월드몰에는 국내 최대 규모의 시내 면세점인 롯데면세점, 대한민국 최고, 최대의 명품 백화점 에비뉴엘, 국내 최대 도심형 수족관 롯데월드 아쿠아리움, 국내 최초 빈야드 스타일 클래식 전용 홀인 롯데콘서트홀과 아시아 최대 규모의 멀티플렉스 롯데시네마 등이 자리하여 첨단 라이프스타일과 놀랍고 차별화된 경험을 할 수 있다.</p>
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
                                            <img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14921&fileTy=MEDIA&fileNo=1&thumbTy=L" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14922&fileTy=MEDIA&fileNo=1&thumbTy=L" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14923&fileTy=MEDIA&fileNo=1&thumbTy=L" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=롯데월드타워&region=KR&language=ko" frameborder="0"></iframe>
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
                <p>매일 09:00 - 20:30 롯데면세점, 연중 무휴 <br>
                    매일 10:00 - 23:00 롯데마트, 격주 일요일 휴무<br>
                    매일 10:00 - 20:00 롯데아쿠아리움, 연중 무휴<br>
                    매일 10:30 - 20:00 에비뉴엘, 월 1회 정기 휴무<br>
                    매일 10:30 - 22:00 쇼핑몰, 연중 무휴<br>
                    서울스카이<br>
                    평일 11:00 - 21:00 (월~목요일, 일요일)<br>
                    주말 11:00 - 22:00 (금~토요일)<br>
                    공휴일 11:00 - 22:00 (공휴일 전일 포함)<br>
                    ※시설별 상이 (홈페이지 참조)
                </p>
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
                        <a href="https://www.songpa.go.kr/culture/detailInfo.do?key=3794&resrceCd=CT0155-1000031&" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image:url(https://www.tournews21.com/news/photo/201204/5950_7802_1240.jpg)"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">21km 송파둘레길 벚꽃나들이</p>
                                    <span class="small-text">
                                        서울시 송파구 석촌호수 공원 일대에서 개최하는 벚꽃 축제로 매년 4월 초에 열린다.
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.songpa.go.kr/hanseong/index.do?" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://www.songpa.go.kr/site/hanseong/images/main/visual2_darken.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">한성백제문화제 대백제전</p>
                                    <span class="small-text">
                                        서울을 대표하는 역사문화축제
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://pmf.co.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(http://pmf.co.kr/wp-content/uploads/2020/03/%EC%9B%B97.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">2022 서울 파크 뮤직 페스티벌</p>
                                    <span class="small-text">
                                        도심에서 펼쳐지는 국내 최대 피크닉 뮤직 페스티벌!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://seouljazz.co.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(http://seouljazz.co.kr/data/file/index_banner/237439385_Ich6AXVS_f5f27473c45a9284533962ec5d33f9512ccc3e23.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">서울재즈페스티벌 (SJF)</p>
                                    <span class="small-text">
                                        눈부신 봄날, 서울시 송파구 잠실 올림픽공원 잔디마당에서 아시아 정상의 재즈 축제인 '서울 재즈페스티벌'이 개최된다. 매년 5월 펼쳐지는 이 페스티벌은 세계 유명한 아티스트들이 대거 출연하여 눈과 귀를 즐겁게 한다.
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

<!-- javaScript -->
<script src="./js/recommend_sub.js"></script>
