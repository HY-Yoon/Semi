--전문가 게시판
CREATE TABLE board_expert (
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
	notice varchar2(20) check(notice in('Y','N'))
);
create sequence seq_Eboard;


--댓글
CREATE TABLE comm_expert (
	cnum	number(10) primary key, --시퀀스
	anum	number(10) references board_expert(anum),
	mnum	number(10)	references member(mnum),
	content	varchar2(500)	NOT NULL,
	regdate	Date	NOT NULL,
	ref		number(10)	NULL,
	lev	    number(10)	NULL,
	step	number(10)	NULL
	
);

insert into comm_expert values(SEQ_ECOMM.nextval,123,1,'댓글1',sysdate,0,0,0);
anum 123 mnum 1 nick test

create sequence seq_Ecomm;
--추천
create table reco_expert(
    rnum number(10) primary key,
    anum number(10) references board_expert(anum),
    mnum number(10) references member(mnum)
);
create sequence seq_Ereco;

--지역태그
create table tag_expert(
    tnum number(10) primary key,
    anum number(10) references board_expert(anum),
    tag varchar2(30) not null --지명
);
create sequence seq_Etag;

create table hashtag_Expert(
    hashnum number(10) primary key,
    anum number(10) references board_expert(anum),
    tag varchar2(30) not null --지명
);

create sequence seq_Ehashtag;



