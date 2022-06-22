/**
 * 여행후기게시판 detail.js
 */
let context = sessionStorage.getItem("contextPath");
let anum = sessionStorage.getItem("anum");
 window.onload =function(){
	hashList();
	commList();
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