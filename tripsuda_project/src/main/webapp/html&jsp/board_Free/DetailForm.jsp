<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>

<script type="text/javascript">
		function changeView(){
				location.href="${pageContext.request.contextPath}/freelist";
		}
		
		
		function fnUpdate(anum) {
			if(confirm("수정하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/FBoardUpdateForm?anum=${board.anum}";
			}
			return false;
		}
		function fnDelete(anum) {
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/FBoardDelete?anum=${board.anum}";
			}
			return false;
		}


		
	</script>
</head>
<body>
<div id="board">
		<table id="detailBoard" width="800" border="3" bordercolor="lightgray">
        <input type="hidden" name="anum" value="${board.anum}"/>
			<tr>
				<td id="title">작성일</td>
				<td>${board.regdate}</td>
			</tr>
			<tr>
				<td id="title">작성자</td>
				<td>${board.nick}</td>
			</tr>
			<tr>
				<td id="title">
					제 목
				</td>
				<td>
					${board.title}
				</td>		
			</tr>
			<tr>
				<td id="title">
					내 용
				</td>
				<td>
					${board.content}
				</td>		
			</tr>
			<tr>
				<td id="title">
					첨부파일
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/F_FileDownload?orgFile=${board.orgFile}&serverFile=${board.serverFile}">${board.serverFile}</a>
				</td>	
			</tr>
	
			<tr align="center" valign="middle">
				<td colspan="5">
				<c:if test="${sessionScope.sessionID !=null}">
					<c:if test="${sessionScope.sessionID == board.id}">
						<input type="button" value="수정" onclick="fnUpdate('${board.anum}')">
						<input type="button" value="삭제" onclick="fnDelete('${board.anum}')">
					</c:if>
				</c:if>		
					<input type="button" value="목록" onclick="changeView()">			
				</td> 
			</tr>
		</table>
	</div>
	<br><br>
	
	
	
	
	<!-- 댓글 부분 -->
	<div id="comment">
	..................${requestScope.commentList}
		<table border="1" bordercolor="lightgray">
	<!-- 댓글 목록 -->	
	<c:if test="${requestScope.commentList != null}">
		<c:forEach var="comment" items="${requestScope.commentList}">
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td width="150">
					<div>
						${comment.nick}<br>
						<font size="2" color="lightgray">${comment.regdate}</font>
					</div>
				</td>
				<!-- 본문내용 -->
				<td width="550">
					<div class="text_wrapper">
						${comment.content}
					</div>
				</td>
				<!-- 버튼 댓글 작성자만 수정, 삭제 가능하도록-->
				<td width="100">
					<div id="btn" style="text-align:center;">
					<c:if test="${comment.id == sessionScope.sessionID}">
						<a href="#" onclick="cmUpdateOpen(${comment.cnum})">[수정]</a><br>	
						<a href="#" onclick="cmDeleteOpen(${comment.cnum})">[삭제]</a>
					</c:if>		
					</div>
				</td>
			</tr>
			
		</c:forEach>
	</c:if>
			<tr>
			<!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.sessionID !=null}">
			
			<form id="writeCommentForm">
				<input type="text" name="cnum" value="${comment.cnum}">
				<input type="hidden" name="comment_nick" value="${sessionScope.sessionNick}">
				<!-- 닉네임-->
				<td width="150">
					<div id="a1">
						${sessionScope.sessionNick}
					</div>
				</td>
				<!-- 본문 작성-->
				<td width="550">
					<div id="div">
						<textarea name="comment_content" rows="4" cols="70" ></textarea>
					</div>
				</td>
				<!-- 댓글 등록 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
						
						<input type="button" value="댓글 등록"  onclick="addComm()">
						
						<input type="button" value="댓글 삭제"  onclick="deleteComm('${comment.cnum}')">
					</div>
				</td>
			</form>
			</tr>
			</c:if>
	
		</table>
	</div>
</body>
</html>