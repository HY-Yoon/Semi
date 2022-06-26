package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;


public class Qa_HashTagDao {
	static public Qa_HashTagDao instance=new Qa_HashTagDao();
	public Qa_HashTagDao() {}
	static public Qa_HashTagDao getInstance() {
		return instance;
	}
	public int insertHash(int anum,String hashTag) { // 띄어쓰기로 구분된 해시태그 문자열 파라미터로 받아오기
		String hashList[]=hashTag.split(" "); // 파라미터로 받아온 문자열 띄어쓰기로 나눠서 배열 형태로 저장
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into hashtag_qa values(hashtag_qa_seq.nextval,?,?)"; 
		int n=0;
		try {
			con=JdbcUtil.getCon();
			for(int i=0;i<hashList.length;i++) { //for문 돌면서 받아온 해시태그 문자열 수만큼 db에 저장
				ps=con.prepareStatement(sql);
				ps.setInt(1, anum);
				ps.setString(2, hashList[i]);
				n+=ps.executeUpdate();
			}
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public ArrayList<String> select(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from (select * from hashtag_qa where anum=? order by rownum) where rownum<4"; 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			ArrayList<String> hlist=new ArrayList<String>();
			while(rs.next()) {
				hlist.add(rs.getString("htag"));
			}
			return hlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public ArrayList<String> selectAll(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from hashtag_qa where anum=?"; 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			System.out.println(4444);
			ArrayList<String> hlist=new ArrayList<String>();
			while(rs.next()) {
				hlist.add(rs.getString("htag"));
				System.out.println("htag");
			}
			return hlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public int delete(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="delete from hashtag_qa where anum=?";
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
	public int update(int anum, String htag) {
		int deln=delete(anum);
		if(deln>0) {
			int n=insertHash(anum,htag);
			return n;
		}
		return -1;
	}
}
