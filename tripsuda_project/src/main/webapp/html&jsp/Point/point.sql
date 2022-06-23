											포인트(member,point는 공용) 
				
cf) 포인트 테이블 수정함(포인트 내용 추가)



1)게시글 작성시 포인트+1 / 트리거

1-1 전문가 
create or replace trigger expertboard_addpoint
after insert on board_expert 
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'전문가게시판 작성');

end;
/


1-2 동행
create or replace trigger boardparty_addpoint
after insert on board_party
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'동행게시판 작성');

end;
/


1-3 자유 
create or replace trigger boardfree_addpoint
after insert on board_free
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'자유게시판 작성');

end;
/


1-4 후기
create or replace trigger boardreview_addpoint
after insert on board_review
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'여행후기게시판 작성');

end;
/


1-5 QnA
create or replace trigger boardqa_addpoint
after insert on board_qa
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'Q&A게시판 작성');

end;
/





2) 댓글작성시 포인트+1 /  트리거

2-1 전문가
create or replace trigger expertcomm_addpoint
after insert on comm_expert
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'댓글 작성');

end;
/


2-2 여행후기
create or replace trigger reviewcomm_addpoint
after insert on comm_review
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'댓글 작성');

end;
/


2-3 QnA (답변)
create or replace trigger qacomm_addpoint
after insert on comm_qa
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'답변 작성');

end;
/


2-4 자유 
create or replace trigger freecomm_addpoint
after insert on comm_free
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'댓글 작성');

end;
/



3) 작성한 게시판이 추천을 10받았을때 작성자에게 포인트+1 
			 
3-1	전문	
	int cnt = dao.getCount(anum);  -- 추천테이블dao  게시판 추천수 조회
		if(cnt==10) { --추천수 10일때
			Board_ExpertDao edao = Board_ExpertDao.getInstance();  
			int pointmnum =edao.reco10(anum);         -- 추천10받은 게시판 작성자 회원번호 구하기 
			PointDao pdao = new PointDao(); 			
			String content = "게시글 추천수 10";				   
			int n1 = pdao.insert(pointmnum,content);  --포인트 테이블 추가
		}
		

		
3-2 후기		
		int count = dao.getRecoCount(anum); //후기게시판 추천수
		  if(count==10) { //추천수 10일때
			  ReviewBoardDao rdao = ReviewBoardDao.getInstance();
				int pointmnum =rdao.reco10(anum);         // 추천10받은 게시판 작성자 회원번호 구하기 
				PointDao pdao = new PointDao(); 			
				String content = "게시글 추천수 10";				   
				int n1 = pdao.insert(pointmnum,content);  //포인트 테이블 추가
				}


		
4) 포인트가 10이상이면 등급(일반->전문가)
관리자 회원관리 기능 / 회원목록 조회 controller page에서 나중에 적용

pointdao에서 포인트 10넘는 회원번호 조회
select mnum from(
    select mnum,count(*) cnt from point group by mnum
) where cnt > 10;

memberdao에 update member set grade ='전문가' where mnum=? 적용




