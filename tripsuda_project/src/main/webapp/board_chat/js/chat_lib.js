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
	this._chatlist = document.getElementsByClassName("chatlist")[0];
	this._roomdata = null;
	
	// 매 초 업데이트 실행
	this._updateHandler = setInterval(this.update, 1000);
}

// 업데이트
ChatManager.update = function()
{
	if (this._roomdata != null)
	{
		this.connectRoom(_roomdata.rnum);
	}
}

// 방에 연결
ChatManager.connectRoom = function(rnum)
{
	// console.log("connect - " + rnum);
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function()
	{
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			let result = xhr.responseText;
			ChatManager.updateChatList(JSON.parse(result));
		}
	};
	let url = sessionStorage.getItem("contextPath") + "/board_chat/room?rnum=" + rnum;
	// console.log("url - " + url);
	xhr.open("get", url, true);
	xhr.send();
}

// 채팅 보내기
ChatManager.sendChat = function()
{
	let obj = {rnum : document.getElementById("rnum").value,
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

// 채팅 리스트 갱신
ChatManager.updateChatList = function(roomdata)
{
	this._roomdata = roomdata;
	document.getElementById("rnum").value = this._roomdata.rnum;
	document.getElementById("channel_title").innerText = this._roomdata.title;
	let msg = "";
	for(let chat_element of this._roomdata.list)
	{
		msg += `${chat_element.date} : ${chat_element.sender} - ${chat_element.msg}\r\n`;
	}
	this._chatlist.innerText = msg;
}