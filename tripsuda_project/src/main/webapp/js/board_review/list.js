/**
 * 여행후기게시판 목록 JS
 */
let default_onload = window.onload; 
window.onload = function(){
	default_onload ? default_onload() : null;
	//헤더 서치박스에 option 지역 지우기
	let top_search = document.getElementsByName("select")[0];
	top_search.options[2].remove();
	//헤더 서치박스 submit 버튼 수정
	let sub_btn = document.querySelector(".search_wrap button");
	sub_btn.type = "button";
	sub_btn.onclick = getList;
	
	//검색을 화면에 보이기
	setSearchOptions();
}

//자세히보기 페이지로 이동
goDetail = function(anum){
	document.location.href = sessionStorage.getItem("context")+
							"/board_review/detail?anum="+anum;
}

let list = {
	order : "",
	tag : "",
	option: "",
	search : ""
}
let param = {
	order : "",
	tag : "",
	option: "",
	search : ""
}

//지역선택시 표시하기
$("input[name=location]").click(function(){
	$(".location-box label").removeClass("active");
	$(this).parent("label").addClass("active");
});


/* 검색후 페이지 셋팅 시작 ==================*/
setSearchOptions = function(){
	setLocation();
	setOption();
	setOrder();
	setSearch();
}

// URLSearchParams 객체 주소창 파라미터 가져오기
const urlParams = new URLSearchParams(location.search);

//tag 설정
setLocation = function(){
	let location = document.getElementsByName("location");
	let location_length = location.length;
	let tag = urlParams.get('tag');
	for(let i =0; i<location_length; i++){
		if(location[i].value == tag){ //지역태그 
			location[i].checked = true;
			location[i].parentNode.className = "active";
		}
	}
}

//option 설정(헤더 검색창)
setOption = function(){
	let option = document.getElementsByName("select")[0];
	let option_length = option.options.length;
	let opt = urlParams.get("option");
	for(let i =0; i<option_length; i++){
		if(option.options[i].value == opt){ //헤더 옵션
			option.options[i].selected = true;
		}
	}
}
//order 설정(정렬)
setOrder = function(){
	let order = document.getElementById("order");
	let order_length = order.options.length;
	let od = urlParams.get("order");
	for(let i =0; i<order_length; i++){
		if(order.options[i].value == od){ //정렬 옵션
			order.options[i].selected = true;
		}
	}
}
//search 설정(검색어)
setSearch = function(){
	let search = document.getElementById("search");
	let param_search = urlParams.get("search") ;
	search.value = param_search;
}
/* 검색후 페이지 셋팅 끝============ */


//tag 설정
getLocation = function(){
	let location = document.getElementsByName("location");
	let location_length = location.length;
	for(let i =0; i<location_length; i++){
		if(location[i].checked){ //지역태그 
			list.tag = "tag="+location[i].value;
		}
	}
}

//option 설정(헤더 검색창)
getOption = function(){
	let option = document.getElementsByName("select")[0];
	let option_length = option.options.length;
	for(let i =0; i<option_length; i++){
		if(option.options[i].selected){ //헤더 옵션
			list.option = "option="+ option.options[i].value;
		}
	}
}
//order 설정(정렬)
getOrder = function(){
	let order = document.getElementById("order");
	let order_length = order.options.length;
	for(let i =0; i<order_length; i++){
		if(order.options[i].selected){ //정렬 옵션
			list.order = "order="+ order.options[i].value;
		}
	}
}
//search 설정(검색어)
getSearch = function(){
	let search = document.getElementById("search");
	list.search =(search.value !== "")? "search="+search.value : "";
}
//파라미터 설정
getParams = function(){
	getLocation();
	getOption();
	getOrder();
	getSearch();
	param.order= (list.order !== "") ? list.order :"";
	param.tag= (list.tag !== "") ? list.tag :"";
	param.option= (list.option !== "") ? list.option :"";
	param.search= (list.search !== "") ? list.search :"";
}

//검색기능
getList = function(){
	getParams();
	let url = "?"+param.order+"&"+param.tag+"&"+param.option+"&"+param.search;
	document.location.href= sessionStorage.getItem("context") + "/board_review"+ url;
}