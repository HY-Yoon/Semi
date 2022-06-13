package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.JdbcUtil;
import vo.Expert_hashtagVo;


public class Expert_hashtagDao {
	//------------해시태그 추가----------------------
	public int insert(Expert_hashtagVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into hashtag_expert values(seq_ehashtag.nextval,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,vo.getAnum());
		pstmt.setString(2, vo.getTag());
		return pstmt.executeUpdate();
		
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		
		JdbcUtil.close(con, pstmt, null);
	
	}
	
}
	
	//--------------해시태그 가저오기---------------
		public String list(int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;			
			con = JdbcUtil.getCon();
		try {
			String sql = "select * from hashtag_expert where anum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String tag = rs.getString("tag");
				return tag;
			}
			return null;
		}catch (SQLException s) {
			 s.printStackTrace();
			 return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
		//-------------------해시태그삭제--------------
		public int delete(int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			con = JdbcUtil.getCon();
		try {
			String sql = "delete from hashtag_expert where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,anum);
			return pstmt.executeUpdate();
					
		}catch (SQLException s) {
			 s.printStackTrace();
			 return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
	}
}
