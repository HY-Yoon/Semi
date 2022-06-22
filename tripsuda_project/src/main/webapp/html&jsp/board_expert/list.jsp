<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_expert/list.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>

<%
	request.setCharacterEncoding("utf-8");
	String select = request.getParameter("select");
	String search = request.getParameter("search");
	request.setAttribute("select",select);
	request.setAttribute("search",search);
%>
<script type="text/javascript">
	window.onload=function(){
		BoardList(1);
	}
	
	function BoardList(pageNum){
		let xhr=new XMLHttpRequest();
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var result=xhr.responseText;	
							
				let board_list=document.getElementById("board_list");
				let child=board_list.childNodes;
				for(let i=child.length-1;i>=0;i--){
					let c= child.item(i);
					board_list.removeChild(c);
				}
				
				let data=JSON.parse(result);
				let board=data.list;
				
		for(let i=0;i<board.length;i++) (function(i){ 
						
			let anum = board[i].anum;
			let mnum = board[i].mnum;
			let title=board[i].title;
			let content=board[i].content;
			let nick = board[i].nick;
			let views = board[i].views;
			let tag = board[i].tag; //지역태그
			let hashtag = board[i].htag;
			let regdate = board[i].regdate;
			let orgfile = board[i].orgfile;
			let serverfile = board[i].serverfile;
			let div=document.createElement("div");
			div.innerHTML= "<div class='a'><img src='${pageContext.request.contextPath}/images/board_expert/brighter.svg'><span class='tag'>"+tag+"</span></div>"
										+"<div class='b'><h3 class='title'>"+title+"</h3></div>"
										+"<div class='c'><p class='con'>"+content+"</p></div>"
										+"<div class='d'><p class='hashtag'>"+hashtag+"</p></div>"
										+"<div class='e'><span class='nick'>"+nick+"</span></div>"
										+"<div class='f'><img src='${pageContext.request.contextPath}/images/board_expert/index.svg'><span class='views'>"+views+"</span></div>";
											    
		div.className="listdiv";
		div.style = "cursor:pointer";
		div.onclick = function(){
			views++;
			location.href="${pageContext.request.contextPath}/html&jsp/board_expert/detail?anum="+anum+"&views="+views;
						
		}
				
		board_list.appendChild(div);
	})(i);
		
					let startPage = data.startPage;
					let endPage = data.endPage;
					let pageCount = data.pageCount;
					let pageHTML="";
					if(startPage>10){
						pageHTML += "<a href='javascript:BoardList("+ (startPage-1) +")'>이전</a>";
					}
					
					for(let i=startPage;i<=endPage;i++){
						if(i==pageNum){
							pageHTML +="<a href='javascript:BoardList("+ i + ")'><span style='color:blue'>["+ i +"]</span></a>";
						}else{
							pageHTML +="<a href='javascript:BoardList("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
						}
					}
					
					if(endPage<pageCount){
						pageHTML += "<a href='javascript:BoardList("+ (endPage+1) +")'>다음</a>";
					}
					var page=document.getElementById("page");
					page.innerHTML=pageHTML;
				
				
				}
			};
								
			xhr.open('post','${pageContext.request.contextPath}/html&jsp/board_expert/list',true);
			let param="pageNum="+pageNum +"&select=${select}&search=${search}"
			xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			xhr.send(param);
					
		}
	
</script>
<body>
<header>
 	<jsp:include page="../default/default_header.jsp"/>
</header>
 
<main> 
<div class="content">
<div id="board_list">

</div>
<div id="page">
</div>

</div>
</main>

<footer>
	<jsp:include page="../default/default_footer.jsp"/>
</footer>

</body>
</html>