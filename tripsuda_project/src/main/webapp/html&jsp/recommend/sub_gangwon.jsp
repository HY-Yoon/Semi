<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 강원 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">424</span>
    <span id="spotName">(평창)상원사</span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>자연</span>
                    <span>별</span>
                    <span>힐링</span>
                    <span>은하수</span>
                </div>
                <h2>
                    <em id="page_title">
                        육백마지기
                    </em>
                </h2>
            </div>
            <div class="summary">
                까만 밤하늘에 총총히 떠 있는 수많은 별과 그 사이를 흘러가는 신비로운 은하수가 가슴을 벅차게 한다.
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    강원 평창군 미탄면 회동리  
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    없음
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
                <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=5ef78854-8087-4c7b-9c9b-be375d9d9556" alt="육백마지기">
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
                <p>강원도 정선군 정선읍과 평창군 미탄면에 걸쳐 있는 해발 1256m의 청옥산 정상 부근에는 ‘육백마지기’라고 하는 너른 평원이 있다. 면적이 볍씨 6백 마지기나 된다는 뜻에서 ‘육백마지기’란 이름이 붙여졌다. 금성을 뜻하는 고어인 ‘육백’과 맞이한다는 뜻의 ‘마지’, 장소를 일컫는 ‘기(基)’에서 이름이 유래됐다는 설도 있다. </p>
                <p>탁 트인 전망이 펼쳐지는 청옥산 육백마지기는 은하수를 조망하기 위한 최적의 장소로 정평이 나 있는데 사진작가들에게는 은하수 사진 촬영을 위한 인기 출사지로도 꼽힌다. 까만 밤하늘에 총총히 떠 있는 수많은 별과 그 사이를 흘러가는 신비로운 은하수가 가슴을 벅차게 한다.</p>
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
                                            <img src="https://www.gangwon.to/servlet/Thumbnail?i=/tour/1024/TOSIGK00/CT10106_T/CT10106_02.jpg&w=615&h=420" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=01176857-a2f0-45c7-91b5-521a1ee2ae1b" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://www.gangwon.to/servlet/Thumbnail?i=/tour/1024/TOSIGK00/CT10106_T/CT10106_01.jpg&w=615&h=420" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=육백마지기&region=KR&language=ko" frameborder="0"></iframe>
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
                        <a href="https://www.gn.go.kr/tour/prog/lod/Sights/S01/sub02_02_01/view.do?cid=745" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=516bae56-c1b1-4cbb-96b8-b54431004185)"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">안반데기 </p>
                                    <span class="small-text">
                                        강릉 해발 1,100m의 고산지대에 위치해 ‘하늘 아래 첫 동네’라고 불리는 안반데기
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.gn.go.kr/tour/prog/lodFesta/Festa/sub02_05/view.do" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://tourdb.gwd.go.kr/img/512/additional/2016/12/13/DB10012_I_01.JPG);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">풍호마을 연꽃축제</p>
                                    <span class="small-text">
                                        강릉 풍호마을의 호수에서 만개한 연꽃을 보고 즐길 수 있는 축제
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.gn.go.kr/tour/prog/lodFesta/Festa/sub02_05/view.do" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(https://tourdb.gwd.go.kr/img/512/additional/2016/01/11/DA0005_I_01.JPG);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">장덕리복사꽃축제</p>
                                    <span class="small-text">
                                        매년 봄 장덕리마을에서 열리는 축제
                                    </span>
                                    <span class="view">자세히 보기+ </span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="https://tour.pc.go.kr/Home/H30000/H30200/placeDetail?place_no=237&viewType=gallery&curationGroup=2&page=1&pageSize=12&order_column=1&place_type=15" target="_blank" title="페이지 이동">
                            <div class="thumb" style="background-image: url(http://tong.visitkorea.or.kr/cms/resource/49/2609549_image2_1.jpg);"></div>
                            <div class="infor-element">
                                <div class="infor-element-inner">
                                    <p class="title">평창대관령음악제</p>
                                    <span class="small-text">
                                        강원문화재단이 주관하는 평창대관령음악제는 강원도의 아름다운 대자연의 품에서 펼쳐지는 음악을 사랑하는 모든 이들을 위한 축제이다.
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
