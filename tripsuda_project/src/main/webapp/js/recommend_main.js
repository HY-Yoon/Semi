// 현재 시간 가져오기
window.onload =getTime();
window.onload = start_getTime_interval();
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


window.onload = weather();
//현재 날씨 가져오기
function weather(){
    let xhr= new XMLHttpRequest();

		let fav = sessionStorage.getItem("fav");
	 	let course_id = "";
	 	let spotName = "";
	
	switch(fav){
			case '서울':	course_id = 57;spotName='(서울)롯데월드';break;
			case '강원':	course_id = 424;spotName='(평창)상원사';break;
			case '전라':	course_id = 110;spotName='(순천)순천만자연생태공원';break;
			case '인천':	course_id = 339;spotName='(인천)월미공원';break;
			case '경기':	course_id = 45;spotName='(파주)임진각관광지';break;
			case '제주':	course_id = 164;spotName='(제주)우도해양도립공원';break;
			case '충청':	course_id = 363;spotName='(청주)상수허브랜드';break;
			case '경상':	course_id = 199;spotName='(통영)미륵산';break;
			case '부산':	course_id = 309;spotName='(부산)감천문화마을';break;
				
	}

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
            document.querySelector(".status_img img").src= "../../images/recommend/"+img;//날씨 이미지
            document.querySelector(".weather .status").innerHTML= degree +" "+ sky_status; //온도, 날씨
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