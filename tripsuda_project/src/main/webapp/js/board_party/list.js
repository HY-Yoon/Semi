/**
 * 
 */
let limiter = {
    region: document.getElementById("region_select"),
    gender: document.getElementById("gender_select"),
    age: document.getElementById("age_select"),
    schedule: document.getElementById("schedule_select")
};

const REGION_LIST = ["전체", "서울", "인천", "부산", "제주도", "경기도", "강원도", "충청도", "경상도", "전라도"];
const GENDER_LIST = ["선택 안함", "남성", "여성"];

let form = {
    pagenum: 1,
    no_dest: true,
    region: REGION_LIST[0],
    no_gender: true,
    gender_limit: GENDER_LIST[0],
    age_limit: {
        no_limit: true,
        min_age: '10',
        max_age: '80'
    },
    schedule: {
        no_limit: true,
        start: '1970-01-01',
        end: '1970-01-01'
    }
};

window.addEventListener('load', function()
{
    initializeLimiter();
    sendForm();
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
    form.no_dest = name == REGION_LIST[0];
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
    form.no_gender = name == GENDER_LIST[0];
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
onCheckDateIgnore = function()
{
    let cb = document.getElementById("date_ignore_check");
    form.age_limit.no_limit = cb.checked;
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

let ____listData = {
    pagenum : 1,
    max_page : 1,
    articles : {
        anum : 0,
        dest : "",
        pic_src : "",
        start_date : "1/1",
        end_date : "12/31",
        expired : "N",
        title : "",
        little_text : "",
        nick : "",
        view : 0
    }
};

// listData json 파일 받아서 리스트에 출력
updateList = function(listData)
{
    console.log(listData);

    let list = document.getElementById("list");
	while (list.children.length > 0)
        list.children[0].remove();
    
    let contextPath = sessionStorage.getItem("contextPath");

    for (let article of listData.articles)
    {
        let expire_msg = article.expired == "Y" ? `<span class="expired">지난 여행</span>` : `<span class="hiring">모집 중</span>`;
        let html = `<div class="article" onclick="window.location.replace('${contextPath}/html&jsp/board_party/detail?anum=${article.anum}')">
            <div class="pic">
                <img src="${article.pic_src}">
                <div class="flexcon region">
                    <span>${article.dest}</span><span class="schedule">&nbsp;${article.start_date} ~ ${article.end_date}</span>
                </div>
            </div>
            <div class="content">
                <div style="font-weight: 500;">
                    ${expire_msg}
                    <span class="title">${article.title}</span>
                </div>
                <div class="desc">
                    ${article.little_text}
                </div>
                <div style="display: flex; justify-content: space-between;">
                    <div class="profile">
                        ${article.nick}
                    </div>
                    <div class="view">
                        조회수 ${article.view}
                    </div>
                </div>
            </div>
        </div>`
        list.innerHTML += html;
    }
    let page = document.getElementById("page");
    let pagestart = parseInt(listData.pagenum / 10) * 10 + 1;
    let pageend = listData.max_page > pagestart + 9 ? pagestart + 9 : listData.max_page;
    console.log(pagestart + " // " + pageend);

	while (page.children.length > 0)
        page.children[0].remove();

    if (pagestart > 10)
        page.innerHTML += `<a href="javascript:changePage(${pagestart - 1})"><< 이전</a>`;
    for (let p = pagestart; p <= pageend; p++)
    {
        let style = p == listData.pagenum ? `style="color: #0b81ff; font-weight: 700;"` : ``;
        page.innerHTML += `<a href="javascript:changePage(${p})" ${style}>${p}</a>`;
    }
    if (pageend < listData.max_page)
        page.innerHTML += `<a href="javascript:changePage(${pagestart + 10})">다음 >></a>`;
}

changePage = function(_page)
{
    form.pagenum = _page;
    sendForm();
}

sendForm = function() 
{
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText; 
            updateList(JSON.parse(result));
		}
	};
	let url = sessionStorage.getItem("contextPath")
		 + "/html&jsp/board_party/list";
    console.log(url);
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(form));
}