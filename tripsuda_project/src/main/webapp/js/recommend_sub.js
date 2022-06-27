/* 관광지 추천 공통 JS*/
let windowOnload = window.onload;
window.onload = function(){
	windowOnload ? windowOnload() : null;
	//이미지 슬라이드
	start_photo_interval();
	// 현재 시간 가져오기
	getTime();
	start_getTime_interval();
	//현재 날씨 가져오기
	weather();
}
//목록 돌아가기
document.getElementsByClassName("list-btn")[0].onclick = function(){
	window.location.href = "/tripsuda_project/recomain";
} 


//SNS공유버튼
const pageTitle= document.getElementById("page_title").innerText;
const sendText = pageTitle + " 관광지추천보러가기"; //전달할 텍스트
const sendURL = window.location.href ; //전달할 URL(현재 페이지)

document.getElementById("twitter").addEventListener('click',function shareTwitter(){
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendURL);
});
document.getElementById("facebook").addEventListener('click',function shareFacebook(){
    var url = "http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(sendURL);
    window.open(url, "", "width=486, height=286");
});

document.getElementById("band").addEventListener('click',function shareBand(){
    var url = "http://www.band.us/plugin/share?body="+encodeURIComponent(sendText)+"&route="+encodeURIComponent(sendURL);
window.open(url, "shareBand", "width=400, height=500, resizable=yes");
});


// 카카오 공유버튼은 API발급되지않아 실행 불가
function shareKakao() {
    // 사용할 앱의 JavaScript 키 설정
    Kakao.init('카카오에서 발급받은 API키');

    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
        container: '#kakao', // 카카오공유버튼ID
        objectType: 'feed',
        content: {
            title: sendText, // 보여질 제목
            description: sendText, // 보여질 설명
            imageUrl: sendURL, // 콘텐츠 URL
            link: {
                mobileWebUrl: sendURL,
                webUrl: sendURL
            }
        }
    });
}


//이미지 슬라이드
var photo_interval;
var photo_length= $('.photo_slide').length;
function start_photo_interval(){
    var index= 1;
    photo_interval=setInterval(function(){
        $('.photo_slide').css({opacity:"0",});
        $('.photo_slide').eq(index).css({opacity:"1",});
        index++;
        if(index >= photo_length) index=0;
    },3000);
}

//포토갤러리/지도 전환
$(".menu_wrap li button").click(function(){
    $(".menu_wrap li button").removeClass("ov");
    $(this).addClass("ov");

    var index= $(this).parent().index();
    $(".con_wrap .con").removeClass("ov");
    $(".con_wrap .con").eq(index).addClass("ov");
});


// 현재 시간 가져오기
var getTime_interval;
function start_getTime_interval(){
    getTime_interval=setInterval(function(){
        getTime();
    },60000);
}

function getTime(){
    let today= new Date();
    let month= today.getMonth()+1; //달
    if(month < 10){//한자리 일때 앞에 0 붙이기
        month = "0" + month;
    }
    let date= today.getDate();//일
    let hours = today.getHours(); // 시
    if(hours < 10){//한자리 일때 앞에 0 붙이기
        hours = "0" + hours;
    }
    let minutes = today.getMinutes();  // 분
    if(minutes < 10){//한자리 일때 앞에 0 붙이기
        minutes = "0" + minutes;
    }
    let day= today.getDay();//요일
    let dayOfWeek ="";
    switch(day){ //요일을 한글로 변환하기
        case 0: dayOfWeek="일"; break;
        case 1: dayOfWeek="월"; break;
        case 2: dayOfWeek="화"; break;
        case 3: dayOfWeek="수"; break;
        case 4: dayOfWeek="목"; break;
        case 5: dayOfWeek="금"; break;
        case 6: dayOfWeek="토"; break;
    }
    let time_str= month + "."+date+"."+ dayOfWeek + " "+ hours+":"+minutes;
    document.getElementsByClassName("today")[0].innerText= time_str;
}

//현재 날씨 가져오기
function weather(){
    let xhr= new XMLHttpRequest();
    let course_id= document.getElementById("course_id").innerText; //현재 페이지 정보
    let spotName= document.getElementById("spotName").innerText; //현재 페이지 정보
    console.log(spotName);
    xhr.onreadystatechange=function(){
        if(xhr.readyState == 4 && xhr.status==200){
            let xml=xhr.responseXML;
            let item=xml.getElementsByTagName("spotName");
            let degree =""; //기온
            let sky="";//하늘상태
            let img="";//날씨 이미지
            let sky_status ="";
            for(var i=0; i<item.length; i++){
                if(item[i].textContent == spotName){
                    degree= xml.getElementsByTagName("th3")[i].textContent;
                    sky = xml.getElementsByTagName("sky")[i].textContent;
                }
            }
            degree = "<span>"+degree +"도</span>";
            switch(sky){
                case '1': img="weather01.png"; sky_status="<span>맑음</span>"; break;
                case '2': img="weather02.png"; sky_status="<span>구름</span>"; break;
                case '3': img="weather03.png"; sky_status="<span>흐림</span>"; break;
                case '4': img="weather04.png"; sky_status="<span>비</span>"; break;
                case '5': img="weather04.png"; sky_status="<span>소나기</span>"; break;
                case '8': img="weather05.png"; sky_status="<span>눈</span>"; break;
                default: img="weather05.png"; sky_status="<span>눈비</span>"; break;
            }
            document.querySelector(".status_img img").src= sessionStorage.getItem("contextPath")+"/images/recommend/"+img;//날씨 이미지
            document.querySelector(".weather .status").innerHTML= degree + sky_status; //온도, 날씨
        }
    }
    let today= new Date();
    let month= today.getMonth()+1; //달
    if(month < 10){//한자리 일때 앞에 0 붙이기
        month = "0" + month;
    }
    let date= today.getDate();//일
    let hours = today.getHours(); // 시
    if(hours < 10){//한자리 일때 앞에 0 붙이기
        hours = "0" + hours;
    }
    let key="9Ajz01IOELOw1Ybi16gqy4Cn%2B%2BM2Q5XlVfGGqBNjoeu2Hnix2aAGnbtGP4W56NaquGK77BpodFCodSQ4DGtbHg%3D%3D";
    let current_date= today.getFullYear() + month+ date + hours + "";
    //프록시 오류때문에 앞에 cors~~붙여야함
    let url= "https://cors-anywhere.herokuapp.com/"+"http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst?serviceKey="+key+"&numOfRows=100&pageNo=1&CURRENT_DATE="+current_date+"&HOUR=24&COURSE_ID="+course_id;
    console.log(url);
    xhr.open("get", url,true);
    xhr.send();
}