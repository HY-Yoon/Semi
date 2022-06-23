<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 글쓰기</title>
<style type="text/css">
		#t{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
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

	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/FBoardWrite" name="WriteForm" 
	     enctype="multipart/form-data"  onsubmit="return checkValue()">
	<input type="hidden" name="id" value="${sessionScope.sessionID}">
	<input type="hidden" name="nick" value="${sessionScope.sessionNick}">


	<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td id="t">ID</td>
			<td>${sessionScope.sessionID}</td>
		</tr>
		<tr>
			<td id="t">작성자</td>
			<td>${sessionScope.sessionNick}</td>
		</tr>

			<tr>
			<td id="t">
				제 목
			</td>
			<td>
				<input name="title" type="text" size="70" maxlength="100" value=""/>
			</td>		
		</tr>
		<tr>
			<td id="t">
				내 용
			</td>
			<td>
				<textarea name="content" cols="72" rows="20"></textarea>			
			</td>		
		</tr>
		<tr>
			<td id="t">
				파일첨부
			</td>
			<td>
				<input type="file" name="file1" />
			</td>	
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="reset" value="작성취소" >
				<input type="submit" value="등록" >
				<input type="button" value="목록"  onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_Free/list.jsp'">			
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>