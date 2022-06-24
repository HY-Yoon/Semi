<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/list.css?123">
</head>
<body>
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
		
			let list=document.getElementById("Nlist");
			let child=list.childNodes;
				for(let i=child.length-1;i>=0;i--){
						let c=child.item(i);
						list.removeChild(c);
					}
				
			let data=JSON.parse(result);
			let json=data.list;
		
			let html = "<table>"
			    html += "<tr> <th>회원번호</th> <th>이름</th> <th>아이디</th> <th>닉네임</th> <th>등급</th><th>탈퇴여부</th> </tr>"
			
				for(let i=0;i<json.length;i++){
						let mnum = json[i].mnum;				
						let name = json[i].name;
						let id = json[i].id;
						let nick = json[i].nick;
						let grade = json[i].grade;
						let withdraw = json[i].withdraw;
									
						html += "<tr class='tr' onclick='javascript:goDetail("+mnum+")'> <td class='mnum'>"+mnum+"</td><td class='name'>"+name+"</td><td class='id'>"
					  	+id+"</td><td class='nick'>"+nick+"</td><td class='grade'>"+grade+"</td><td class='w'>"+withdraw+"</td> </tr>"
					
				}
			 	list.innerHTML = html+ "</table>"
			 	
				let startPage = data.startPage;       
				let endPage = data.endPage;          
				let pageCount = data.pageCount;      
				let pageHTML="";
			 	
			 	
			 	if(startPage>5){
					pageHTML += "<a href='javascript:memberList("+ (startPage-1) +")'>이전</a>";
				}
				
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHTML +="<a href='javascript:memberList("+ i + ")'><span style='color:#0b81ff'>["+ i +"]</span></a>";
					}else{
						pageHTML +="<a href='javascript:memberList("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
					}
				}
		
				if(endPage<pageCount){
					pageHTML += "<a href='javascript:memberList("+ (endPage+1) +")'>다음</a>";
				}
				
				var page=document.getElementById("page");
				page.innerHTML = pageHTML ;
			 	
			 	
			 	
		}			 	
	};
	
	xhr.open('post','${pageContext.request.contextPath}/admin/list',true);
	let param="pageNum="+pageNum +"&withdraw=N&select=${select}&search=${search}";
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send(param);
			
	
}

//회원 상세보기 경로 설정하시면됩니다. 
function goDetail(mnum) {
	location.href="${pageContext.request.contextPath}/test.jsp?mnum="+mnum;
	}	  

</script>


<main>
	<div class="wrap">

	
	<div class="memberlist">
		<div id="Nlist">
		
		</div>
		

		
		</div>
		
	<div id="page">
	
	</div>
	
		<div class="w_search">
			<form action="${pageContext.request.contextPath}/html&jsp/admin/list.jsp">
				<select name="select">
					<option value="name">이름</option>
					<option value="id">아이디</option>
					<option value="nick">닉네임</option>
					<option value="grade">등급</option>
				</select>
				<input type="text" name="search" id="search">
				<button type="submit"></button>
				</form>
			</div>
		
	</div>
</main>

</body>
</html>