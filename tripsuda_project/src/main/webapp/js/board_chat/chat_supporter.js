/**
 *  관리자 채팅
 */

window.addEventListener('load', function()
{
    let div = this.document.createElement("div");
    div.id = "chat_support_div";
    let innerImg = this.document.createElement("img");
    innerImg.id = "chat_support_img";
    innerImg.addEventListener('click', function()
    {
        console.log("click!!");
    });

    div.appendChild(innerImg);
    document.body.appendChild(div);
});