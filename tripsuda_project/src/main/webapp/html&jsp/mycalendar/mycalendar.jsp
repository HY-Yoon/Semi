<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var monthint=new Date().getMonth()+1;
	window.onload=function(){
		calendar();
	}
	function premonth(){
		let week = document.getElementById("week");
		let weekchild=week.childNodes;
		for(let i=weekchild.length-1;i>=0;i--){
			let k=weekchild.item(i);
			week.removeChild(k);
		}
		monthint--;
		let today = new Date(); // 오늘 날짜 구하기
		let todyear=today.getFullYear(); //오늘 연도 구하기
		let toddate=today.getDate(); // 오늘 일 구하기 
		let lastday=new Date(todyear,monthint,0).getDate(); //이번달 말일
		let firstday=new Date(todyear,(monthint-1),1).getDay()-1; //이번달 첫째날 요일(월요일이 0)
		let weekcnt=Math.ceil((firstday+lastday)/7); // 이번달 달력 줄 수 구하기
		let premonth = document.getElementById("premonth");
		let nextmonth = document.getElementById("nextmonth");
		let datecnt=1; // 날짜 입력하기
		let weekchec=1; 
		for(let w=1;w<=weekcnt;w++){ // 해당 월의 주수만큼 tr 엘리먼트를 만들고 주수를 붙여 클래스명을 부여람
			let weekmon=document.createElement("tr"); 
				weekmon.className="weekmon";
				console.log(w+"we");
				for(let i=0;i<(weekcnt*7);i++){
					let day=document.createElement("td");
					if(i==5+(7*(weekcnt-1)) || i==6+(7*(weekcnt-1))){
						day.className="weekend";
					}
					if(w==1){
						if(i>=firstday && datecnt<=lastday){
							day.innerHTML="<p>"+(datecnt++)+"</p>";
							weekmon.appendChild(day);
							if(i%6==0){
								week.appendChild(weekmon);
								break;
							}
						}
					}
					if(datecnt>=6){
						console.log(datecnt);
						day.innerHTML="<p>"+(datecnt)+"</p>";
						weekmon.appendChild(day);
						if(i==6){
							week.appendChild(weekmon);
							break;
						}
						datecnt++
					}
					weekmon.appendChild(day);
				}
	
		}
		
	}
	function nextmont(){
		monthint++;
		let week = document.getElementById("week");
		let weekchild=week.childNodes;
		for(let i=weekchild.length-1;i>=0;i--){
			let k=weekchild.item(i);
			week.removeChild(k);
		}
		let today = new Date(); // 오늘 날짜 구하기
		let todyear=today.getFullYear(); //오늘 연도 구하기
		let toddate=today.getDate(); // 오늘 일 구하기 
		
		let lastday=new Date(todyear,monthint,0).getDate(); //이번달 말일
		let firstday=new Date(todyear,(monthint-1),1).getDay()-1; //이번달 첫째날 요일(월요일이 0)
		let weekcnt=Math.ceil((firstday+lastday)/7); // 이번달 달력 줄 수 구하기
		let premonth = document.getElementById("premonth");
		let nextmonth = document.getElementById("nextmonth");
		let datecnt=1; // 날짜 입력하기
		let weekchec=1; 
		for(let w=1;w<=weekcnt;w++){ // 해당 월의 주수만큼 tr 엘리먼트를 만들고 주수를 붙여 클래스명을 부여람
			let weekmon=document.createElement("tr"); 
				weekmon.className="weekmon";
				console.log(w+"we");
				for(let i=0;i<(weekcnt*7);i++){
					let day=document.createElement("td");
					if(i==5+(7*(weekcnt-1)) || i==6+(7*(weekcnt-1))){
						day.className="weekend";
					}
					if(w==1){
						if(i>=firstday && datecnt<=lastday){
							day.innerHTML="<p>"+(datecnt++)+"</p>";
							weekmon.appendChild(day);
							if(i%6==0){
								week.appendChild(weekmon);
								break;
							}
						}
					}
					if(datecnt>=6){
						console.log(datecnt);
						day.innerHTML="<p>"+(datecnt)+"</p>";
						weekmon.appendChild(day);
						if(i==6){
							week.appendChild(weekmon);
							break;
						}
						datecnt++
					}
					weekmon.appendChild(day);
				}
		}
	}
	function calendar(){
		let week = document.getElementById("week");
		let today = new Date(); // 오늘 날짜 구하기
		let todyear=today.getFullYear(); //오늘 연도 구하기
		monthint=today.getMonth()+1; //오늘 월 구하기
		let yemo=document.getElementById("yearmonth");
		yemo.innerHTML=todyear+"년 "+ monthint+"월 ";
		let toddate=today.getDate(); // 오늘 일 구하기 
		let lastday=new Date(todyear,monthint,0).getDate(); //이번달 말일
		let firstday=new Date(todyear,(monthint-1),1).getDay()-1; //이번달 첫째날 요일(월요일이 0)
		let weekcnt=Math.ceil((firstday+lastday)/7); // 이번달 달력 줄 수 구하기
		let premonth = document.getElementById("premonth");
		let nextmonth = document.getElementById("nextmonth");
		let datecnt=1; // 날짜 입력하기
		let weekchec=1; 
		for(let w=1;w<=weekcnt;w++){ // 해당 월의 주수만큼 tr 엘리먼트를 만들고 주수를 붙여 클래스명을 부여람
			let weekmon=document.createElement("tr"); 
				weekmon.className="weekmon";
				for(let i=0;i<(weekcnt*7);i++){
					let day=document.createElement("td");
					if(i==5 || i==6){
						day.className="weekend";
					}
					if(w==1){
						if(i>=firstday && datecnt<=lastday){
							day.innerHTML="<p>"+(datecnt++)+"</p>";
							weekmon.appendChild(day);
							if(i%6==0){
								week.appendChild(weekmon);
								break;
							}
						}
					}
					if(datecnt>=6){
						day.innerHTML="<p>"+(datecnt)+"</p>";
						weekmon.appendChild(day);
						if(datecnt==toddate){
							day.className="today";
						}
						if(i==6){
							week.appendChild(weekmon);
							break;
						}
						datecnt++
					}
					weekmon.appendChild(day);
				}
		}
	}
</script>
</head>
<body>
 <section>
<div>
	<div> 
		<div id="mycalendar">
			<div id="headercalendar">
				<p id="yearmonth"></p>
			</div>
			<div id="daycalendar">
				<table>
					<tr>
						<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
					</tr>
				</table>
				<table border="1" id="week">
					<tr>
						<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>