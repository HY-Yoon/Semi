<%@page import="controller.report.UserReportController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board_qa/content.css">
<script type="text/javascript">
	window.onload=function(){
		commView();
	}
	function commView(){
		var xhr=new XMLHttpRequest(); //자바스크립트 내장 객체 얻어오기
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){ //응답하고 응답 성공했을 때 명령 처리하기
				let sesnum="${sessionScope.sessionMnum}";
				let connum="${bvo.mnum }";
				let qacomm=document.getElementById("qacomm");
				let jdata=xhr.responseText; //text-plain 타입으로 얻어오기
				let data=JSON.parse(jdata);
				let list=data.clist;
				//댓글 얻어오기
				for(let i=0;i<list.length;i++){
					let cnum=list[i].cnum;
					if(qacomm.getElementsByClassName("fircomm").length > list.length - 1) {
						break;
					}
					if(sesnum==connum && "${bvo.keyword }"=="답변대기"){
						let commsel=document.createElement("div");
							commsel.className="commsel";
							let commchec=document.createElement("input");
								commchec.type="button";
								commchec.className="chec"
								commchec.addEventListener('click',function(e){
										let url="${pageContext.request.contextPath}/html&jsp/board_qa/commChecPopup.jsp?cnum="+cnum+"&anum="+${bvo.anum};
										window.open(url,"","width=450, height=250, top= resizable=no, scrollbars=no");
									});
							commsel.appendChild(commchec);
						qacomm.appendChild(commsel);
					}
					 	
					let fircomm=document.createElement("div");
						fircomm.className="fircomm";
						let comminfo=document.createElement("div");
							comminfo.className="comminfo";
							let cnick=document.createElement("p");
								cnick.innerHTML=list[i].commnick;
								cnick.className="cnick";
							comminfo.appendChild(cnick);
							let cdate=document.createElement("p");
								cdate.innerHTML=list[i].commregdate;
								cdate.className="cdate";
							comminfo.appendChild(cdate);
							comminfo.innerHTML="${bvo.mnum}";
						fircomm.appendChild(comminfo);
						let commcontent=document.createElement("div");
							commcontent.className="commcontent";
							commcontent.innerHTML=list[i].commcontent;
						fircomm.appendChild(commcontent);
						let selecarea=document.createElement("div");
							selecarea.clasYsName="selecarea";
						if(list[i].sel=='Y'){
							let selimg=document.createElement("img");
								selimg.src="../../images/board_qa/commsel.svg";
							selecarea.appendChild(selimg);
						}
						fircomm.appendChild(selecarea);
					qacomm.appendChild(fircomm);
				}
			}
		}
		let param="anum="+${bvo.anum};
		xhr.open('post','${pageContext.request.contextPath}/html&jsp/board_qa/commview?anum='+${bvo.anum},true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send(param);
	}
	function goPopup(){
		window.open("${pageContext.request.contextPath}/html&jsp/board_qa/loginPopup.jsp","loginChec","width=450, height=250, top= resizable=no, scrollbars=no");
	}
</script>
</head>
<body>
<div class="main">
	<div class="left">
		<div class="content">
			<div class="title">
				<img src="${pageContext.request.contextPath}/images/common/icon/question.svg"/>
				${bvo.title }
			</div>
			<div class="middletop">
				상태 
					<c:choose>
						<c:when test="${bvo.keyword }=='답변대기'">
							<span style="color:gray">
								${bvo.keyword }
							</span>
						</c:when>
						<c:when test="${bvo.keyword }=='채택완료'">
							<span style="color:blue">
								${bvo.keyword }
							</span>
						</c:when>
					</c:choose>
				지역 
					<span class="contentlocal">
						${ltag }
					</span>
			</div>
			<div class="middlebottom">
				${bvo.content }
			</div>
			<div class="bottom">
				<div class="hashtag">
					<c:if test="${!empty htag}">
						<ul>
							<c:forEach var="hash" items="${htag}">
								<li>${hash }</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<div class="contentinfo">
					${bvo.regdate} - 조회수 ${views } - 답변수 ${commcnt } 
				</div>
				<div class="contentud">
					<c:choose>
						<c:when test="${sessionScope.sessionMnum eq requestScope.bvo.mnum }">
							<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa/updateboard_qa?anum=${bvo.anum}'">
							<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa/deleteboard_qa?anum=${bvo.anum}'">
						</c:when>
						<c:when test="${empty sessionScope}">
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="comment">
			<div class="commcnt">
				${commcnt }개의 답변
			</div>
			<div id="qacomm" name="qacomm" class="qacomm"></div>
		</div>
	</div>
	<div class="right">
		<div class="amemberinfo">
			<div id="info">
				${bvo.nick } 
				연령대, 관심지역, 등급
			</div>
		</div>
		<div class="status">
			<c:choose>
					<c:when test="${bvo.keyword eq '채택완료'}">
						<div class="selcomplete">
							답변 채택이 완료되었습니다.
						</div>
					</c:when>
					<c:when test="${bvo.keyword eq '답변대기'}">
						<c:choose>
							<c:when test="${empty sessionScope}">
								<input type="button" value="답변하기" onclick="window.open('${pageContext.request.contextPath}/html&jsp/board_qa/loginPopup.jsp','login','width=450, height=250, top= resizable=no, scrollbars=no')">
							</c:when>
							<c:when test="${!empty sessionScope}">
								<input type="button" value="답변하기" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa/comminsert_qa?anum=${bvo.anum}'">
							</c:when>
						</c:choose>
					</c:when>
			</c:choose>
		</div>
	</div>
</div>
</body>
</html>