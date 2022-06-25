window.addEventListener('load', function()
{
    let hbot = document.getElementsByClassName("h_bot")[0];
    console.log(hbot);
    for (let navi of hbot.children)
    {
        if (navi.innerHTML == "자유")
            navi.className = "bot_navi active";
        else
            navi.className = "bot_navi";
        console.log(navi.innerHTML);
    }
});