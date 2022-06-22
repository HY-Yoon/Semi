/**
 * 여행후기게시판 수정 JS
 */
 
 let editor ={
	anum : document.getElementById("anum"),
	mnum : document.getElementById("mnum"),
	title : document.getElementById("title"),
	summernote : document.getElementById("summernote"),
	tag : document.getElementById("hashtag"),
	icon : document.getElementsByClassName("icon-wrap")[0]
};

let form = {
	anum : "",
	mnum : "",
	location : "",
	thumimg : null,
	title : "",
	content : "",
	tag : "",
};
$("input[name=location]").click(function(){
	$(".location-box label").removeClass("active");
	$(this).parent("label").addClass("active");
});

window.addEventListener('load',function()
{
	$('#summernote').summernote({
		  height: 400,	// 에디터 높이
		  minHeight: null,	// 최소 높이
		  maxHeight: null,	// 최대 높이
		  focus: false, 	// 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",	// 한글 설정
		  placeholder: '',	//placeholder 설정
          toolbar: [ 
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['codeview', 'help']]
			  ],	
	});		
	$('#summernote').summernote('code', sessionStorage.getItem('content'));
});
cancle = function(){
	let url = sessionStorage.getItem("contextPath")
		url +="/board_review/list";
	window.location.href = url;
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
			let box = document.getElementById("thum_input");
            let p = document.getElementById("thum_notice");
            let img = document.createElement("img");
            if (p != null)
                p.innerText="";
            img.id="thum_img";
            img.src = fileReader.result;
            box.appendChild(img);
            form.thumimg = fileReader.result;
            editor.icon.id = "close";
        }
    };
    input.click();
};

//이미지 삭제
editor.icon.addEventListener("click",function()
{
	let p = document.getElementById("thum_notice");
	let img = document.getElementById("thum_img");
	if(editor.icon.id == "close")
	{
		editor.icon.id = "";
		p.innerText = "배경사진을 선택해주세요";
		img.remove();
	}
});

chkForm = function()
{
	form.mnum = editor.mnum.value;
	form.location = $("input[name=location]:checked").val();
	form.thumimg = document.getElementById("thum_img").src;
	form.title =editor.title.value;
	form.tag = editor.tag.value;
	form.content = $('#summernote').summernote('code');
	console.log(form);
	
	if(form.location != "" && form.title != "" && form.content != ""){
		sendForm();
	}else{
		$('#popup').addClass("active");
	}
	
};

$('#popup').click(function(){
	$(this).removeClass("active");
});


sendForm = function()
{
	let xhr= new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if(xhr.readyState ==4 && xhr.status ==200)
		{
			let data = xhr.responseText;
			let result= JSON.parse(data);
			window.location.href = result.url;									
		}
	}
	let url = sessionStorage.getItem("contextPath");
		url += "/board_review/write";
	
	xhr.open("post",url,true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(form));
};

