/**
 * 여행후기게시판 detail.js
 */
let context = sessionStorage.getItem("contextPath");
let anum = sessionStorage.getItem("anum");
let notice = sessionStorage.getItem("notice");
let content_wrap = document.getElementsByClassName("content-wrap")[0];
 window.onload =function(){
	hashList();
	commList();
	if(notice == 'Y'){
		content_wrap.id = "notice_content";
	}
}
function hashList()
{
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let result = xhr.responseText;
			let data = JSON.parse(result);
			let hList = data.list;
			let hash = document.getElementById("hash");
			
			for(let htag of hList){
				let div = document.createElement("div");
				div.innerHTML = "<p>#</p>"
							  + "<p>"+htag.htag+"</p>";
				hash.appendChild(div);
			}		
		}		
	}
	xhr.open("post",context+"/board_review/hash",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	let param = "anum=" +anum;
	xhr.send(param);
}

function commList(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let result = xhr.responseText;
			let data = JSON.parse(result);
			let list = data.list;
			let commList = document.getElementById("commList");
			
			for(let comm of list){
				let random = Math.floor(Math.random() * 4 + 1);//프로필 이미지 가져오기 위한 랜더숫자(1~4)
				let comment = document.createElement("div");
				comment.className ="comm";
				let top = document.createElement("div");
				top.id = "top";
				let img = document.createElement("img");
				img.src = context + "/images/common/icon/profile/"+random+".svg";
				top.appendChild(img);
				let div = document.createElement("div");
				div.innerHTML = "<p>"+comm.nick+"</p>"
							  + "<p>"+comm.regdate+"</p>";
				top.appendChild(div);
				comment.appendChild(top);
				let comm_content = document.createElement("div");
				comm_content.className = "comm_content";
				comm_content.innerHTML = comm.content;
				comment.appendChild(comm_content);
				commList.appendChild(comment);
			}		
		}		
	}
	xhr.open("post",context+"/board_review/comm/list",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	let param = "anum=" +anum;
	xhr.send(param);
}

addComm = function(){
	let url = context +"/board_review/comm/write";
	url += "?anum="+anum;
	
	document.location.href = url;
}
edit = function(){
	let url = context +"/board_review/edit";
	url += "?anum="+anum;
	
	document.location.href = url;
}
del = function(){
	let url = context +"/board_review/delete";
	url += "?anum="+anum;
	
	document.location.href = url;
}
let recoform ={
	anum : anum,
	mnum : sessionStorage.getItem("mnum")
}

setReco = function(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = JSON.parse(data);
			let reco= document.getElementById("reco");
			reco.innerHTML= "추천수 "+ json.cnt;
			alert(json.result);
		}		
	}
	xhr.open("post",context+"/board_review/recommend",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send(JSON.stringify(recoform));
}

setNotice = function(){
	let getConfirm = "";
	if(notice == 'N'){
		getConfirm = confirm("이 글을 공지사항으로 설정하시겠어요?");
	}else{
		getConfirm = confirm("이 글을 공지사항에서 해제하시겠어요?");
	}
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let result = xhr.responseText;
			alert(result);
			//현재페이지로딩
			document.location.href= context+"/board_review/detail?anum="+anum;
		}		
	}
	xhr.open("post",context+"/board_review/notice",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    if(getConfirm){
		notice = notice=='N'?'Y':'N';
	}
    let noticeform = {
		anum :anum,
		notice : notice
	};
	xhr.send(JSON.stringify(noticeform));
	
}