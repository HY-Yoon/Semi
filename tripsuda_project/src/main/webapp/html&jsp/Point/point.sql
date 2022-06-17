				포인트(member,point는 공용) / 게시판,댓글,추천은 테이블명,칼럼명 수정해서 복붙
				
cf) 포인트 테이블 수정함(포인트 내용)

1) 전문가 게시판 작성시 포인트+1 트리거
create or replace trigger expertboard_addpoint
after insert on board_expert 
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'게시글 작성');

end;
/


2) 전문가 게시판 댓글 포인트+1 트리거
create or replace trigger expertcomm_addpoint
after insert on comm_expert
for each row
begin
    insert into point values(seq_point.nextval, :new.mnum,1,sysdate,'댓글 작성');

end;
/

3) 작성한 게시판이 추천을 10받았을때 작성자에게 포인트+1
			 
		ExpertRecoController
		
		int cnt = dao.getCount(anum);  -- 추천테이블dao  게시판 추천수 조회
		if(cnt==10) { --추천수 10일때
			Board_ExpertDao edao = Board_ExpertDao.getInstance();  
			int pointmnum =edao.reco10(anum);         -- 추천10받은 게시판 작성자 회원번호 구하기 
			PointDao pdao = new PointDao(); 			
			String content = "게시글 추천수 10";				   
			int n1 = pdao.insert(pointmnum,content);  --포인트 테이블 추가
		}

		
4) 포인트가 10이상이면 등급(일반->전문가)
관리자 회원관리 기능 / 회원목록 조회 controller page에서 나중에 적용

pointdao에서 포인트 10넘는 회원번호 조회
select mnum from(
    select mnum,count(*) cnt from point group by mnum
) where cnt > 10;

memberdao에 update member set grade ='전문가' where mnum=? 적용




