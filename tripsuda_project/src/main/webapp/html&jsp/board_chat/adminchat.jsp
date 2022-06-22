<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../../js/board_chat/adminchat_lib.js?ver=<%=System.currentTimeMillis() %>"></script>
<link rel="stylesheet" href="../../css/board_chat/chat.css?ver=<%=System.currentTimeMillis() %>">
<link rel="stylesheet" href="../../css/board_chat/adminchat.css?ver=<%=System.currentTimeMillis() %>">
<div id="adminchat">
    <div id="adminchat_btn" style="" onclick="AdminChatManager.toggleChat(true)">
        <p>1:1 문의</p>
    </div>
    <div id="adminchat_box" style="display: none;">
        <div class="chat-flex">
            <div>
                <input type="button" value="X" onclick="AdminChatManager.toggleChat(false)">
            </div>
            <div class="messagebox" id="chatlist">
            </div>
            <div class="line"></div>
            <div class="sendbox">
                <div class="msgbox">
                    <input type="text" id="msg" placeholder="이곳에 채팅 입력" onkeypress="AdminChatManager.sendChat(event)">
                </div>
            </div>
        </div>
    </div>
</div> 