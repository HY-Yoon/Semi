/**
 * 김주현
 * ajax로 통신하는 채팅 json 라이브러리 (상담용)
 */

window.addEventListener('load', function()
{
	console.log("admin chat library loaded!");
	AdminChatManager.initialize();
});

//---------------
// ChatManager
//
// 채팅 매니저!
function AdminChatManager()
{
	throw new Error("이건 정적 클래스라 불러올 수 없어요.");
};

// 초기화
AdminChatManager.initialize = function()
{
	console.log("admin chat manager initialized!");
	
	// 변수 잡기
	this._userlist = document.getElementById("adminchat_userlist"); // 채팅 리스트
	this._chatlist = document.getElementById("adminchat_chatlist"); // 채팅 리스트
	this._chatdata = null; // 채팅 데이터 json
	this._userlistdata = null; // 유저리스트 데이터 json
	
	// 매 초 업데이트 실행
	this._updateHandler = setInterval(this.update, 1000);
}

// 업데이트
AdminChatManager.update = function()
{
	if (this._chatdata != null)
	{
		this.connectChat();
	}
}

AdminChatManager.toggleChat = function(activate)
{
	if (activate)
		this.connectChat();
	document.getElementById("adminchat_btn").style = activate ? "display: none;" : "";
	document.getElementById("adminchat_box").style = activate ? "" : "display: none;";
}

// 채팅 보내기
AdminChatManager.sendChat = function(event)
{
	if (event.keyCode != 13)
		return;
	console.log("send start");

	let obj = {msg : document.getElementById("adminchat_msg").value};
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText; 
			AdminChatManager.updateChatList(JSON.parse(result));
		} 
	};
	let url = sessionStorage.getItem("contextPath")
		 + "/adminchat/chat";
	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8;");
	xhr.send(JSON.stringify(obj));

	document.getElementById("msg").value = "";
}

// 관리자용 -> 유저 리스트 취득
AdminChatManager.getUserList = function()
{
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
			AdminChatManager.updateChatList(JSON.parse(result));
		}
	};
	let url = sessionStorage.getItem("contextPath") + "/adminchat/manage";
	xhr.open("get", url, true);
	xhr.send();
}
// 채팅에 연결
AdminChatManager.connectChat = function()
{
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
			AdminChatManager.updateChatList(JSON.parse(result));
		}
	};
	let url = sessionStorage.getItem("contextPath") + "/adminchat/chat";
	xhr.open("get", url, true);
	xhr.send();
}

// 채팅 리스트 깨끗하게 비우기
AdminChatManager.clearList = function()
{
	while (this._chatlist.children.length > 0)
	{
		this._chatlist.children[0].remove();
	}
}
// 채팅 리스트 내에 해당 cnum을 가진 요소가 있나 확인
AdminChatManager.search = function(cnum)
{
	for (let obj of document.getElementsByClassName("msg-num"))
	{
		if (parseInt(obj.innerText) == parseInt(cnum))
			return true;
	}
	return false;
}

// 유저 리스트 갱신
AdminChatManager.updateUserList = function(userlistdata)
{
	this._userlistdata = userlistdata;

	let mNum = parseInt(sessionStorage.getItem("userNum"));
	for (let i = 0; i < this._chatdata.list.length; i++)
	{
		let chat_element = this._chatdata.list[i];
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
		let msgtype = (chat_element.sender == mNum ? "msg-mine" : (chat_element.reader == mNum ? "msg-user" : "msg-sys"));
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
// 채팅 리스트 갱신
AdminChatManager.updateChatList = function(chatdata)
{
	this._chatdata = chatdata;
	if (this._chatdata.img != null)
	{
		this.clearList();
		this._chatlist.style = "background-image: url('" + this._chatdata.img + "');";
	}

	let mNum = parseInt(sessionStorage.getItem("userNum"));
	for (let i = 0; i < this._chatdata.list.length; i++)
	{
		let chat_element = this._chatdata.list[i];
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
		let msgtype = (chat_element.sender == mNum ? "msg-mine" : (chat_element.reader == mNum ? "msg-user" : "msg-sys"));
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