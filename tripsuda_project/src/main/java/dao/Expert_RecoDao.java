package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import db.JdbcUtil;

public class Expert_RecoDao {
	public int insert(int anum,int mnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into reco_expert values(seq_ereco.nextval,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,anum);
		pstmt.setInt(2,mnum);
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
	
}
	//--------------------삭-------------
	public int delete(int anum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "delete from reco_expert where anum=?";
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
