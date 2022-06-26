<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board_qa/list_qa.css">

<script type="text/javascript">
	window.onload=function(){
		boardList(1);
	}
	function boardList(pageNum){
		let selec=document.getElementById("sortselect").value;
		var xhr=new XMLHttpRequest(); //자바스크립트 내장 객체 얻어오기
		xhr.onreadystatechange=function(){
/* 			if(xhr.readyState==3 && xhr.status==200){
				let qaList=document.getElementById("qaList");
				let box=document.createElement("div");
					box.className="listbox"
					box.innerHTML="<p>게시판 로딩 중입니다. 잠시만 기다려주세요.</p>"
				qaList.appendChild(box);
			} */
			if(xhr.readyState==4 && xhr.status==200){ //응답하고 응답 성공했을 때 명령 처리하기
				let qaList=document.getElementById("qaList");
				let jdata=xhr.responseText; //text-plain 타입으로 얻어오기
				let data=JSON.parse(jdata);
				let list=data.list;
				// 새 페이지 얻어왔을 때 기존에 얻어왔던 객체들 다 지우기
				let divchild=qaList.childNodes;
				for(let i=divchild.length-1;i>=0;i--){
					let k=divchild.item(i);
					qaList.removeChild(k);
				}
				//게시글 다시 새로 얻어오기
				for(let i=0;i<list.length;i++){
					let anum=list[i].anum;
					let hashlist=list[i].hash;
					let listbox=document.createElement("div");
						listbox.className="listbox";
						let boxtop=document.createElement("div");
							boxtop.className="boxtop";
							let keyword=document.createElement("div");
								keyword.className="condition";
								keyword.innerHTML=list[i].keyword;
							boxtop.appendChild(keyword);
							let local=document.createElement("div");
								local.className="local";
								local.innerHTML="<img src='${pageContext.request.contextPath}/images/common/icon/gps.svg'><p>"
												+list[i].loc+"</p>";
							boxtop.appendChild(local);
						listbox.appendChild(boxtop);
						let boxtitle=document.createElement("p");
							boxtitle.className="boxtitle";
							boxtitle.innerHTML=list[i].title;
							listbox.appendChild(boxtitle);
						let boxcontent=document.createElement("p");
							boxcontent.className="boxcontent";
							boxcontent.innerHTML=list[i].content;
							listbox.appendChild(boxcontent);
						let hasht="";
						let boxhash=document.createElement("ul");
							for(let j=0;j<hashlist.length;j++){
								hasht+="<li>"+hashlist[j]+"</li>";
								console.log(hashlist[j]);
							}
							boxhash.innerHTML=hasht;
							listbox.appendChild(boxhash);
						let boxnick=document.createElement("div");
							boxnick.className="boxnick";
							boxnick.innerHTML=list[i].nick;
							listbox.appendChild(boxnick);
						let boxview=document.createElement("div");
							boxview.className="boxview";
							boxview.innerHTML="<img src='${pageContext.request.contextPath}/images/common/icon/view.svg'><p>"
												+list[i].views+"</p>";
							listbox.appendChild(boxview);
						let boxcommcnt=document.createElement("div");
							boxcommcnt.className="boxcommcnt";
							boxcommcnt.innerHTML="<img src='${pageContext.request.contextPath}/images/common/icon/comm.svg'><p>"
												+list[i].commcnt+"</p>";
							listbox.appendChild(boxcommcnt);
						listbox.onclick = function(){
						location.href="${pageContext.request.contextPath}/html&jsp/board_qa/content?anum="+anum;}
						qaList.appendChild(listbox);
				}
				let startPage=data.startPage;
				let endPage=data.endPage;
				let pageCount=data.pageCount;
				let pageNum=data.pageNum;
				let pageInner="";
				if(startPage>6){
					pageInner+="<a href='javascript:boardList("+(startPage-1)+")'>이전페이지</a>";
				}
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageInner+="<a href='javascript:boardList("+i+")'>["+i+"]</a>";
					}else{
						pageInner+="<a href='javascript:boardList("+i+")'><span style='color:gray'>["+i+"]</span></a>";
					}
				}
				if(endPage<pageCount){
					pageInner+="<a href='javascript:boardList("+(endPage+1)+")'>다음페이지</a>";
				}
				let qaListPage=document.getElementById("qaListPage");
				qaListPage.innerHTML=pageInner;
			}
		}
		let param="pageNum="+pageNum+"&sortselect="+selec;
		xhr.open('post','${pageContext.request.contextPath}/html&jsp/board_qa/list',true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send(param);
	}

</script>
</head>
<body>
<div class="main">
<div class="qa_orderby">
	<span>정렬</span>
	<select id="sortselect" name="sortselect" onchange="boardList(1)">
		<option value="1">등록순</option>
		<option value="2">댓글순</option>
	</select>
	<input type="button" value="답변을 기다리는 질문만 보기" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa//html&jsp/board_qa/list?pageNum=1&sortselect=3'">
</div>
<div id="qaList" class="qalist"></div>
<div id="qaListPage" class="qaListPage"></div>
</div>
</body>
</html>