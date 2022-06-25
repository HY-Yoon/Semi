package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

public class VisitDao {
	
//방문자 증가
	public int insertVisit() {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into visit values(seq_visit.nextval,sysdate)";
		pstmt = con.prepareStatement(sql);
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
}
	//총방문자수
	public int totalVisit() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select nvl(count(*),0) cnt from visit";
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next(); 
			int cnt = rs.getInt("cnt");
			return cnt;
					
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	
	//일일 방문자수
	public int todayVisit() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select nvl(count(*),0) cnt from visit"
			     	+" where to_date(vdate,'YYYY-MM-DD') = to_date(sysdate,'YYYY-MM-DD')";
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next(); 
			int cnt = rs.getInt("cnt");
			return cnt;
					
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	// 하루 방문자수	
	public int dayVisit(int day) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select nvl(count(*),0) cnt from visit"
			     	+" where to_date(vdate,'YYYY-MM-DD') = to_date(sysdate,'YYYY-MM-DD') -"+(day);
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next(); 
			int cnt = rs.getInt("cnt");
			return cnt;
					
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	
	
	
	
	
	
	//최근 일주일 방문자수
		public int weekVisit() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;			
			con = JdbcUtil.getCon();
		try {
			String sql = "select nvl(count(*),0) cnt from visit"
				     	+" where to_date(vdate,'YYYY-MM-DD') +7 > to_date(sysdate,'YYYY-MM-DD')";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next(); 
				int cnt = rs.getInt("cnt");
				return cnt;
						
		}catch (SQLException s) {
			 s.printStackTrace();
			 return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	
}
