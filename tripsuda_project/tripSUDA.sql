-- 회원
CREATE TABLE member(  
	mnum	number(10) primary key,
	id	varchar2(20)	NOT NULL UNIQUE,
	pwd	varchar2(20)	NOT NULL,
	name	varchar2(20)	NOT NULL,
	nick	varchar2(20)	NOT NULL UNIQUE,	
	phone	varchar2(11)	NOT NULL,
	birth	Date	NOT NULL,
	withdraw varchar2(5)	DEFAULT 'N' check(withdraw in('Y','N')),	-- 'Y/N'
	favorite varchar2(15)	NOT NULL, --관심지역
	grade	varchar2(30)	NOT NULL, --일/전/관   디폴트 일반?
	stop	Date DEFAULT NULL	--기한이 됐을 때 로그인 가능함
);
-- 여행후기게시판
CREATE TABLE board_review (
	anum	number(10)	primary key,	
	mnum	number(10) references member(mnum),	
	nick	varchar2(20)	NOT NULL,
	title	varchar2(100)	NOT NULL,
	keyword	varchar2(20),
	content	clob	NOT NULL,
	regdate	date	NOT NULL,
	orgFile	varchar2(200),	
	serverFile	varchar2(200),
	views number(10) NOT NULL,
	notice varchar2(5)	check(notice in('Y','N'))
);
-- 여행후기댓글
CREATE TABLE comm_review (
	cnum	number(10) primary key, --시퀀스
	anum	number(10) references board(anum),
	mnum	number(10)	references member(mnum),
	content	varchar2(500)	NOT NULL,
	regdate	Date	NOT NULL,
	ref		number(10)	NULL,
	lev	    number(10)	NULL,
	step	number(10)	NULL,
	sel  	VARCHAR2(100) check(sel in('Y','N'))
);
-- 여행후기추천
create table reco_review(
    rnum number(10) primary key,
    anum number(10) references board(anum),
    mnum number(10) references member(mnum)
);

-- 전문가 게시판
CREATE TABLE board_expert (
   anum   number(10)   primary key,   
   mnum   number(10) references member(mnum),   
   nick   varchar2(20)   NOT NULL,
   title   varchar2(100)   NOT NULL,
   keyword   varchar2(20),
   content   clob   NOT NULL,
   regdate   date   NOT NULL,
   orgFile   varchar2(200),   
   serverFile   varchar2(200),
   views number(10) NOT NULL,
   notice varchar2(5)	check(notice in('Y','N'))
);

-- 전문가 댓글
CREATE TABLE comm_expert (
   cnum   number(10) primary key, --시퀀스
   anum   number(10) references board_expert(anum),
   mnum   number(10)   references member(mnum),
   content   varchar2(500)   NOT NULL,
   regdate   Date   NOT NULL,
   ref      number(10)   NULL,
   lev       number(10)   NULL,
   step   number(10)   NULL,
   sel     VARCHAR2(100) check(sel in('Y','N'))
);
-- 전문가 추천
create table reco_expert(
    rnum number(10) primary key,
    anum number(10) references board_expert(anum),
    mnum number(10) references member(mnum)
);
-- 포인트
CREATE TABLE point (
	pnum 	number(10) primary key,
	mnum	number(10) references member(mnum),	
	point	number(10) default 0,
	pdate  date not null 
);
--신고
CREATE table report(
	rnum number(10) primary key, --시퀀스
	defendant number(10) not null, --신고당한 회원번호
	plaintiff number(10) not null, --신고한 회원번호
	reason varchar(200) not null,
	rdate Date not null,
	repo varchar2(500) not null --신고 내용(댓글내용/게시글내용 짧게)
);
--동행구하기
create table partyboard(
  anum number(10) NOT NULL, --시퀀스
  memcnt number(10) NOT NULL, --default 2, max 100
  dest varchar2(100) NOT NULL,
  startdate date NOT NULL,
  enddate date NOT NULL,
  gender varchar2(10),
  age number(10),
  yn varchar2(5)	default N NOT NULL,
);
--내일정
create table mycalender(
  ecode number(10) NOT NULL, --시퀀스
  mnum number(10) NOT NULL,
  anum  number(10), --시퀀스 
  ctitle varchar2(100) NOT NULL,
  startdate date NOT NULL,
  enddate date NOT NULL
 );

--태그리스트
create table taglist(
    tnum number(10) primary key,
    anum number(10) references board(anum),
    tag varchar2(30) not null
);
--카테고리
CREATE TABLE category (
	cate varchar2(30) check(cate in('자유','동행','전문가','후기','질문')) primary key
);
--동행신청목록
CREATE TABLE partywait (
    pnum number(10) primary key, --시퀀스 따로 만들 것 
	anum VARCHAR(255) references board(anum), -- 게시글번호 참조 
	mnum number(10) references member(mnum), --회원번호 참조
	yn varchar2(5)	DEFAULT 'N' check(yn in('Y','N'))
);




-- [[ 채팅방 ]]
-- 타입 선언
CREATE OR REPLACE TYPE chat_members IS TABLE OF NUMBER;

-- 채팅방
DROP TABLE chatroom;
CREATE TABLE chatroom
(
    rnum NUMBER PRIMARY KEY,
    anum NUMBER NOT NULL,
    members chat_members,
    
    CONSTRAINT fk_chatroom_anum FOREIGN KEY(anum) REFERENCES board(anum)
)
NESTED TABLE members STORE AS chat_members_list;
-- 채팅방 시퀀스
CREATE SEQUENCE chatroom_seq;

-- 채팅
DROP TABLE chat;
CREATE TABLE chat
(
    cnum NUMBER PRIMARY KEY,
    rnum NUMBER NOT NULL,
    sender NUMBER NOT NULL,
    readers chat_members,
    message VARCHAR2(1000) NOT NULL,
    credate DATE NOT NULL,
    
    CONSTRAINT fk_chat_rnum FOREIGN KEY(rnum) REFERENCES chatroom(rnum),
    CONSTRAINT fk_chat_sender FOREIGN KEY(sender) REFERENCES MEMBER(mnum)
)
NESTED TABLE readers STORE AS chat_readers_list;
-- 채팅 시퀀스
CREATE SEQUENCE chat_seq;

-- 관리자 채팅
DROP TABLE adminchat;
CREATE TABLE adminchat
(
    cnum NUMBER NOT NULL,
    sender NUMBER NOT NULL,
    reader NUMBER NOT NULL,
    
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
