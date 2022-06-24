/**
 * 관리자 페이지 회원정보 자세히보기 페이지 JS
 */
cancle = function(){
	//이전페이지로 이동
	window.history.back();
}

let cont = {
	mnum : document.getElementById("mnum"),
	stop : document.getElementById("stop"),
	withdraw : document.getElementById("withdraw")
};
let form ={
	mnum : "",
	stop : "",
	withdraw : ""
};
sendForm = function(){
	form.mnum = cont.mnum.value;
	if(cont.stop.value !== ""){
		form.stop = cont.stop.value;
	}
	form.withdraw = cont.withdraw.value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status){
			let result = xhr.responseText;
			alert(result);
			document.location.href = document.referrer;
		}
	}
	console.log(form);
	xhr.open("post", sessionStorage.getItem("context") + "/admin/member/edit",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send(JSON.stringify(form));
}