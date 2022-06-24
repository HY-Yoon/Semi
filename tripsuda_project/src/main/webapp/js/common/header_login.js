
let btn_notice= document.getElementsByClassName("btn_notice")[0];
let notice_popup= document.getElementsByClassName("notice_popup")[0];
let btn_profile=document.querySelector(".btn_profile");
let info_popup= document.getElementsByClassName("info_popup")[0];

// btn_notice에 마우스 오버시 notice_popup 토글
btn_notice.addEventListener("mouseover", function(){
	info_popup.className = "info_popup"; //켜져있는 팝업끄기
	write_popup.className ="write_popup";
    notice_popup.className += " active";
});
notice_popup.addEventListener("mouseleave",function(){
    notice_popup.className = "notice_popup";
});

//btn_profile 클릭시 info_popup 토글
btn_profile.addEventListener('click',function(){
	notice_popup.className = "notice_popup";
	write_popup.className ="write_popup";
    info_popup.className +=" active";
});
info_popup.addEventListener("mouseleave",function(){
    info_popup.className ="info_popup";
})

//btn_write 클릭시 켜져있는 팝업끄기
btn_write.addEventListener("click",function(){
	info_popup.className = "info_popup"; //켜져있는 팝업끄기
	notice_popup.className = "notice_popup";
});

