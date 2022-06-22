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
}
