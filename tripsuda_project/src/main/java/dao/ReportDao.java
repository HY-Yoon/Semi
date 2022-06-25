package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.Expert_commVo;
import vo.ReportVo;

public class ReportDao
{
	private static ReportDao instance = null;
	public static ReportDao getInstance()
	{
		if (instance == null)
			instance = new ReportDao();
		return instance;
	}
	private ReportDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	//신고하기
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
	//신고목록 조회
	public ArrayList<ReportVo> reportList(int start,int end){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			con = JdbcUtil.getCon();
			
			String sql =" select * from ("
				    +	" select aa.*, rownum rn from (" 
				    +  " select * from report order by rdate desc) aa "
				    + " ) where rn >= ? and rn <= ? ";
						
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs  = pstmt.executeQuery();
			
			ArrayList<ReportVo> list = new ArrayList<ReportVo>();
			while(rs.next()) {
				int rnum = rs.getInt("rnum");
				int defendant = rs.getInt("defendant");
				int plaintiff = rs.getInt("plaintiff");
				String reason = rs.getString("reason");
				Date rdate = rs.getDate("rdate");
						
				ReportVo vo = new ReportVo(rnum, defendant, plaintiff, reason, rdate);
				list.add(vo);
			}
			return list;
			
		}catch (SQLException s) {
			 s.printStackTrace();
			 return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	
	//신고 전체수
	public int getCount() { 
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		String sql = "select NVL(count(*),0) cnt from report"; 
	try {
		con = JdbcUtil.getCon();
		pstmt = con.prepareStatement(sql);
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


