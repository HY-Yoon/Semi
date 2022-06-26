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
   	<%-- 부산 --%>
		<!-- 날씨를 얻어오기 위한 현재 페이지 정보 -->
		<div id="pageInfo" style="display: none;">
		    <span id="course_id">309</span>
		    <span id="spotName">(부산)감천문화마을</span>
		</div>
		
		<div class="top_inner">
		    <div class="container">
		        <div class="info_box">
		            <div class="title">
		                <div class="tag">
		                    <span>야경</span>
		                    <span>산복도로</span>
		                    <span>180계단</span>
		                    <span>포토존</span>
		                </div>
		                <h2>
		                    <em id="page_title">
		                        호천마을
		                    </em>
		                </h2>
		            </div>
		            <div class="summary">
		                별빛이 쏟아져 내린 듯한 야경을 가진 곳
		            </div>
		            <ul class="summeary_list">
		                <li>
		                    <span>
		                        <i class="fa fa_map"></i>주소
		                    </span>
		                    부산광역시 부산진구 엄광로 491
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
		                <img src="https://bto.or.kr/attach/IMAGE/Board/95/2021/3/KkCmGzRAQBfxFsKx.JPG" alt="호천마을">
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
		                <p>부산의 특색 중 하나로 산복도로가 꼽히고, 그 중 가장 유명한 곳을 꼽자면 감천문화마을이 있다. 그리고 또 떠오른 산복도로 마을이 있으니 바로 드라마 ‘쌈마이웨이’ 촬영지로 알려진 호천마을이다. 옛날에는 산세가 험해 호랑이가 자주 나타나서 붙은 이름인 호천마을. 호랑이가 사라진 산비탈엔 옹기종기 집들이 들어서고 오렌지색 따뜻한 가로등이 골목골목을 비춘다.</p>
		                <p>호천마을은 멋진 야경이 낭만적인 ‘야경 맛집’ 이다. 그러니 시간을 택할 수 있다면 저녁 시간에 찾아보는 것이 좋겠다. 또 산복도로마을이라서 걸어서 올라간다면, 두 다리를 믿은 자신을 탓하게 될 테니, 마을버스 혹은 택시를 타고 올라간 후 아래로 내려가면서 산복도로 경치와 골목골목을 감상하는 게 좋겠다.</p>
		                <p>산복도로길과 바로 붙어있는 호천문화플랫폼에 들어서면 눈에 띄는 건 빨간색 ‘쌈마이웨이’ 표지판, 그리고 노란색 전구불이다. 우리를 ‘쌈마이 감성’에 젖어들게 만드는 드라마 속 ‘남일바’를 이곳에서 만날 수 있다. 드라마 속 사고뭉치 주인공들이 야경을 배경삼아 떡볶이와 맥주를 마시며 신세한탄을 하던 바로 그 자리. 그 신세한탄 혹은 소망을 소주병에 넣어 매달아놓는 것도 이 곳 호천마을만의 ‘쌈마이감성’ 이라고 할 수 있겠다.</p>
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
		                                            <img src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191227202221044_wufrotr" alt="이미지">
		                                        </div>
		                                        <div class="photo_slide" id="slide_2">
		                                            <img src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191227202219701_wufrotr" alt="이미지">
		                                        </div>
		                                        <div class="photo_slide" id="slide_3">
		                                            <img src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191227202231904_oen" alt="이미지">
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
		                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDcMhxkQwl_PPTvbguHOoQj4GRxoSmFhUQ&q=호천마을&region=KR&language=ko" frameborder="0"></iframe>
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
		                        <a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=3f61273a-8ae7-4c8f-b62f-e3fa52489826&big_category=A02&mid_category=A0207&big_area=6" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image:url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=112e1567-350f-4c46-ac1b-fe67976c149c)"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">부산 불꽃축제</p>
		                                    <span class="small-text">
		                                        "세계인과 함께하는 부산불꽃축제"
		                                        <br>
		                                        매년 가을밤 광안리해수욕장의 하늘과 바다를 화려하게 수놓는 부산불꽃축제는 부산시민들의 사랑과 관심 속에서 어느덧 16회를 맞이하게 되었다. 이제는 부산시민만의 축제가 아닌 국내 타지역 및 해외 관광객들이 몰려와 함께하는 대한민국 대표 불꽃축제로서 자리매김하고 있다.
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=308ca299-8c4a-4a2c-a116-bdae634aba46&big_category=A02&mid_category=A0207&big_area=6" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e791de1a-dcbd-46a4-b1d7-9ec79f4531ee);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">부산 사상 전통달집놀이</p>
		                                    <span class="small-text">
		                                        정원대보름을 맞는 부산 사상구는 삼락생태공원 일대에서 '사상전통달집놀이' 행사를 개최한다. 지신밟기, 부럼깨기 등의 대보름 세시 프로그램과 윷놀이, 연날리기, 전통줄다리기 등 민속놀이 경연이 준비되어있다.
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="http://www.busanhandmadefair.com/new_t/html/" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=549844f2-3740-4fb1-b959-2f3babecd5fa);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">K-핸드메이드&일러스트레이션페어</p>
		                                    <span class="small-text">
		                                        'K-핸드메이드&일러스트레이션페어 부산'은 부산∙경남 지역 최대 핸드메이드&일러스트레이션페어로서, 매 회차 3만명 이상의 관람객을 동원하며 올해로 6회차를 맞이하고 있다.
		                                    </span>
		                                    <span class="view">자세히 보기+ </span>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=5cd62b37-3ca4-4052-9e59-52a538072920&big_category=A02&mid_category=A0207&big_area=6" target="_blank" title="페이지 이동">
		                            <div class="thumb" style="background-image: url(https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=fb744e14-b710-4605-854c-51833d9f3a42);"></div>
		                            <div class="infor-element">
		                                <div class="infor-element-inner">
		                                    <p class="title">제11회 부산 MICE Festival</p>
		                                    <span class="small-text">
		                                        시민, 업계, 학계, 학생 등 다양한 주체가 모여 부산 MICE 산업의 미래 발전 방향에 대해 모색하고 MICE 구성원 간 협력체계를 구축하는 자리를 마련한다. 
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