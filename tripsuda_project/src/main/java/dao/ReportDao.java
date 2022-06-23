package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;

public class ReportDao {
	public int insert(int defendant, int plaint, String reason ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into report values(seq_report.nextval,?,?,?,sysdate)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,defendant);
		pstmt.setInt(2,plaint);
		pstmt.setString(3, reason);
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
	
}
}
