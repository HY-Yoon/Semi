<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<style type="text/css">
		#title{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
	function changView() {
		if(confirm("목록으로 돌아가시겠습니까?")) {
			location.href = "location.href='${pageContext.request.contextPath}/freelist'" ;
		}
		return false;
	}
	
	</script>
</head>
<body>
<br>
	<b><font size="6" color="gray">글 수정</font></b>
	<br>
	
	<form method="post" action="${pageContext.request.contextPath}/FBoardUpdate" name="boardForm" 
			enctype="multipart/form-data">

	<input type="hidden" name="anum" value="${board.anum}"/>
		<input type="hidden" name="file1" value="${board.orgFile}"/>


	<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td id="title">작성자</td>
			<td>${board.nick}</td>
		</tr>
			<tr>
			<td id="title">
				제 목
			</td>
			<td>
				<input name="title" type="text" size="70" maxlength="100"  required="required" value="${board.title}"/>
			</td>		
		</tr>
		<tr>
			<td id="title">
				내 용
			</td>
			<td>
				<textarea name="content" cols="72" rows="20" required="required">${board.content}</textarea>			
			</td>		
		</tr>
			<tr>
				<th>파일 첨부</th>
				<td><input type="file" name="file1" value="${board.serverFile}" /></td>
			</tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="button" value="작성취소" onclick="history.back()" >
				<input type="submit" value="수정" >
				<input type="button" value="목록" onclick="changView()" >			
			</td>
		</tr>
	</table>	
	</form>
	
</body>
</html>