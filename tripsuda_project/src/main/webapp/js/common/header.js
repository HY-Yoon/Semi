/*header.js */

/*top_navi 클릭시 active class토글 */
let top_navi=document.getElementsByClassName("top_navi");
let add_active1 = function() {
    for (var i = 0; i < top_navi.length; i++){
        top_navi[i].className = "top_navi";
    }
    this.className += " active";
};
for (var i = 0; i < top_navi.length; i++) {
    top_navi[i].addEventListener('click', add_active1, false);
}

/*bot_navi 클릭시 active class토글 */
let bot_navi=document.getElementsByClassName("bot_navi");
let add_active2 = function() {
    for (var i = 0; i < bot_navi.length; i++){
        bot_navi[i].className = "bot_navi";
    }
    this.className += " active";
};
for (var i = 0; i < bot_navi.length; i++) {
    bot_navi[i].addEventListener('click', add_active2, false);
}


let btn_notice= document.getElementsByClassName("btn_notice")[0];
let notice_popup= document.getElementsByClassName("notice_popup")[0];
let btn_profile=document.querySelector(".btn_profile");
let info_popup= document.getElementsByClassName("info_popup")[0];
let btn_write=document.getElementsByClassName("btn_write")[0];
let write_popup= document.getElementsByClassName("write_popup")[0];

// btn_notice에 마우스 오버시 notice_popup 토글
btn_notice.addEventListener("mouseover", function(){
	info_popup.className = "info_popup"; //켜져있는 팝업끄기
	write_popup.className ="write_popup";
    notice_popup.className += " active";
});
notice_popup.addEventListener("mouseleave",function(){
    notice_popup.className = "notice_popup";
});

//btn_write 클릭시 write_popup 토글
btn_write.addEventListener("click",function(){
	info_popup.className = "info_popup"; //켜져있는 팝업끄기
	notice_popup.className = "notice_popup";
    write_popup.className +=" active";
});
write_popup.addEventListener("mouseleave",function(){
    write_popup.className = "write_popup";
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

