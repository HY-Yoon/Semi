package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.Qa_CommVo;

public class Qa_CommDao {
	static public Qa_CommDao instance=new Qa_CommDao();
	public Qa_CommDao() {}
	static public Qa_CommDao getInstance() {
		return instance;
	}
	public int getMaxCnum() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select NVL(max(cnum),0) maxcnum from comm_qa"; //새글이 아예 없을 때 0을 리턴함 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				int maxC=rs.getInt(1);
				return maxC;
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,rs);
		}
	}
	public int insert(Qa_CommVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into comm_qa values(?,?,?,?,sysdate,?,?,?)";
		try {
			con=JdbcUtil.getCon();
			int nCnum=getMaxCnum()+1; //글번호를 1부터 순차적으로 등록하기 위해 사용 
			int cnum=vo.getCnum();
			int ref=vo.getRef();
			int lev=vo.getLev();
			if(cnum==0) {//새 댓글일 때
				ref=nCnum;
			}else { //대댓글일 때
				lev+=1;
			}
			ps=con.prepareStatement(sql);
			ps.setInt(1, nCnum);
			ps.setInt(2, vo.getAnum());
			ps.setInt(3, vo.getMnum());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getRef());
			ps.setInt(6, vo.getLev());
			ps.setString(7, vo.getSel());
			int n=ps.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public int commcnt(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select NVL(count(cnum),0) from comm_qa where anum=?"; //새글이 아예 없을 때 0을 리턴함 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1,anum);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
				
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,rs);
		}
	}
	public ArrayList<Qa_CommVo> select(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select z.*, to_char(z.regdate, 'YYYY-MM-DD HH:MI:SS')systime from( "
				+ "select * from comm_qa c inner join member m on c.mnum=m.mnum)z "
				+ "where anum=?"; 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			ArrayList<Qa_CommVo> list=new ArrayList<Qa_CommVo>();
			while(rs.next()) {
				Qa_CommVo vo=new Qa_CommVo(
						rs.getInt("cnum"),rs.getInt("anum"),rs.getInt("mnum"),
						rs.getString("nick"),rs.getString("content"),rs.getString("systime"),
						rs.getInt("ref"),rs.getInt("lev"),rs.getString("sel"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,ps,rs);
		}
	}

}
