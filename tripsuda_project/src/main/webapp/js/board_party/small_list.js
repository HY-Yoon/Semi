
let form = {
    pagenum: 1,
    no_dest: true,
    region: "전체",
    no_gender: true,
    gender_limit: "선택 안함",
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

let window_onload = window.onload;
window.addEventListener('load', function()
{
    window_onload ? window_onload() : null;
    sendForm();
})

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

    let list = document.getElementById("pb_list");
	while (list.children.length > 0)
        list.children[0].remove();
    
    let contextPath = sessionStorage.getItem("contextPath");

    let counter = 0;
    for (let article of listData.articles)
    {
        if (++counter > 4)
            break;
        let expire_msg = article.expired == "Y" ? `<span class="pb_expired">지난 여행</span>` : `<span class="pb_hiring">모집 중</span>`;
        let html = `<div class="pb_article" onclick="window.location.replace('${contextPath}/html&jsp/board_party/detail?anum=${article.anum}')">
            <div class="pb_pic">
                <img src="${article.pic_src}">
                <div class="pb_flexcon pb_region">
                    <span>${article.dest}</span><span class="pb_schedule">&nbsp;${article.start_date} ~ ${article.end_date}</span>
                </div>
            </div>
            <div class="pb_content">
                <div style="font-weight: 500;">
                    ${expire_msg}
                    <span class="pb_title">${article.title}</span>
                </div>
                <div class="pb_desc">
                    ${article.little_text}
                </div>
                <div style="pb_display: flex; justify-content: space-between;">
                    <div class="pb_profile">
                        ${article.nick}
                    </div>
                    <div class="pb_view">
                        조회수 ${article.view}
                    </div>
                </div>
            </div>
        </div>`
        list.innerHTML += html;
    }
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