package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.JdbcUtil;
import vo.Expert_commVo;


public class Expert_commDao {
	//------------댓글추가
	public int insert(Expert_commVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
				
		String sql = "insert into comm_expert values(SEQ_ECOMM.nextval,?,?,?,sysdate,?,?,?)";
		//insert into comm_expert values(seq_ecomm.nextval,166,22,'test',sysdate,0,0,0);
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,vo.getAnum());
		pstmt.setInt(2,vo.getMnum());
		pstmt.setString(3, vo.getContent());
		pstmt.setInt(4,vo.getRef());
		pstmt.setInt(5,vo.getLev());
		pstmt.setInt(6,vo.getStep());
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
	
}
	//-----------------댓글 목록-------------------------
		public ArrayList<Expert_commVo> list(int anum){
			Connection con = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			try {
				con = JdbcUtil.getCon();
				//String sql="select * from comm_expert where anum=? ";
				String sql = "select nick,e.* from comm_expert e,member m where e.mnum= m.mnum and anum=?";
				pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, anum);
				rs  = pstmt.executeQuery();
				
				ArrayList<Expert_commVo> list = new ArrayList<Expert_commVo>();
				while(rs.next()) {
					int mnum = rs.getInt("mnum");
					int cnum = rs.getInt("cnum");
					String nick = rs.getString("nick");
					String content = rs.getString("content");
					Date regdate = rs.getDate("regdate");
					int ref = rs.getInt("ref");
					int lev = rs.getInt("lev");
					int step = rs.getInt("step");
					Expert_commVo vo = new Expert_commVo(cnum,anum,mnum,content,regdate,ref,lev,step,nick);
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
		//---------------댓글삭제----------------
		public int delete(int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			con = JdbcUtil.getCon();
		try {
			String sql = "delete from comm_expert where anum=?";
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

