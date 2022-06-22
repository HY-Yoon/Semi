/**
 * 여행후기게시판 editor JS
 */
 
 let editor ={
	anum : document.getElementById("anum"),
	mnum : document.getElementById("mnum"),
	summernote : document.getElementById("summernote"),
};

let default_form = {
	anum : '0',
	mnum : '0',
	content : "<p><br></p>",
}
let form = {
	anum : '',
	mnum : '',
	content : "",
}
window.addEventListener('load',function()
{
	$('#summernote').summernote({
		  height: 200,	// 에디터 높이
		  minHeight: null,	// 최소 높이
		  maxHeight: null,	// 최대 높이
		  focus: false, 	// 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",	// 한글 설정
		  placeholder: '내용을 입력하세요.',	//placeholder 설정
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
})

chkForm = function()
{
	form.anum = editor.anum.value;
	form.mnum = editor.mnum.value;
	form.content = $('#summernote').summernote('code');
	console.log(form);
	
	if(form.anum != default_form.anum && form.mnum != default_form.mnum && form.content !=default_form.content){
		sendForm();
	}else{
		$('#popup').addClass("active");
	}
	
}
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
			let result = xhr.responseText;
			window.location.href = result;									
		}
	}
	let url = sessionStorage.getItem("contextPath");
		url += "/board_review/comm/write";
	
	xhr.open("post",url,true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(form));
}

cancle = function()
{
	let url = sessionStorage.getItem("contextPath");
		url	+= "/board_review/detail?anum=" + editor.anum.value;
	window.location.href = url;
}