<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">

<style type="text/css">

	.wrap{
		width: 1200px;
		margin: 0 auto;
	}
	.write{
	margin: 10px auto;
	text-align: center;
	}
	.wirteform{
	margin: 10px auto;
	
	}
	
	.s{
		margin-left: 30px;
	
	}
	
	.title, .cont{
	width: 900px;
	border: 1px solid black;
	margin-left: 30px;
	padding: 0px;
	box-sizing: border-box;
	}
	.title{
	padding-left:5px;
	height:20px; 
	border-radius: 3px;
	
	}
	
	.cont{
	padding: 4px;
	}
	
	.btn input{
		width: 270px;
		height: 30px;
		background-color: #0b81ff;
		color: white;
		border: none;
		margin-top: 30px;
		
	}
	
	.file{
	margin-top: 10px;
	margin-left: 30px;
	
	}
	
	
	
		.t{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
			width: 100px;
			
		}
	</style>
	
	<script type="text/javascript">
	   function checkValue(){
			var form = document.forms[0];
			var title = form.title.value;
			var content = form.content.value;
			
			if(!title){
				alert("제목을 입력해주세요.")
				return false;
			}
			else if(!content){
				alert("내용을 입력해주세요.")
				return false;
			}
			
			else if(confirm("작성하신 글을 등록하시겠습니까?")) {
				return true;
			}
			return false;
		}
	
	</script>
	
</head>
<body>
<header>
 	<jsp:include page="../default/default_header.jsp"/>
</header>

<main>
	<div class="wrap">
	<div class="write">
		<b><font size="6" color="gray">글쓰기</font></b>
	</div>
	
	<div class="wirteform">
		<form method="post" action="${pageContext.request.contextPath}/FBoardWrite" name="WriteForm" 
		     enctype="multipart/form-data"  onsubmit="return checkValue()">
		<input type="hidden" name="id" value="${sessionScope.sessionID}">
		<input type="hidden" name="nick" value="${sessionScope.sessionNick}">
		

	<table width="1200" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td class="t">ID</td>
			<td><span class="s">${sessionScope.sessionID}</span></td>
		</tr>
		<tr>
			<td class="t">작성자</td>
			<td><span class="s">${sessionScope.sessionNick}</span></td>
		</tr>

			<tr>
			<td class="t">
				제 목
			</td>
			<td>
				<input class="title" name="title" type="text" size="70" maxlength="100" value="" placeholder="제목을 입력해주세요"/>
			</td>		
		</tr>
		<tr>
			<td class="t">
				내 용
			</td>
			<td>
				<textarea class="cont" name="content" cols="72" rows="20" placeholder="내용을 입력해주세요"></textarea>			
			</td>		
		</tr>
		<tr>
			<td class="t">
				파일첨부
			</td>
			
			<td>
			<div class="file">
				<input type="file" name="file1" />
				</div>
			</td>	
			
		</tr>
				
		<tr align="center" valign="middle" class="btn">
		
			<td colspan="5">
			
				<input type="reset" value="작성취소" >
				<input type="submit" value="등록" >
				<input type="button" value="목록"  onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_Free/list.jsp'">			
			</td>
		</tr>
		
	</table>	
	</form>
			</div>
	</div>
</main>	
	
	<div id="footer">
		<jsp:include page="../default/default_footer.jsp"/>
	</div>
	<script src="${pageContext.request.contextPath}/js/board_free/default.js"></script>
</body>


</html>