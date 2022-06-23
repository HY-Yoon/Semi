<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_expert/detail.css?12">
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
				
				div.innerHTML="<div class='nickreg'><span class='nic'>"+nick+"</span><br><span class='reg'>"+regdate+"</span></div>"
											+"<div class='c'>"+content+"</div>";
				              
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
	
	function report() {
		var url = "${pageContext.request.contextPath}/html&jsp/board_expert/reportPopup.jsp?mnum=${mnum}";

		var nWidth = 600;
		var nHeight = 450;
		
		var curX = window.screenLeft;
		var curY = window.screenTop;
		var curWidth = document.body.clientWidth;
		var curHeight = document.body.clientHeight;
		  
		var nLeft = curX + (curWidth / 2) - (nWidth / 2);
		var nTop = curY + (curHeight / 2) - (nHeight / 2);
				
		 var status = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no"
		 							+",top="+nTop+",left="+nLeft+",width=600, height=450"; 
		window.open(url,"신고하기" ,status);
	}


</script>
<body>
<div id="header">
 	<jsp:include page="../default/default_header.jsp"/>
</div>

<div id ="main">

<div id="main_detail">
<div class="tit"><h1> ${title }</h1></div>
<div class="tag">지역 ${tag }</div>
<div class="cont">${content }</div>
<div class="hash">${hashtag }</div>
${mnum }

<div class="filedownload">
첨부파일 
<a href="${pageContext.request.contextPath}/board_expert/download?orgfile=${orgfile}&serverfile=${serverfile}">${serverfile}</a><br>
</div>



<div class="else">
<span>${regdate }</span>
<span>조회수 ${views }</span>
<input type="button" id="report" value="신고하기" onclick="report()">
<button type="button" onclick="addReco()"><img alt="추천" src="../../images/board_expert/reco.png"></button>
</div>



<!-- 게시글 회원번호랑 로그인한 회원번호가 일치했을때 삭제 -->
<c:if test="">
</c:if>

<input type="button" id="del" value="게시글삭제" onclick="del()">
</div>
<hr>
<div id="commList">

</div>

<div id="commAdd">
	<input type="text" id="nick" value="nick2" readonly="readonly"><br> <!-- value에 로그인한 member nick 받아오기(회원번호필요) -->
	<textarea rows="3" cols="50" id="comments"></textarea><br>
	<div class="btn1">
	<input type="button" id="sub" value="댓글등록" onclick="addComm()">
	</div>
</div>

</div>

<div id="footer">
	<jsp:include page="../default/default_footer.jsp"/>
</div>

</body>
</html>