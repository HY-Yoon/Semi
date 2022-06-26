/**
 *  
 */

const REGION_LIST = ["서울", "인천", "부산", "제주도", "경기도", "강원도", "충청도", "경상도", "전라도"];
const GENDER_LIST = ["선택 안함", "남성", "여성"];

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
    tag: document.getElementById("tag_edit"),
};

let form = {
    is_edit: false,
    edit_anum: 0,
    region: '',
    gender_limit: '',
    age_limit: {
        no_limit: false,
        min_age: '10',
        max_age: '80'
    },
    schedule: {
        start: null,
        end: null
    },
    member_count: '2',
    thumbnail_image_base64: null,
    title: '',
    content: '',
    tag: ''
};

window.addEventListener('load', function()
{
    console.log($('#summernote'));
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 300,
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
    
    // 에딧 캐시가 있는 경우(수정하는 경우)
    let edit_cache = JSON.parse(sessionStorage.getItem("edit_cache"));
    console.log(edit_cache);
    if (edit_cache != null)
    {
        form.is_edit = true;
        form.edit_anum = edit_cache.anum;

        // form.region = edit_cache.region;
        onClickRegion(edit_cache.region);
        
        // form.gender_limit = edit_cache.gender;
        onClickGender(edit_cache.gender);

        form.min_age = edit_cache.age_min;
        form.max_age = edit_cache.age_max;
        if (parseInt(form.min_age) == 0 && parseInt(form.max_age) == 0)
            setAgeIgnore();
        onCheckAgeIgnore();

        form.schedule.start = edit_cache.start_date;
        document.getElementById("startdate").value = edit_cache.start_date;
        form.schedule.end = edit_cache.end_date;
        document.getElementById("enddate").value = edit_cache.end_date;

        // form.member_count = edit_cache.mem_count;
        document.getElementById("memcount_range").value = edit_cache.mem_count;
        onChangeMemCount();
        
        document.getElementById("backimg_file").src = edit_cache.back_img;
        form.thumbnail_image_base64 = edit_cache.back_img;

        editor.title.value = edit_cache.title;

        $('#summernote').summernote('code', edit_cache.content);

        editor.tag.value = edit_cache.tags;
    }
})

initializeLimiter = function()
{
    for (let reg of REGION_LIST)
    {
        let ele = document.createElement("button");
        ele.className = "region_btns";
        ele.fontSize = "15px";
        ele.style = "width: auto; fontWeight: 400;";
        ele.innerText = reg;
        ele.addEventListener('click', function()
        { onClickRegion(reg); });
        limiter.region.appendChild(ele);
    }
    onClickRegion(REGION_LIST[0]);
    for (let reg of GENDER_LIST)
    {
        let ele = document.createElement("button");
        ele.className = "gender_btns";
        ele.fontSize = "15px";
        ele.style = "width: auto; fontWeight: 400;";
        ele.innerText = reg;
        ele.addEventListener('click', function()
        { onClickGender(reg); });
        limiter.gender.appendChild(ele);
    }
    onClickGender(GENDER_LIST[0]);
}

onClickRegion = function(name)
{
    for (let btn of limiter.region.getElementsByClassName("region_btns"))
    {
        if (btn.innerText == name)
        {
            form.region = btn.innerText;
            btn.style = "color: #0b81ff; font-weight: 700;";
        }
        else
            btn.style = "font-weight: 400;";
    }
}
onClickGender = function(name)
{
    for (let btn of limiter.gender.getElementsByClassName("gender_btns"))
    {
        if (btn.innerText == name)
        {
            form.gender_limit = btn.innerText;
            btn.style = "color: #0b81ff; font-weight: 700;";
        }
        else
            btn.style = "font-weight: 400;";
    }
}
setAgeIgnore = function()
{
    let cb = document.getElementById("age_ignore_check");
    cb.checked = true;
}
onCheckAgeIgnore = function()
{
    let cb = document.getElementById("age_ignore_check");
    let ls = document.getElementById("age_limit_span");
    console.log(cb.checked);
    if (cb.checked)
    {
        ls.style = "color: gray";
        for (let num of ls.children)
            num.disabled = true;
        form.age_limit.no_limit = true;
    }
    else
    {
        ls.style = "";
        for (let num of ls.children)
        {
            num.disabled = false;
        }
        form.age_limit.no_limit = false;
        form.age_limit.min_age = ls.children[0].value;
        form.age_limit.max_age = ls.children[1].value;
    }
}
onChangeMemCount = function()
{
    let val = document.getElementById("memcount_range");
    let memcnt = document.getElementById("memcount");
    memcnt.innerText = val.value + "명";
    form.member_count = val.value;
}
onChangeImage = function()
{
    let input = document.createElement("input");
    input.type = "file";
    input.accept = "image/*";
    input.onchange = _ => {
        let files = Array.from(input.files);
        const fileReader = new FileReader();
        fileReader.readAsDataURL(files[0]);
        fileReader.onload = function() {
            let bin = document.getElementById("backimg_input");
            let p = document.getElementById("backimg_notice");
            let img = document.getElementById("backimg_file");
            if (p != null)
                p.remove();
            img.src = fileReader.result;
            form.thumbnail_image_base64 = fileReader.result;
        }
        console.log(files);
    };
    input.click();
}
onChangeSchedule = function(isStart)
{
    if (isStart)
    {
        let start = document.getElementById("startdate");
        form.schedule.start = start.value;
    }
    else
    {
        let end = document.getElementById("enddate");
        form.schedule.end = end.value;
    }
}

sendForm = function() 
{
    form.title = editor.title.value;
    form.tag = editor.tag.value;
    form.content = $('#summernote').summernote('code');

	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
            location.href = result;
		}
	};
	let url = sessionStorage.getItem("contextPath")
		 + "/board_party/write";


    console.log(form);
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(form));
}