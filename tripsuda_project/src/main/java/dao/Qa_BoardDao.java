package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.Qa_BoardVo;

public class Qa_BoardDao {
	public static Qa_BoardDao instance=new Qa_BoardDao();
	public Qa_BoardDao() {}
	public static Qa_BoardDao getInstance() {
		return instance;
	}
	public int insertQa(Qa_BoardVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into board_qa values(board_qa_seq.nextval,?,?,?,?,?,sysdate,?)";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getMnum());
			ps.setString(2, vo.getNick());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getKeyword());
			ps.setString(5, vo.getContent());
			ps.setInt(6,vo.getViews());
			int n=ps.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public ArrayList<Qa_BoardVo> listA(){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from board_qa";
		ArrayList<Qa_BoardVo> list=new ArrayList<Qa_BoardVo>();
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getDate(7),rs.getInt(8));
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
	public Qa_BoardVo viewContent(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from board_qa where anum=?";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			if(rs.next()) {
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getDate(7),rs.getInt(8));
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public int contentUpdate(Qa_BoardVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="update board_qa set title=?,content=? where anum=?";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getAnum());
			int n=ps.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public int deleteB(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="delete from board_qa where anum=?";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			int n=ps.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public ArrayList<Qa_BoardVo> bList(int startRow,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=JdbcUtil.getCon();
		try {
			String sql="select * from("
					+ " select com.*,rownum rnum from ("
					+ "  select * from board_qa order by regdate desc"
					+ "  ) com"
					+ " ) where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<Qa_BoardVo> list=new ArrayList<Qa_BoardVo>();
			while(rs.next()) {
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getDate(7),rs.getInt(8));
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int getCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=JdbcUtil.getCon();
		try {
			String sql="select nvl(count(*),0) from comments";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
