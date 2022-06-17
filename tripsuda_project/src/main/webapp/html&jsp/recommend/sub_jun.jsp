<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전라도 --%>
<link rel="stylesheet" href="./css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">110</span>
    <span id="spotName">(순천)순천만자연생태공원</span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>갈대</span>
                    <span>생태공원</span>
                    <span>아이와함께</span>
                    <span>희귀조류</span>
                    <span>자연</span>
                </div>
                <h2>
                    <em id="page_title">
                        순천만 자연생태공원
                    </em>
                </h2>
            </div>
            <div class="summary">
                고흥반도와 여수반도 사이에 형성된 만, 우리나라의 대표적인 연안 습지
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    전라남도 순천시 순천만길 513-25
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    061-749-6052
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
                <img src="https://t1.daumcdn.net/brunch/service/user/1jPF/image/qFZGU4gYug8cv0rEOGb5jbIJc9U.jpg" alt="순천만">
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
                <p>전남 순천시 순천만은 고흥반도와 여수반도 사이에 형성된 만으로 우리나라의 대표적인 연안 습지다. 순천만에는 다양하고 풍부한 습지 생물이 서식하고 있어 습지 연구에 매우 중요한 지역이다. 순천만에서 우리나라에서 가장 넓은 면적의 갈대 군락을 볼 수 있다. 갈대 군락은 생물들에게 또 다른 보금자리를 마련하여 현재 이곳에는 국제보호조인 흑두루미, 검은머리갈매기 외에도 황새, 저어새, 혹부리오리, 논병아리, 고방오리, 왜가리 등 다양한 생물이 서식한다. 이 외에 순천만에서는 유유히 흐르는 S자형 수로, 칠면초 군락 등 수려한 해안생태 경관을 볼 수 있다. 특히 S자형 수로는 우리나라 사진작가들이 10대 낙조 풍광 중 하나로 꼽았고, 2006년에는 한국관광공사 최우수 경관 감상지로 선정되는 등 빼어난 풍경을 자랑한다.</p>
                <p>순천만은 약 8,000년의 역사를 가지고 있다. 지구상의 마지막 빙하기가 끝나고 해수면이 약 160m 상승하면서 서해가 육지에서 바다로 변하였을 때 처음 생성된 것으로 추정된다. 약 540만㎡에 달하는 갈대 군락은 하천이 직강화(直降化)되면서 토사의 유입량이 많아지고 습지 면적이 늘어나면서 자연스럽게 형성됐다. 크기는 물론 보유하고 있는 생물의 종도 남다른 만큼 순천만은 2003년 12월 습지보호지역으로 지정·관리되고 있다. 2004년에는 동북아 두루미 보호 국제네트워크에 가입, 2006년 1월 20일에는 국내 연안 습지 최초로 람사르협약에 등록되었다. 2008년 6월, 순천만의 생물학적 가치가 인정되어 국가지정문화재 명승으로 지정되었다.</p>
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
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=dda9e13c-d081-4826-adbf-28a4efd72548" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2F62EDCC1143964167ACBE95CA8EF1AC19" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F410037b3fef1f744aea32af74554beee28d4a6c6%3Foriginal" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=순천만습지&region=KR&language=ko" frameborder="0"></iframe>
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
                <p>화요일~일요일, 08:00~일몰 시까지(야간천문대 이용은 22:00까지)</p>
                <p>
                    <strong>휴무일</strong>
                </p>
                <p>매주 월요일 (배·기차·천문대 등의 시설만 이용 불가, 공원 입장 가능)</p>
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
                        <a href="http://tour.shinan.go.kr" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=50cafadf-b2f0-47b4-87d3-22ab1bfd9667)"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">신안 섬수국축제</p>
                                    <span class="small-text">
                                        다양한 꽃구경하러 오세요!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.xn--q20b02dt1iwpiewfoma840bq6d0tq.com/" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=b00ba5dd-b7b3-44dd-84b5-49143cc509a3);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">남도음식문화큰잔치</p>
                                    <span class="small-text">
                                        남도의 맛! 세계를 잇다!
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://festival.jangheung.go.kr/festival" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://festival.jangheung.go.kr/images/festival/main/visual_01.jpg?build_20220613001);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">정남진장흥물축제</p>
                                    <span class="small-text">
                                        무더위 날려버릴 시원한 축제
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.gokseong.go.kr/tour/festivity/rose" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://www.gokseong.go.kr/tour/contents/77/festivity_rose1.jpg?build_20220607001);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">곡성 세계장미축제</p>
                                    <span class="small-text">
                                        전 세계 명품 장미를 한 곳에서 볼 수 있는 국내 유일의 기회!
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
