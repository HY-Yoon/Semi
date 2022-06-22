package dao.reviewboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.reviewboard.ReviewTagVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 해시태그 Dao
*/
public class ReviewTagDao {
	private static ReviewTagDao instance=null;
	public static ReviewTagDao getInstance()
	{
		if(instance ==null)
			instance= new ReviewTagDao();
		return instance;
	}
	private ReviewTagDao() 
	{
		initialize();
	}
	private void initialize(){}
	
	public int delete(int anum) {
		int n= -1;
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "delete from hashtag_review"
				   + " where anum = "+anum;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	public ArrayList<ReviewTagVo> select(int anum) {
		ArrayList<ReviewTagVo> list=new ArrayList<ReviewTagVo>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from hashtag_review "
				+ " where anum = " + anum
				+ " order by hnum asc";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int hnum = rs.getInt("hnum");
				String htag = rs.getString("htag");
				ReviewTagVo vo= new ReviewTagVo(hnum, anum, htag);
				list.add(vo);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}
	
	public int insert(ReviewTagVo vo) 
	{
		int n=-1;
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into hashtag_review values(hashtag_review_seq.nextval, "
				+ " ?, ?)";//글번호, 태그
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getAnum());
			pstmt.setString(2, vo.getHtag());
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
}
