<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- home.css 적용 -->
<link rel="stylesheet" href="./css/home.css">
<section>
    <div class="swiper_container">
        <div class="swiper_pagination">
            <span class="swiper-pagination-bullet active"></span>
            <span class="swiper-pagination-bullet"></span>
            <span class="swiper-pagination-bullet"></span>
            <span class="swiper-pagination-bullet"></span>
        </div>
        <div class="swiper_wrap">
            <div class="swiper_slide">
                <div class="main_slide">
                    <a href="#">
                        <div>
                            <p>여행 전문가가 추천하는</p>
                            <p>강릉 1박2일 투어!</p>
                            <p>추천글보고, 떠나볼까요?</p>
                        </div>
                        <img src="./images/slide/slide01.webp" alt="슬라이드1">
                        <button>추천글 보러가기</button>
                    </a>
                </div>
                <div class="main_bg"></div>
            </div>
        </div>
    </div>
    <div>
        동행란
        <jsp:include page="/html&jsp/board_party/small_list.jsp"/>
    </div>
    <div class="slide_btn_wrap">
        <button class="btn_prev">
            <img src="./images/slide/icon/arrow_main_left.svg">
        </button>
        <button class="btn_pause">
            <img src="./images/slide/icon/arrow_main_pause.svg">
        </button>
        <button class="btn_next">
            <img src="./images/slide/icon/arrow_main_right.svg">
        </button>
    </div>
</section>

