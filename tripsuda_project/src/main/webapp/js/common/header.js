
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

let btn_write=document.getElementsByClassName("btn_write")[0];
let write_popup= document.getElementsByClassName("write_popup")[0];

//btn_write 클릭시 write_popup 토글
btn_write.addEventListener("click",function(){
    write_popup.className +=" active";
});
write_popup.addEventListener("mouseleave",function(){
    write_popup.className = "write_popup";
});
