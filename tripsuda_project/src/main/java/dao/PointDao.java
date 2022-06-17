package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.Expert_commVo;
import vo.PointVo;

public class PointDao {
	
	public int insert(int mnum,String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "insert into point values(seq_point.nextval,?,?,sysdate,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,mnum);
		pstmt.setInt(2,1);
		pstmt.setString(3, content);
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
	
}
	//---------포인트10 넘는 회원번호 조회------
	public int get10Point() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select mnum from ( "
				     +" select mnum, count(*) cnt from point group by mnum"
				     +" ) where cnt > 10";
		
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		if(rs.next()) {
			int mnum = rs.getInt("mnum");
			return mnum ;
		}
		return -1;
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	
	//-----------------포인트 목록-------------------------
		public ArrayList<PointVo> Plist(int mnum,int start,int end){
				Connection con = null;
				PreparedStatement pstmt =null;
				ResultSet rs = null;
			try {
				con = JdbcUtil.getCon();
				String  sql =	"select * from ( "
								+"select aa.*, rownum rnum from("
								+" select * from point where mnum = ? order by pnum desc) aa"
								+") where rnum >=? and rnum <=? ";
												
					pstmt =con.prepareStatement(sql);
					pstmt.setInt(1, mnum);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
					rs  = pstmt.executeQuery();
					
					ArrayList<PointVo> list = new ArrayList<PointVo>();
					while(rs.next()) {
						int pnum = rs.getInt("pnum");
						int point = rs.getInt("point");
						Date pdate = rs.getDate("pdate");
						String content = rs.getString("content");
						PointVo vo = new PointVo(pnum, mnum, point, pdate, content);
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
		//-------포인트 수 --------
		public int getCount(int mnum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;			
			con = JdbcUtil.getCon();
		try {
			String sql = "select nvl(count(*),0) cnt from point where mnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, mnum);
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
