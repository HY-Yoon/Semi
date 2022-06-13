package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.Expert_taglistVo;

public class Expert_taglistDao {
	//---------------지역태그 추가--------------------
	public int insert(Expert_taglistVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into tag_expert values(SEQ_ETAG.nextval,?,?)";
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
	
	//--------------태그 가저오기---------------
	public String list(int anum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select * from tag_expert where anum=?";
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
	//----------삭--------
	public int delete(int anum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "delete from tag_expert where anum=?";
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
