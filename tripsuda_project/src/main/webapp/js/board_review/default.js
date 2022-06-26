/**
 * 여행후기 게시판 default js
*/
window.onload = function(){
	document.getElementsByClassName("bot_navi active")[0].className ="bot_navi";
	document.getElementsByClassName("bot_navi")[3].className ="bot_navi active";
	//header 검색창 placeholder설정
	let search = document.getElementById("search");
	search.setAttribute("placeholder","여행후기를 찾아보세요!");
}
 