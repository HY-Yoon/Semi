package dao.reviewboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.reviewboard.ReviewRecoVo;

public class ReviewRecoDao {
	private static ReviewRecoDao instance=null;
	public static ReviewRecoDao getInstance()
	{
		if(instance ==null)
			instance= new ReviewRecoDao();
		return instance;
	}
	private ReviewRecoDao() 
	{
		initialize();
	}
	private void initialize(){}
	
	public int delete(int anum) {
		int n= -1;
		Connection con= null;
		PreparedStatement pstmt= null;
		String sql= "delete from reco_review where anum = ?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	public int delete(int anum, int mnum) {
		int n= -1;
		Connection con= null;
		PreparedStatement pstmt= null;
		String sql= "delete from reco_review where anum = ? and mnum = ?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			pstmt.setInt(2, mnum);
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	public int insert(int anum, int mnum) {
		int n= -1;
		Connection con= null;
		PreparedStatement pstmt= null;
		String sql= "insert into reco_review values(reco_review_seq.nextval,?,?)";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			pstmt.setInt(2, mnum);
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	public ReviewRecoVo select(int anum, int mnum) {
		ReviewRecoVo vo = null;
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= "select * from reco_review where anum = ? and mnum = ?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			pstmt.setInt(2, mnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo = new ReviewRecoVo();
				vo.setAnum(anum);
				vo.setMnum(mnum);
				vo.setRnum(rs.getInt("rnum"));
			}
		}catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
		return vo;
	}
	
	public int getRecoCount(int anum) {
		int cnt= -1;
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= "select NVL(count(rnum),0) cnt from reco_review where anum ="+anum;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		}catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return cnt;
	}
}
