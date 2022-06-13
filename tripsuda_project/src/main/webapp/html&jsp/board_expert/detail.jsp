<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.comm{width:400px;height: 100px;border:1px solid #aaa;margin-bottom: 5px;}
	#main_detail{width: 1000px;height: 500px;border: 1px solid black;}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
</head>


<script type="text/javascript">
window.onload=function(){
	commList();
	views();
}

function commList(){
	let xhr=new XMLHttpRequest();
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			var result=xhr.responseText;	
			let commList=document.getElementById("commList");
			let child=commList.childNodes;
			for(let i=child.length-1;i>=0;i--){
				let c=child.item(i);
				commList.removeChild(c);
			}
			
			let data=JSON.parse(result);
			let comm=data.list;
			
			for(let i=0;i<comm.length;i++){
				let nick = comm[i].nick;
				let mnum=comm[i].mnum;
				let content=comm[i].content;
				let regdate=comm[i].regdate;
				
				let div=document.createElement("div");
				
				div.innerHTML= nick+ "<br>" +
							   regdate+"<br>"+
				               content +"<br>"
				              
				div.className="comm";
				commList.appendChild(div);
			}
			}
	};
	xhr.open('get','${pageContext.request.contextPath}/board_expert/comlist?anum=${anum}',true);
	xhr.send();
}

//-----------comm_expert 댓글등록-------------
function addComm(){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			
			let data=xhr.responseText;
			let json=JSON.parse(data);
			
			if(json.code=='success'){
					commList();
			}else{
				alert('댓글등록실패!');
			}
		}
	};
	let nick=document.getElementById("nick").value;
	let comments=document.getElementById("comments").value;
	
	let param="nick="+nick +"&comments=" + comments+"&anum=${anum}";
	xhr.open('post','${pageContext.request.contextPath}/board_expert/addcom',true);
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send(param);	
}

//---------------추천하기------------------------
	function addReco(){
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				
				let data=xhr.responseText;
				let json=JSON.parse(data);
				
				if(json.result=='success'){
					alert('추천완료');	
				}else{
					alert('추천실패');
				}
			}
		};
		xhr.open('get','${pageContext.request.contextPath}/board_expert/addReco?anum=${anum }',true);
										// &mnum누가 추천했는지(로그인된 회원번호 parm으로 보내야함)
		xhr.send();
}

	
//-------------조회수-------------
	function views() {
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
			}
		};
		xhr.open('get','${pageContext.request.contextPath}/board_expert/views?views=${views }&anum=${anum}',true);
		xhr.send();
	}
	
	//--------게시글삭제-----------
	function del() {
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				
				if(json.result=='success'){
					alert('삭제되었습니다');
					location.href="${pageContext.request.contextPath}/html&jsp/board_expert/list.jsp";
					
				}else{
					alert('삭제실패');
				}
				}
		};
		xhr.open('get','${pageContext.request.contextPath}/board_expert/del?anum=${anum }',true);
		xhr.send();
	
	}

</script>
<body>
<div id="header">
 	<jsp:include page="../default/default_header.jsp"/>
</div>

<div id ="main">
<div id="main_detail">
<h1>제목 ${title }</h1>
지역태그 : ${tag }<br>
내용 : ${content }<br>
해시태그 : ${hashtag }<br>
작성일 : ${regdate }<br>
조회수 : ${views }<br>
게시글번호:${anum }<br>
회원번호: ${mnum }<br>

첨부파일
<a href="${pageContext.request.contextPath}/board_expert/download?orgfile=${orgfile}&serverfile=${serverfile}">${serverfile}</a><br>
<a href="">신고하기</a><br>
<input type="button" value="추천하기" onclick="addReco()">

<!-- 게시글 회원번호랑 로그인한 회원번호가 일치했을때 삭제 -->
<c:if test="">
</c:if>

<input type="button" value="게시글삭제" onclick="del()">



</div>

<div id="commList">
</div>

<div id="commAdd">
	<input type="text" id="nick" value="nick2" readonly="readonly"><br> <!-- value에 로그인한 member nick 받아오기(회원번호필요) -->
	<textarea rows="3" cols="50" id="comments"></textarea><br>
	<input type="button" value="등록" onclick="addComm()">
</div>


</div>

<div id="footer">
	<jsp:include page="../default/default_footer.jsp"/>
</div>

</body>
</html>