<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/point/point.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">


</head>
<script type="text/javascript">
window.onload = function(){
	recoList(1);
}

function recoList(pageNum){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState ==4 && xhr.status==200){
			let result = xhr.responseText;
			let data = JSON.parse(result);
			let list = data.list;
			let sum = document.getElementById("sp");
			sum.innerHTML = data.sum+" point";
			let table = document.getElementById("Plist");
			let html = "<table>"
			    html += "<tr> <th>번호</th> <th>내용</th> <th>포인트</th> </tr>"
			for(let i=0;i<list.length;i++){
				let pnum = list[i].pnum;
				let mnum = list[i].mnum;
				let point = list[i].point;
				let pdate = list[i].pdate;
				let content = list[i].content;
				 
				html += "<tr><td>"+pnum+"</td><td>"+content+"<br><span>"+pdate+"</span></td><td>"+point+"point</td></tr>";
			
			}
				table.innerHTML = html+ "</table>" ;
				
				let startPage = data.startPage;       //1
				let endPage = data.endPage;          //4
				let pageCount = data.pageCount;      //4
				let pageHTML="";
								
				//pageNum = 1
				
				if(startPage>5){
					pageHTML += "<a href='javascript:recoList("+ (startPage-1) +")'>이전</a>";
				}
				
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHTML +="<a href='javascript:recoList("+ i + ")'><span style='color:#0b81ff'>["+ i +"]</span></a>";
					}else{
						pageHTML +="<a href='javascript:recoList("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
					}
				}
		
				if(endPage<pageCount){
					pageHTML += "<a href='javascript:recoList("+ (endPage+1) +")'>다음</a>";
				}
				
				var page=document.getElementById("page");
				page.innerHTML = pageHTML ;
		}
	};
	
	xhr.open('get','${pageContext.request.contextPath}/point/pointlist?mnum=${sessionScope.sessionMnum}&pageNum='+pageNum,true);
	
	//로그인한 mnum 전송
	xhr.send();
}
</script>
<header>
	 	<jsp:include page="../default/mypage_header.jsp"/>
</header>

<body>
<main class ="wrap">
	<div class="layout">

		<aside>
			<div class="side">
			<div class="profile">
				<div class="img"></div>
				<p>로그인한 아이디</p>
			</div>
			<div class="mypage">
				<ul>
					<li class="list"><a href="${pageContext.request.contextPath}/memberModifyForm"><span class="txt">회원정보수정</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/html&jsp/Point/point.jsp"><span class="txt">포인트</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/mypage/review"><span class="txt">여행후기</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/mypage/free"><span class="txt">자유게시판</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/mypage/party"><span class="txt">내동행 게시글</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/mypage/qna"><span class="txt">QnA</span></a></li>
					<li class="list"><a href="${pageContext.request.contextPath}/mypage/exeprt"><span class="txt">전문가게시글</span></a></li>
					<li class="list"><a href="#"><span class="txt">내코멘트</span></a></li>
				</ul>
			</div>
			</div>
			</aside>

		<div class="content">
		
			<div class="main_content"> 
				<div class="main_top"> <!--적립내역 맨위 div-->
					<h2>적립내역</h2>
				</div>

			<div class="main_mid"> <!-- 중간 div-->
			<span>현재 보유포인트</span>
			<span class="sp" id="sp"></span>
			
			</div>
			<hr>
			
			<div class="main_table"> <!--list table-->

				<div id="Plist">

				</div>
		
			</div>

<div class="main_paging">

	<div id="page">

	</div>
	
</div>

</div>
		
		
		
		</div>



	
	</div>
</main>

<footer>
		<jsp:include page="../default/default_footer.jsp"/>
</footer>



</body>
</html>