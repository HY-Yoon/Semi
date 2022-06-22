/**
 * 김주현
 * ajax로 통신하는 채팅 json 라이브러리
 */

window.addEventListener('load', function()
{
	console.log("chat library loaded!");
	ChatManager.initialize();
});

//---------------
// ChatManager
//
// 채팅 매니저!
function ChatManager()
{
	throw new Error("이건 정적 클래스라 불러올 수 없어요.");
};

// 초기화
ChatManager.initialize = function()
{
	console.log("chat manager initialized!");
	
	// 변수 잡기
	this._chatlist = document.getElementById("chatlist");
	this._roomdata = null;
	
	// 매 초 업데이트 실행
	this._updateHandler = setInterval(this.update, 1000);
}

// 업데이트
ChatManager.update = function()
{
	if (this._roomdata != null)
	{
		this.connectRoom(_roomdata.anum, false);
	}
}

// 방에 연결
ChatManager.connectRoom = function(anum, withImg)
{
	// console.log("connect - " + anum);
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
			ChatManager.updateChatList(JSON.parse(result));
		}
	};
	let url = sessionStorage.getItem("contextPath") + "/board_chat/room?anum=" + anum + (withImg ? "&getImg=true" : "");
	xhr.open("get", url, true);
	xhr.send();
}
// 방에서 나가기
ChatManager.leaveRoom = function(anum)
{
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
			let ele = document.getElementById("room-ele-" + anum);
			ele.remove();
		}
	};
	let url = sessionStorage.getItem("contextPath") + "/board_party/leave?anum=" + anum;
	xhr.open("get", url, true);
	xhr.send();
}

// 채팅 보내기
ChatManager.sendChat = function()
{
	let obj = {anum : document.getElementById("anum").value,
				msg : document.getElementById("msg").value};
	
	// console.log("chat send - " + JSON.stringify(obj));
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText; 
			ChatManager.updateChatList(JSON.parse(result));
		} 
	};
	let url = sessionStorage.getItem("contextPath")
		 + "/board_chat/room";
	// console.log("url - " + url);
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(obj));
}

// 채팅 리스트 깨끗하게 비우기
ChatManager.clearList = function()
{
	while (this._chatlist.children.length > 0)
	{
		this._chatlist.children[0].remove();
	}
}
// 채팅 리스트 내에 해당 cnum을 가진 요소가 있나 확인
ChatManager.search = function(cnum)
{
	for (let obj of document.getElementsByClassName("msg-num"))
	{
		if (parseInt(obj.innerText) == parseInt(cnum))
			return true;
	}
	return false;
}

// 채팅 리스트 갱신
ChatManager.updateChatList = function(roomdata)
{
	this._roomdata = roomdata;
	if (this._roomdata.img != null)
	{
		this.clearList();
		this._chatlist.style = "background-image: url('" + this._roomdata.img + "');";
	}

	document.getElementById("anum").value = this._roomdata.anum;
	document.getElementById("channel_title").innerHTML = "<h3>" + this._roomdata.title + "</h3>";
	let leave_btn = document.getElementById("leave_button");
	console.log(parseInt(this._roomdata.mnum) + " // " + parseInt(sessionStorage.getItem("userNum")))
	if (parseInt(this._roomdata.mnum) == parseInt(sessionStorage.getItem("userNum")))
	{
		leave_btn.setAttribute("type", "hidden");
	}
	else
	{
		leave_btn.setAttribute("type", "button");
		leave_btn.onclick = () => {
			this.leaveRoom(this._roomdata.anum);
		};
	}
	document.getElementById("channel_link").href = sessionStorage.getItem("contextPath") + "/html&jsp/board_party/detail?anum=" + this._roomdata.anum;
	console.log(this._roomdata);
	let mNum = parseInt(sessionStorage.getItem("userNum"));
	for (let i = 0; i < this._roomdata.list.length; i++)
	{
		let chat_element = this._roomdata.list[i];
		if (this.search(chat_element.cnum))
			continue;

		console.log("i = " + i + ", cnum = " + chat_element.cnum);

		// 엘리먼트
		let msg = {
			cnum : document.createElement("div"),
			parent : document.createElement("div"),
			ele : document.createElement("div"),
			ele_flex :  document.createElement("div"),
			info :  document.createElement("div")
		};

		// 서로 붙이기
		msg.parent.appendChild(msg.cnum);
		msg.parent.appendChild(msg.ele);
		msg.ele.appendChild(msg.ele_flex);
		msg.parent.appendChild(msg.info);

		// 클래스 설정
		msg.cnum.style = "display: none;";
		msg.cnum.className = "msg-num";
		msg.parent.className = "msg-parent";
		let msgtype = (chat_element.sender == -1 ? "msg-sys" : (chat_element.sender == mNum ? "msg-mine" : "msg-user"));
		msg.ele.className = "msg-ele " + msgtype;
		msg.ele_flex.className = "msg-flex";
		msg.info.className = "msg-info";

		// 내용물 설정
		msg.cnum.innerText = chat_element.cnum;
		msg.ele_flex.innerText = chat_element.msg;
		msg.info.innerText = chat_element.date;

		// 붙이기
		this._chatlist.appendChild(msg.parent);
	}
}