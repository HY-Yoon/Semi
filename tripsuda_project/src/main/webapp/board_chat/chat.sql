-- 테이블식

-- 회원 리스트 타입 선언
CREATE OR REPLACE TYPE chat_members IS TABLE OF NUMBER;

-- 채팅방 테이블
DROP TABLE chatroom;
CREATE TABLE chatroom
(
    rnum NUMBER PRIMARY KEY,
    anum NUMBER NOT NULL,
    members chat_members,
    
    CONSTRAINT fk_chatroom_anum FOREIGN KEY(anum) REFERENCES board(anum)
)
NESTED TABLE members STORE AS chat_members_list;

-- 채팅방 테이블 시퀀스
CREATE SEQUENCE chatroom_seq;


-- 채팅 테이블
DROP TABLE chat;
CREATE TABLE chat
(
    cnum NUMBER PRIMARY KEY,	-- 채팅번호
    rnum NUMBER NOT NULL,		-- 채팅방 번호 (관리자 채팅의 경우 0)
    sender NUMBER NOT NULL,		-- 발신자 회원번호
    readers chat_members,		-- 수신자 회원번호들, nullable
    message VARCHAR2(1000) NOT NULL,	-- 문장
    credate DATE NOT NULL,		-- 채팅 발신일자
    
    CONSTRAINT fk_chat_rnum FOREIGN KEY(rnum) REFERENCES chatroom(rnum),
    CONSTRAINT fk_chat_sender FOREIGN KEY(sender) REFERENCES MEMBER(mnum)
)
NESTED TABLE readers STORE AS chat_readers_list;

-- 채팅 테이블 시퀀스
CREATE SEQUENCE chat_seq;

-- 관리자 채팅
DROP TABLE adminchat;
CREATE TABLE adminchat
(
    cnum NUMBER NOT NULL,	-- 채팅 번호(외래키)
    sender NUMBER NOT NULL,	-- 발신자 회원번호(외래키)
    reader NUMBER NOT NULL,	-- 수신자 회원번호(관리자의 경우 0)
    
    CONSTRAINT fk_adchat_cnum FOREIGN KEY(cnum) REFERENCES chat(cnum),
    CONSTRAINT fk_adchat_sender FOREIGN KEY(sender) REFERENCES MEMBER(mnum)
);



-- 트리거
-- 동행구하기 글 작성되면 채팅방도 자동으로 생성
-- ※ 글이 지워진다고 같이 제거되진 않음! (기록을 남겨야 할 것 같아서)
create or replace trigger chatroom_create_trig
    after insert on partyboard
    for each row
declare
    nums chat_members;
begin
    select mnum bulk collect into nums from board where anum = :new.anum;
    insert into chatroom values(chatroom_seq.nextval, :new.anum, nums);
end chatroom_create_trig;