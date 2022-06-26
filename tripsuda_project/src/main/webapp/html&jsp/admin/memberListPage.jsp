<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIPSUDA-관리자페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/list.css">
</head>
<body>
	<header>
        <jsp:include page="/html&jsp/default/mypage_header.jsp"/>
    </header>
    <main>
    	<div class="container">
    		<section class="menu_section">
    			<jsp:include page="/html&jsp/admin/menu.jsp"/>
    		</section>
    		<section class="content_section">
    			<%
					request.setCharacterEncoding("utf-8");
					String select = request.getParameter("select");
					String search = request.getParameter("search");
					request.setAttribute("select",select);
					request.setAttribute("search",search);
				%>
				<script type="text/javascript">
				window.onload=function(){
					memberList(1);
					}
				
				function memberList(pageNum){
					let xhr=new XMLHttpRequest();
					xhr.onreadystatechange = function(){
						
						if(xhr.readyState==4 && xhr.status==200){
							let result=xhr.responseText;	
						
							let list=document.getElementById("list");
							let child=list.childNodes;
								for(let i=child.length-1;i>=0;i--){
										let c=child.item(i);
										list.removeChild(c);
									}
								
							let data=JSON.parse(result);
							let json=data.list;
						
							let html = "";
							
								for(let i=0;i<json.length;i++){
										let mnum = json[i].mnum;				
										let name = json[i].name;
										let id = json[i].id;
										let nick = json[i].nick;
										let grade = json[i].grade;
													
										html += "<tr class='tr' onclick='javascript:goDetail("+mnum+")'><td class='name'>"+name+"</td><td class='id'>"
									  	+id+"</td><td class='nick'>"+nick+"</td><td class='grade'>"+grade+"</td> </tr>"
									
								}
							 	list.innerHTML = html;
							 	
								let startPage = data.startPage;       
								let endPage = data.endPage;          
								let pageCount = data.pageCount;      
								let pageHTML="";
							 	
							 	
							 	if(startPage>5){
									pageHTML += "<a href='javascript:memberList("+ (startPage-1) +")'>이전</a>";
								}
								
								for(let i=startPage; i<=endPage; i++){
									if(i == pageNum){
										pageHTML +="<a href='javascript:memberList("+ i + ")'><span style='color:#0b81ff'>["+ i +"]</span></a>";
									}else{
										pageHTML +="<a href='javascript:memberList("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
									}
								}
						
								if(endPage < pageCount){
									pageHTML += "<a href='javascript:memberList("+ (endPage+1) +")'>다음</a>";
								}
								
								var page=document.getElementById("page");
								page.innerHTML = pageHTML ;
						}			 	
					};
					
					xhr.open('post','${pageContext.request.contextPath}/admin/list',true);
					let param="pageNum="+pageNum +"&withdraw=N&select=${select}&search=${search}&w=0";
					xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
					xhr.send(param);
				}
				
				//회원 상세보기 경로 설정하시면됩니다. 
				function goDetail(mnum) {
					location.href="${pageContext.request.contextPath}/admin/member/detail?mnum="+mnum;
				}	  
				
				</script>
				<h1 class="tit"><span>일반회원관리</span></h1>
					<div class="wrap">
						<div class="w_search">
								<form action="${pageContext.request.contextPath}/admin/member/list">
									<select name="select" class="select">
										<option value="name">이름</option>
										<option value="id">아이디</option>
										<option value="nick">닉네임</option>
										<option value="grade">등급</option>
									</select>
									<input type="text" name="search" id="search">
									<input type="hidden" name="w" value="0">
									<button type="submit" class="sub_btn"></button>
								</form>
							</div>
							
							<table>
								<thead>
									<tr> 
										<th>이름</th> 
										<th>아이디</th> 
										<th>닉네임</th> 
										<th>등급</th>
									</tr>
								</thead>
								<tbody id="list"></tbody>
							</table>
							<div id="page"></div>
					</div>
    		</section>
    	</div>
    </main>
    <footer>
        <jsp:include page="/html&jsp/default/default_footer.jsp"/>
    </footer>
</body>
</html>