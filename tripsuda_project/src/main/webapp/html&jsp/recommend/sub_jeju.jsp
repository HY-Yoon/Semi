<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제주 --%>
<link rel="stylesheet" href="./css/reco_sub.css">
<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
<div id="pageInfo" style="display: none;">
    <span id="course_id">164</span>
    <span id="spotName">(제주)우도해양도립공원</span>
</div>

<div class="top_inner">
    <div class="container">
        <div class="info_box">
            <div class="title">
                <div class="tag">
                    <span>섬속의섬</span>
                    <span>경관/포토</span>
                    <span>유네스코</span>
                    <span>자연경관</span>
                </div>
                <h2>
                    <em id="page_title">
                        우도
                    </em>
                </h2>
            </div>
            <div class="summary">
                한해 약 200만 명의 관광객이 찾는 제주의 대표적인 부속섬
            </div>
            <ul class="summeary_list">
                <li>
                    <span>
                        <i class="fa fa_map"></i>주소
                    </span>
                    제주특별자치도 제주시 우도면 삼양고수물길 1
                </li>
                <li>
                    <span>
                        <i class="fa fa_phone"></i>문의처
                    </span>
                    (+82) 064-728-1527
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
                <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg" alt="우도">
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
                <p>우도는 소가 누워있는 모양을 닮았다고 해서 일찍부터 소섬 또는 쉐섬으로 불리웠다. 완만한 경사와 옥토, 풍부한 어장, 우도팔경 등 천혜의 자연조건을 갖춘 관광지로써 한해 약 200만 명의 관광객이 찾는 제주의 대표적인 부속섬이다. </p>
                <p>성산항과 종달항에서 우도가는 배를 탈 수 있는데 어디서 출발하든 15분 정도 소요된다. 섬의 길이는 3.8km, 둘레는 17km. 쉬지 않고 걸으면 3~4시간 걸리는 거리지만, 대부분의 관광객은 버스나 자전거, 미니 전기차를 타고 유명한 관광지 위주로 돌아본다. 

                    검멀레해변이나 우도봉, 홍조단괴해변, 하고수동해변 등 유명한 관광지 1-2개를 둘러보고, 카페나 음식점에서 휴식을 즐겨도 대략 3-4시간 정도 소요된다. 여유있게 우도를 즐기고 싶다면 오전 아침배를 타고 들어가 오후 배를 타고 나와 하루종일 우도에 머물러 보는것도 좋다. 단, 기상에 따라 배 운항여부가 달라질수 있으니 우도 여행일정을 짜는데는 기상조건을 필히 확인해야한다. </p>
                <p>※ 우도 외부차량(렌터카, 전세버스) 반입 제한 조치는 2022년 7월 31일까지로 연장되었다. <br>
                    (단, 1~3급 장애인과 만 65세 이상 노약자, 임산부, 만 6세 미만의 영유아를 동반하는 경우와 우도에 숙박하는 관광객이 탄 렌터카는 반입 가능하다.)</p>
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
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=298419cd-c6c4-41fc-82dc-49dab7e8abbe" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_2">
                                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201907/30/066d3cb8-f967-449d-8f35-7b00dbd84cf8.jpg" alt="이미지">
                                        </div>
                                        <div class="photo_slide" id="slide_3">
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=3d21448d-53db-4510-8ee4-e5c13e5d03eb" alt="이미지">
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
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB70pt_GZK1TuoW4Vq-itkkLGZm_FvaJFk&q=우도&region=KR&language=ko" frameborder="0"></iframe>
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
<script src="./js/recommend_sub.js"></script>
