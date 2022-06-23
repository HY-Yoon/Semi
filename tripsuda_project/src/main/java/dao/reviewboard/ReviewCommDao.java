package dao.reviewboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.reviewboard.ReviewCommVo;

public class ReviewCommDao {
	private static ReviewCommDao instance=null;
	public static ReviewCommDao getInstance()
	{
		if(instance ==null)
			instance= new ReviewCommDao();
		return instance;
	}
	private ReviewCommDao() 
	{
		initialize();
	}
	private void initialize(){}
	
	public int delete(int anum) {
		int n=-1;
		Connection con =null;
		PreparedStatement pstmt=null;
		String sql = "delete from comm_review where anum=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return n;
	}
	
	public int insert(ReviewCommVo vo) {
		int n=-1;
		Connection con =null;
		PreparedStatement pstmt=null;
		String sql = "insert into comm_review values(comm_review_seq.nextval, ?, ?, sysdate, ?)"; //댓글번호, 글번호, 회원번호, 등록일, 댓글내용
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getAnum());
			pstmt.setInt(2, vo.getMnum());
			pstmt.setString(3, vo.getContent());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return n;
	}
	
	public int getCommCnt(int anum) {
		int cnt=-1;
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select NVL(count(*),0) cnt from comm_review where anum= " + anum;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
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
	
	public ArrayList<ReviewCommVo> getComm(int anum){
		ArrayList<ReviewCommVo> list = new ArrayList<ReviewCommVo>();
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from comm_review "
				+ "where anum= " + anum
				+ " order by cnum asc";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewCommVo vo = new ReviewCommVo();
				vo.setAnum(anum);
				vo.setCnum(rs.getInt("cnum"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getDate("regdate"));
				list.add(vo);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}
}
