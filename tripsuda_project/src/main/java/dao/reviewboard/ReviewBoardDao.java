package dao.reviewboard;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.reviewboard.ReviewBoardVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 Dao
*/
public class ReviewBoardDao {
	private static ReviewBoardDao instance=null;
	public static ReviewBoardDao getInstance()
	{
		if(instance ==null)
			instance= new ReviewBoardDao();
		return instance;
	}
	private ReviewBoardDao() 
	{
		initialize();
	}
	private void initialize(){}
	
	public int delete(int anum) {
		int n=-1;
		Connection con= null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		String sql1="delete from taglist_review where anum =?"; 
		String sql2="delete from board_review where anum =?"; 
		
		try {
			con=JdbcUtil.getCon();
			con.setAutoCommit(false); //자동커밋해제
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, anum);
			n=pstmt1.executeUpdate();
			
			pstmt2=con.prepareStatement(sql2); 
			pstmt2.setInt(1, anum);
			n+=pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			 e.printStackTrace();
			 try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		return n;
	}
	
	//공지사항 설정
	public int setNotice(int anum, String notice) {
		int n= -1;
		Connection con =null;
		PreparedStatement pstmt= null;
		String sql="update board_review set"
				+ " notice = ? where anum = ?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, notice);
			pstmt.setInt(2, anum);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	
	//전체 글 개수 
	public int getCount(String select, String search) {
		int cnt= -1;
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		con = JdbcUtil.getCon();
		try {
			String sql=null;
			if(select !=null && !select.equals("")) {
				//통합검색
				if(select.equals("tot")) {
					sql = "select NVL(count(*),0) cnt from"
						+ "(select b.*, t.tag, m.nick from board_review b, taglist_review t, member m where b.anum = t.anum and b.mnum = m.mnum)"
						+ " where tag like '%"+search+"%' or nick like '%" +search+ "%' "
						+ " or title like '%"+search+"%'";
					
				//태그
				}else if(select.equals("tag")) { 
					sql  = "select NVL(count(b.anum),0) cnt "
						+ " from board_review b, taglist_review t"
						+ " where tag like '%"+search+"%' and b.anum = t.anum";
					
				}else {       
					sql = "select NVL(count(b.anum),0) cnt "
						+ "from board_review b "
						+"where "+ select + " like '%" +search +"%'"; 
				}
				
			}else {
				//검색이 아닐 때
				sql = "select NVL(count(anum),0) cnt from board_review";
			}
			
			pstmt= con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return cnt;
	}
	
	//리스트
	public ArrayList<ReviewBoardVo> selectAll(int start, int end, String select, String search)
	{
		ArrayList<ReviewBoardVo> list = new ArrayList<ReviewBoardVo>();
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = null;
		try 
		{
			con=JdbcUtil.getCon();
			//검색이 있을 때
			if(select !=null && select.equals("")) {
				System.out.println("있을유");
				//통합검색
				if(select.equals("tot")) {
					sql = "select * from "
						+ "(select aa.* , rownum rnum from"
						+ " (select b.*, t.tag from board_review b, taglist_review t, member m "
						+ "  where b.anum = t.anum and b.mnum = m.mnum order by b.anum desc) aa"
						+ " where tag like '%"+search+"%' or nick like '%" +search+ "%'"
						+ " or title like '%"+search+"%')"
						+ "where rnum >=? and rnum <= ?";

				//태그 검색
				}else if(select.equals("tag")) {
					sql = "select * from ( "
						+ " select b.*, rownum rnum "
						+ " from board_review b, taglist_review t "
						+ " where b.anum = t.anum and tag like '%"+search+"%' "
						+ " order by b.anum desc "
						+" ) where rnum >=? and rnum <=?";
				}else {
					sql = " select * from ("
						+ " select b.*, rownum rnum from board_review b "
						+ " where " +select+ " like '%" +search+ "%' "
						+ " order by b.anum desc "
						+" ) where rnum >=? and rnum <= ?";
				}
			//검색 없을때
			}else {
				sql =  "select * from( "
					+ "    select aa.* , rownum rnum from( "
					+ "        select b.anum, b.mnum, title, content, notice, thum, regdate, views, tag, nick from "
					+ "        board_review b, taglist_review t, member m "
					+ "        where b.anum = t.anum and b.mnum = m.mnum  "
					+ "		   order by b.anum desc "
					+ "     ) aa "
					+ ") where rnum>=?  and rnum<=?";
			}
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewBoardVo vo = new ReviewBoardVo();
				vo.setAnum(rs.getInt("anum"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getDate("regdate"));
				vo.setViews(rs.getInt("views"));
				vo.setNotice(rs.getString("notice"));
				vo.setThum(rs.getString("thum"));
				vo.setLocation(rs.getString("tag"));
				vo.setNick(rs.getString("nick"));
				list.add(vo);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
		}
		return list;
	}

	//글 수정
	public int edit(ReviewBoardVo vo) {
		int n=-1;
		Connection con= null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		String sql1="update board_review set"
				+ " title =? , content = ? , thum = ?, notice = ?"
				+ " where anum = ?"; 
		
		String sql2="update taglist_review set "
				+ " tag = ?"
				+ " where anum = ?"; 
		try {
			con=JdbcUtil.getCon();
			con.setAutoCommit(false); //자동커밋해제
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setString(1, vo.getTitle());
			pstmt1.setString(2, vo.getContent());
			pstmt1.setString(3, vo.getThum());
			pstmt1.setString(4, vo.getNotice());
			pstmt1.setInt(5, vo.getAnum());
			n=pstmt1.executeUpdate();
			
			pstmt2=con.prepareStatement(sql2); 
			pstmt2.setString(1, vo.getLocation());
			pstmt2.setInt(2, vo.getAnum());
			n+=pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			 e.printStackTrace();
			 try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		return n;
	}
	
	//조회수 증가
	public void updateView(int anum) {
		Connection con=null;
		PreparedStatement pstmt= null;
		String sql= "update board_review "
				+ " set views = views + 1 "
				+ "where anum ="+anum;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
	}
	
	//글 가져오기
	public ReviewBoardVo select(int anum) {
		ReviewBoardVo vo =null;
		Connection con= null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		String sql1="select * from board_review where anum = "+anum;
		String sql2="select * from taglist_review where anum = "+anum;
		try {
			con=JdbcUtil.getCon();
			pstmt1=con.prepareStatement(sql1);
			rs1=pstmt1.executeQuery();
			if(rs1.next()) {
				pstmt2=con.prepareStatement(sql2);
				rs2=pstmt2.executeQuery();
				if(rs2.next()) {
					int mnum = rs1.getInt("mnum");
					String title = rs1.getString("title");
					String content = rs1.getString("content");
					Date regdate = rs1.getDate("regdate");
					int views = rs1.getInt("views");
					String notice = rs1.getString("notice");
					String thum = rs1.getString("thum");
					String location = rs2.getString("tag");
					vo= new ReviewBoardVo(anum, mnum, title, content, regdate, views, notice, thum, location);
				}
			}
		} catch (SQLException e) {
			 e.printStackTrace();
		}
		return vo;
	}
	
	//글쓰기
	public int write(ReviewBoardVo vo)
	{
		int n=-1;
		int anum=-1;
		Connection con= null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		ResultSet rs=null;
		String sql1="insert into board_review values (board_review_seq.nextval,"
				+ " ?, ?, ?," //회원번호, 제목, 글내용
				+ " sysdate, 0, \'N\',"//등록일, 조회수, 공지사항
				+ " ?)";//썸네일 
		
		String sql2="insert into taglist_review values (taglist_review_seq.nextval,"
				+ " board_review_seq.currval, ?)";
		
		
		String sql3 = "select board_review_seq.currval anum from dual";
		try {
			con=JdbcUtil.getCon();
			con.setAutoCommit(false); //자동커밋해제
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, vo.getMnum());
			pstmt1.setString(2, vo.getTitle());
			pstmt1.setString(3, vo.getContent());
			pstmt1.setString(4, vo.getThum());
			n=pstmt1.executeUpdate();
			
			pstmt2=con.prepareStatement(sql2); 
			pstmt2.setString(1, vo.getLocation());
			n+=pstmt2.executeUpdate();
			
			if(n == 2) {
				pstmt3=con.prepareStatement(sql3);
				rs=pstmt3.executeQuery();
				if(rs.next())
					anum = rs.getInt(1);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
			 try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt3);
			JdbcUtil.close(rs);
			JdbcUtil.close(con);
		}
		return anum;
	}
	//6.23 kj   추천10 받은 게시판 작성자(회원번호)
	public int reco10(int anum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select mnum from board_review where anum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, anum);
		rs = pstmt.executeQuery();
		rs.next(); 
			int mnum = rs.getInt("mnum");
			return mnum;
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	
	
	
	
	
}
