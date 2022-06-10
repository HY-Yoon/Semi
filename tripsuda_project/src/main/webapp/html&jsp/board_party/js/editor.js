/**
 * 
 */

const REGION_LIST = ["서울", "인천", "부산", "제주도", "경기도", "강원도", "충청도", "경상도", "전라도"];

let limiter = {
    region: document.getElementById("region_select"),
    gender: document.getElementById("gender_select"),
    age: document.getElementById("age_select"),
    schedule: document.getElementById("schedule_select"),
    memcount: document.getElementById("memcount_select")
};

let editor = {
    backimg: document.getElementById("backimg_edit"),
    title: document.getElementById("title_edit"),
    summernote: document.getElementById("summernote"),
};

window.addEventListener('load', function()
{
    console.log($('#summernote'));
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        lang: 'ko-KR',
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });

    initializeLimiter();
})

initializeLimiter = function()
{
    for (let reg of REGION_LIST)
    {
        let ele = document.createElement("button");
        ele.className = "region_btns";
        ele.width = "auto";
        ele.fontSize = "15px";
        ele.fontWeight = "400";
        ele.innerText = reg;
        limiter.region.appendChild(ele);
    }
}