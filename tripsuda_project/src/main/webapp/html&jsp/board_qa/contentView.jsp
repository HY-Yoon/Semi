<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board_qa/qContentView.css">
<script type="text/javascript">
	window.onload=function(){
		commView();
	}
	function commView(){
		var xhr=new XMLHttpRequest(); //자바스크립트 내장 객체 얻어오기
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){ //응답하고 응답 성공했을 때 명령 처리하기
				let qacomm=document.getElementById("qacomm");
				let jdata=xhr.responseText; //text-plain 타입으로 얻어오기
				let data=JSON.parse(jdata);
				let list=data.clist;
				//댓글 얻어오기
				for(let i=0;i<list.length;i++){
					var cnum=list[i].cnum;
					var fircomm=document.createElement("div");
						fircomm.className="fircomm";
						var comminfo=document.createElement("div");
							comminfo.className="comminfo";
							var cnick=document.createElement("p");
								cnick.innerHTML=list[i].commnick;
								cnick.className="cnick";
							comminfo.appendChild(cnick);
							var cdate=document.createElement("p");
								cdate.innerHTML=list[i].commregdate;
								cdate.className="cdate";
							comminfo.appendChild(cdate);
						fircomm.appendChild(comminfo);
						var commcontent=document.createElement("div");
							commcontent.className="commcontent";
							commcontent.innerHTML=list[i].commcontent;
						fircomm.appendChild(commcontent);
						var commbottom=document.createElement("div");
							commbottom.className="commbottom";
							commbottom.innerHTML="<a href='#'>신고하기</a>";
						fircomm.appendChild(commbottom);
					qacomm.appendChild(fircomm);
				}
			}
		}
		let param="anum="+${bvo.anum};
		xhr.open('post','${pageContext.request.contextPath}/html&jsp/board_qa/commview?anum='+${bvo.anum},true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send(param);
	}
</script>
</head>
<body>
<div class="container">
	<div class="content">
		<div class="title"><img src="${pageContext.request.contextPath}/images/common/icon/question.svg">${bvo.title }</div>
		<div>상태 
		<c:if test="${bvo.keyword }=='답변대기'">
			<span style="color:green">${bvo.keyword }</span>
		</c:if>
		 ${bvo.keyword } 지역 ${ltag }</div>
		<div>${bvo.content }본문</div>
		<div class="contentbottom">
			<c:if test="${htag!=null}">
				<ul>
					<c:forEach var="hash" items="${htag}">
						<li>${hash }</li>
					</c:forEach>
				</ul>
			</c:if>
			${bvo.regdate} - 조회수 ${views } - 답변수 ${commcnt } <a href="#">신고하기</a>
		</div>
		<div class="uD">
		세션에 들어있는 회원번호와 글에 붙어있는 회원번호 일치할 때만 보이게 하기 
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</div>
		<div id="qacomm" name="qacomm">
			<div>${commcnt }개의 답변 </div>
			<div id="qacommcomm" name="qacommcomm">
				대댓글영역
			</div>
		</div>
	<div class="side">
		<div id="info">${bvo.nick } 연령대 성별 
		</div>
		<div class="commbtn">
			답변하기/채택완료 답변하기 버튼 눌렀을때 로그인 안했으면 로그인하세요 뜨기 
			<input type="button" value="답변하기" onclick="location.href='${pageContext.request.contextPath}/html&jsp/board_qa/comminsert_qa?anum=${bvo.anum}'">
		</div>
	</div>
</div>
</body>
</html>