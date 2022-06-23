package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

public class Qa_LocalTagDao {
	static public Qa_LocalTagDao instance=new Qa_LocalTagDao();
	public Qa_LocalTagDao() {}
	static public Qa_LocalTagDao getInstance() {
		return instance;
	}
	public int insert(int anum,String ltag) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into localtag_qa values(localtag_qa_seq.nextval,?,?)";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			ps.setString(2, ltag);
			int n=ps.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public String select(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select a.anum, l.ltag from "
				+ "board_qa a inner join localtag_qa l "
				+ "on a.anum=l.anum where a.anum=?"; 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			if(rs.next()) {
				String ltag=rs.getString(2);
				return ltag;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
}
