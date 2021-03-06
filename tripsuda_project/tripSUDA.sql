-- 회원
CREATE TABLE member (
   mnum   number(10) primary key,
   id   varchar2(20) NOT NULL UNIQUE,
   pwd   varchar2(20) NOT NULL,
   name   varchar2(20) NOT NULL,
   nick   varchar2(20) NOT NULL UNIQUE,   
   phone   varchar2(15) NOT NULL,
   birth   Date NOT NULL,
   withdraw varchar2(10) DEFAULT 'N' check(withdraw in('Y','N')),   
   favorite varchar2(15) NOT NULL, 
   grade   varchar2(30) DEFAULT '일반', 
   stop   Date DEFAULT NULL  
);


CREATE SEQUENCE num_seq;

------------6/23 혜인 시작
-- 여행후기게시판
CREATE TABLE board_review (
	anum	number(10)	primary key,	
	mnum	number(10) references member(mnum),	
	title	varchar2(100)	NOT NULL,
	content	clob	NOT NULL,
	regdate	date	NOT NULL,
	views number(10) NOT NULL,
	notice varchar2(5)	check(notice in('Y','N')),
	thum clob not null
	
);
-- 여행후기댓글
CREATE TABLE comm_review (
	cnum	number(10) primary key, --시퀀스
	anum	number(10) references BOARD_REVIEW(anum),
	mnum	number(10)	references member(mnum),
	regdate	Date	NOT NULL,
	content clob not null
);
-- 여행후기추천
create table reco_review(
    rnum number(10) primary key,
    anum number(10) references BOARD_REVIEW(anum),
    mnum number(10) references member(mnum)
);
-- 여행후기지역태그
create table taglist_review(
    tnum number(10) primary key,
    anum number(10) references BOARD_REVIEW(anum),
    tag varchar2(30) not null
);
-- 여행후기해시태그
create table hashtag_review(
    hnum number(10) primary key,
    anum number(10) references BOARD_REVIEW(anum),
    htag varchar2(30) not null
);
------------6/23 혜인 끝


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

--전문가 해시태그
create table hashtag_expert(
	hashnum number(10) primary key,
	anum number(10) references board_expert(anum),
	tag varchar2(200) not null
)

--전문가 태그
create table tag_expert(
	tnum number(10) primary key,
	anum number(10) references board_expert(anum),
	tag varchar2(100) not null
)





-- Q&A게시판
CREATE TABLE board_qa (
	anum	number(10)	primary key,	
	mnum	number(10) references member(mnum),	
	nick	varchar2(20)	NOT NULL,
	title	varchar2(100)	NOT NULL,
	keyword	varchar2(20),
	content	clob	NOT NULL,
	regdate	date	NOT NULL,
	views number(10) NOT NULL,
    clastdate date null
);
-- Q&A 댓글
CREATE TABLE comm_qa (
	cnum	number(10) primary key, 
	anum	number(10) references board_qa(anum),
	mnum	number(10)	references member(mnum),
	content	varchar2(500)	NOT NULL,
	regdate	Date	NOT NULL,
	ref	    number(10)	NULL,
	lev	    number(10)	NULL,
	sel  	VARCHAR2(100) check(sel in('Y','N'))
);
-- Q&A 해시태그리스트
create table hashtag_qa(
    hnum number(10) primary key,
    anum number(10) references board_qa(anum),
    htag varchar2(30) not null
);
create sequence hashtag_qa_seq;
-- Q&A 지역태그리스트
create table localtag_qa(
    tnum number(10) primary key,
    anum number(10) references board_qa(anum),
    ltag varchar2(30) not null
);
create sequence localtag_qa_seq;

-- 포인트
CREATE TABLE point (
	pnum 	number(10) primary key,
	mnum	number(10) references member(mnum),	
	point	number(10) default 0,
	pdate  date not null,
	content varchar2(30) -- 포인트 얻은 이유   게시판 작성 / 추천 10
);

--신고
CREATE table report(
	rnum number(10) primary key, --시퀀스
	defendant number(10) not null, --신고당한 회원번호
	plaintiff number(10) not null, --신고한 회원번호
	reason varchar(200) not null, -- 신고 이유로 통일 
	rdate Date not null
);

--내일정
create table mycalender(
  ecode number(10) NOT NULL, --시퀀스
  mnum number(10) references member(mnum),
  anum  number(10) references board_party(anum),
  title varchar2(100) board_party(title),
  startdate date board_party(startdate),
  enddate date board_party(enddate)
 );
create sequence mycalender_seq;

-- 동행 게시판 (partyboard X)
-- 220620 dest 및 gender 컬럼의 크기를 10 -> 20으로 증가
drop table board_party cascade constraints;
CREATE TABLE board_party (
	anum	    number(10)      primary key,	
	mnum	    number(10)      references member(mnum),	
	nick	    varchar2(20)	NOT NULL,

	dest        varchar2(20)    NOT NULL,
	gender      varchar2(20),
	age_min     number(10),
	age_max     number(10),
	memcnt      number(10)      NOT NULL,
	startdate   date            NOT NULL,
	enddate     date            NOT NULL,

	backimage   clob            NOT NULL,

	title	    varchar2(100)	NOT NULL,
	content	    clob            NOT NULL,
    tags        varchar2(100),

	views       number(10)      NOT NULL,
	regdate	    date	        NOT NULL,
	expired     char	        default 'N' NOT NULL
);
CREATE SEQUENCE board_party_seq;

--동행신청목록 (220620 - 시퀀스 제거(불필요해보여서))
CREATE TABLE partywait (
	anum number references board_party(anum), -- 게시글번호 참조 
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
    anum NUMBER,
    members chat_members,
    
    CONSTRAINT fk_chatroom_anum FOREIGN KEY(anum) REFERENCES board_party(anum)
)
NESTED TABLE members STORE AS chat_members_list;
-- 채팅방 시퀀스
CREATE SEQUENCE chatroom_seq;

-- 채팅
-- 220622 - 외래 키 제약조건 제거
DROP TABLE chat;
CREATE TABLE chat
(
    cnum NUMBER PRIMARY KEY,
    rnum NUMBER,
    sender NUMBER NOT NULL,
    readers chat_members,
    message VARCHAR2(1000) NOT NULL,
    credate DATE NOT NULL
)
NESTED TABLE readers STORE AS chat_readers_list;
-- 외래 키 걸려있는 경우 아래 커맨드로 제거하기
ALTER TABLE chat DROP CONSTRAINT fk_chat_sender;

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
    after insert on board_party
    for each row
declare
    nums chat_members;
begin
--    select :new.mnum bulk collect into nums from board_party where anum = :new.anum;
    insert into chatroom values(chatroom_seq.nextval, :new.anum, chat_members(:new.mnum));
end chatroom_create_trig;


--자유게시판
CREATE TABLE board_free (
   anum   number(10)   primary key,  
   mnum   number(10) references member(mnum),  
   id varchar2(20) not null, 
   nick   varchar2(20)   NOT NULL,  
   title   varchar2(100)   NOT NULL,     
   keyword   varchar2(20),   
   content   clob   NOT NULL,  
   regdate   date   NOT NULL,  
   orgFile   varchar2(200),   
   serverFile   varchar2(200),  
   views number(10) NOT NULL  
);


CREATE SEQUENCE fanum_seq;

CREATE TABLE comm_free (
   cnum   number(10) primary key,
   anum   number(10) references board_free(anum),
   mnum   number(10)   references member(mnum),  
   id varchar2(20) not null,
   nick varchar2(20), --작성자 닉네임
   content   varchar2(500)   NOT NULL, 
   regdate   Date   NOT NULL, 
   ref      number(10)   NULL, 
   lev       number(10)   NULL, 
   step   number(10)   NULL
);

CREATE SEQUENCE fcnum_seq;

방문자 테이블
create table visit(
vnum number(5) primary key,
vdate date not null
)

create sequence seq_visit;

