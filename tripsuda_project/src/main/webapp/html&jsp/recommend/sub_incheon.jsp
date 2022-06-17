<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 인천 --%>
<link rel="stylesheet" href="./css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">339</span>
    <span id="spotName">(인천)월미공원</span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>공원</span>
                    <span>안전여행</span>
                    <span>야경</span>
                    <span>인생샷</span>
                    <span>테마파크</span>
                </div>
                <h2>
                    <em id="page_title">
                        월미테마파크
                    </em>
                </h2>
            </div>
            <div class="summary">
                아름다운 야경을 품고 있는 월미도
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    인천 중구 월미문화로 81
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    032-761-0997
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
                <img src="https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI21122716225959207" alt="월미도">
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
                <p>1992년 마이랜드로 첫 개장한 뒤로 줄곧 사랑을 받아왔다. 그 후 2009년 더 풍부한 놀잇거리와 즐길거리를 갖추어 월미테마파크란 이름으로 재개장했다. 4000평 규모의 월미테마파크의 수용 인원은 2000여 명이다.</p>
                <p>월미테마파크에서 가장 눈에 띄는 놀이시설은 대관람차 ‘문아이’다. 지상 최대 115m 높이의 대관람차를 타면 인천대교, 작약도, 무의도, 팔미도가 한 눈에 감상할 수 있다. 특히 해가 질 무렵 관람차에서 바라보는 석양과 황금빛 바다는 환상적 분위기를 자아낸다. 바다와 월미도를 수놓은 아름다운 불빛이 만들어내는 낭만 야경은 연인들의 데이트 코스로 찾고 있다. 월미테마파크의 마스코트 디스코 팡팡은 DJ의 재미있는 입담과 신나는 음악을 함께 들으며 즐기는 놀이기구다. 지상 70m 높이에서 순간 속도 200km 떨어지는 하이퍼드롭과 세계 최초의 2층 바이킹, 빠르게 회전하며 달리는 스핀 코스터 등 스릴 넘치는 놀이시설도 인기다. 이외에도 2500평 규모의 키즈카페 차피패밀리파크와 20여 가지의 실내 어린이 놀이시설, 4D 영상관까지 갖추고 있어 남녀노소 누구나 즐길 수 있는 여행지가 됐다. 인근에 월미문화관, 이민사박물관, 월미테마파크, 월미유람선 등이 있다.</p>
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
                                            <img src="https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI21122716225959423" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI21122716225959691" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=129c9a07-b1a6-4d4c-bdb4-9558fdc21f47" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=월미테마파크&region=KR&language=ko" frameborder="0"></iframe>
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
                <p>평일 10:00~21:00, 주말 및 공휴일 10:00-23:00 <br>
                    차미패밀리파크<br>
                    평일 10:00~19:00, 주말 및 공휴일 10:00-21:00</p>
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
                        <a href="https://www.pentaport.co.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image:url(https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI22010517004365516)"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">인천 펜타포트 음악축제</p>
                                    <span class="small-text">
                                        매년 8월 초 인천에서 개최하는 역사와 전통이 있는 대한민국 대표 아웃도어 락 페스티벌
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.culturenight.co.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI22010517233941333);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">인천개항장 문화재 야행</p>
                                    <span class="small-text">
                                        개항장 일대의 문화재 곳곳에서 다양한 체험과 볼거리, 즐길거리, 먹거리 등을 만날 수 있으며, 이외에도 문화해설사와 함께 하는 역사도보투어와 무형문화재, 문화재 버스킹 공연 등 시민들이 직접 참여할 수 있는 다양한 프로그램도 진행된다.
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://cultureport.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=b14cd29f-220f-4eb7-9d73-562931dcc96c);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">인천공항 봄 정기공연</p>
                                    <span class="small-text">
                                        인천공항 개항 18주년 기념 정기콘서트 <br>
                                        'HEART BLOSSOM CONCERT'<br>
                                        인천공항 개항 18주년, 설렘과 감동이 피어나다!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.naver.com/wffii" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=196e672d-dd0b-496f-b9ad-8b906315fe3a);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">인천여성영화제</p>
                                    <span class="small-text">
                                        17회 인천여성영화제 &lt;오늘을 단단하게 걷는다&gt;
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
