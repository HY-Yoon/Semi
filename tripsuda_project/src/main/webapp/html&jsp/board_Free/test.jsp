<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board_free/detail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<script type="text/javascript">

	function commList() {
		let xhr = new XMLHttpRequest();
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;
				let commList = document.getElementById("commList");
				let child = commList.childNodes;
				for (let i = child.length - 1; i >= 0; i--) {
					let c = child.item(i);
					commList.removeChild(c);
				}

				let data = JSON.parse(result);
				let comm = data.list;

				for (let i = 0; i < comm.length; i++) {
					let nick = comm[i].nick;
					let mnum = comm[i].mnum;
					let content = comm[i].content;
					let regdate = comm[i].regdate;

					let div = document.createElement("div");

					div.innerHTML = "<div class='nickreg'><span class='nic'>"
							+ nick + "</span><br><span class='reg'>" + regdate
							+ "</span></div>" + "<div class='c'>" + content
							+ "</div>";

					div.className = "comm";
					commList.appendChild(div);
				}
			}
		};
		xhr
				.open(
						'get',
						'${pageContext.request.contextPath}/Free_CommentListController?anum=${anum}',
						true);
		xhr.send();
	}

	function Commadd() {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);

				if (json.code == 'success') {
					commList();
				} else {
					alert('댓글등록실패!');
				}
			}
		};
		let nick = document.getElementById("nick").value;
		let comments = document.getElementById("comments").value;

		let param = "nick=" + nick + "&comments=" + comments + "&anum=${anum}";
		xhr.open('post', '${pageContext.request.contextPath}/FCommWrite', true);
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.send(param);
	}

	function del() {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);

				if (json.result == 'success') {
					alert('삭제되었습니다');
					location.href = "${pageContext.request.contextPath}/html&jsp/board_Free/list.jsp";

				} else {
					alert('삭제실패');
				}
			}
		};
		xhr.open('get','${pageContext.request.contextPath}/Free_CommentDeleteController?anum=${anum }',true);
		xhr.send();

	}
</script>
<body>
	<div id="header">
		<jsp:include page="../default/default_header.jsp" />
	</div>
	<main>
		<div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>자유게시판</strong>
					<p>여러분의 이야기를 자유롭게 써주세요.</p>
				</div>
				<div class="board_list_wrap">
					<div class="board_view">
						<div class="title">${board.title}</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${board.anum}</dd>
							</dl>
							<dl>
								<dt>작성자</dt>
								<dd>${board.nick}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${board.regdate}</dd>
							</dl>
							<dl>
								<dt>조회수</dt>
								<dd>${board.views}</dd>
							</dl>
							<dl>
								<dt>첨부파일</dt>
								<dd>
									<a
										href="${pageContext.request.contextPath}/F_FileDownload?orgFile=${board.orgFile}&serverFile=${board.serverFile}">${board.serverFile}</a>
								</dd>
							</dl>
						</div>
						<div class="cont">${board.content}</div>
					</div>

					<div class="bt_wrap">
						<c:if test="${sessionScope.sessionID !=null}">
							<c:if test="${sessionScope.sessionID == board.id}">
								<input type="button" value="수정" onclick="fnUpdate('${board.anum}')">
								<input type="button" value="삭제" onclick="fnDelete('${board.anum}')">
							</c:if>
						</c:if>
						<input type="button" value="목록" onclick="changeView()">
					</div>
					<div class="comm">
					<div class="commList"></div>
					<div id="commAdd">
						<input type="text" name="nick">${commentList.nick }<br>
						 <textarea rows="3" cols="50" name="comments"></textarea>
						<div class="btn1">
							<input type="button" id="add" value="댓글등록" onclick="Commadd()">
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div></div>
	<div id="footer">
		<jsp:include page="../default/default_footer.jsp" />
	</div>
	<script
		src="${pageContext.request.contextPath}/js/board_expert/default.js"></script>
</body>
</html>