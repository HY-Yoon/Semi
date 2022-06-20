<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 경기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">45</span>
    <span id="spotName">(파주)임진각관광지 </span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>공원</span>
                    <span>평화</span>
                    <span>조형</span>
                    <span>수도권</span>
                    <span>역사</span>
                </div>
                <h2>
                    <em id="page_title">
                        평화누리공원 임진각
                    </em>
                </h2>
            </div>
            <div class="summary">
                평화가 깃든 자연 휴식처
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    경기도 파주시 문산읍 임진각로 177
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    031-953-4744
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
                <img src="https://ggtour.or.kr/cgi/upload/story100/01%20%EA%B3%A8%EB%AA%A9%EC%97%90%EC%84%9C%20%EB%A7%8C%EB%82%9C%20%EB%8F%84%EC%8B%9C%20%EC%9D%B4%EC%95%BC%EA%B8%B0/04%20%ED%8C%8C%EC%A3%BC%20%EC%9E%A5%ED%8C%8C%EB%A6%AC/img/edit_images07.JPG" alt="평화누리공원">
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
                <p>서울시청에서 북서쪽으로 약 56km, 군사분계선에서 7km 남쪽으로 임진강을 사이에 두고 위치한 임진각은 6.25 전쟁의 비극이 그대로 남아 있는 대한민국 대표 평화관광지이다. 전쟁의 아픈 흔적을 살펴보면서 평화의 소중함을 배울 수 있는 곳이다. 다양한 전쟁유물이 산재되어 있으며 전시관은 물론 3만평 규모의 잔디밭이 펼쳐 있는 평화누리공원이 있어 관광명소로 많이 알려져 있다.</p>
                <p>임진각 일원은 6.25전쟁중에는 참담한 전쟁터이기도 했다. 전쟁초기에 폭파되어 지금까지도 남아 있는 임진강 철교, 공산군의 포로였던 국군과 유엔군이 자유를 찾아 건너왔던 자유의 다리가 있다. 북한 실향민을 위한 임진각이 세워지면서 임진각관광지로 지정되었다. 현재는 평화누리, 임진각 평화곤돌라, 6.25전쟁납북자기념관, 어린이 놀이시설 등의 새로운 시설이 들어서면서 14만평의 대규모 관광지가 되었다.</p>
                <p>* 평화누리 공원 <br>
                    3만평의 대형 잔디언덕과 수상야외공연장으로 이루어진 자연 친화적 공간으로 분단의 상징인 임진각을 화해와 상생, 평화와 통일의 상징으로 전환하기 위해 조성되었다. 평화누리를 대표하는 장소는 ‘바람의 언덕’이다. 3,000개의 형형색색의 바람개비들이 돌고 있어 가족과 연인들을 위한 포토존과 드라마, CF촬영지로 인기만점인 곳이다.</p>
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
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=cc5a1db2-74ec-4d90-ae98-a0b49ef96bf1" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://ggtour.or.kr/cgi/upload/story100/01%20%EA%B3%A8%EB%AA%A9%EC%97%90%EC%84%9C%20%EB%A7%8C%EB%82%9C%20%EB%8F%84%EC%8B%9C%20%EC%9D%B4%EC%95%BC%EA%B8%B0/04%20%ED%8C%8C%EC%A3%BC%20%EC%9E%A5%ED%8C%8C%EB%A6%AC/img/edit_images09.JPG" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=5621f6bc-6c35-4001-8eeb-2d9e6f6a6806" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=평화누리공원&region=KR&language=ko" frameborder="0"></iframe>
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
                        <a href="https://tour.paju.go.kr/tour/festival/festival02/festival02_2/festival02_2_01/festival02_2_01_01.jsp" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=01ced96a-a91e-454b-9486-dc7fdda7e486)"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">파주장단콩축제</p>
                                    <span class="small-text">
                                        웰빙명품! 장단콩 세상!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.bcj.co.kr/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=b1acba20-1b10-41a7-a184-a061afc20116);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">벽초지수목원 국화축제</p>
                                    <span class="small-text">
                                        동서양의 아름다운 정원을 모두 품은 곳, 벽초지수목원의 가을꽃 국화축제로 초대합니다.
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.bicof.com/intro.php" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://www.bicof.com/__upload/history/1653979701_3888.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">부천국제만화축제</p>
                                    <span class="small-text">
                                        아시아 최고의 글로벌 만화축제, 부천국제만화축제(BICOF)!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://ggtour.or.kr/enjoy/festival.php?tmenu=&smenu=&stitle=&tsort=1&msort=11&board_code=13&board=13&s_category_name=&s_view_yn=&key=&ordering=1&no=72923&mode=detail&page=1&s_tag=&s_admin_no=" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://ggtour.or.kr/cgi/upload/comm_board/20210326094603.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">수원 화성문화제</p>
                                    <span class="small-text">
                                        제22대 정조대왕의 효심과 부국강병의 원대한 꿈으로 축성된 세계문화유산 수원화성에서 펼쳐지는 대표적인 전통문화관광축제 
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
<script src="${pageContext.request.contextPath }/js/recommend_sub.js"></script>
