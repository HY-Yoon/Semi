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
	public int getMaxAnum() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select NVL(max(anum),0) maxbnum from board_qa"; //새글이 아예 없을 때 0을 리턴함 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				int maxA=rs.getInt(1);
				return maxA;
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,rs);
		}
	}
	public int insertQa(Qa_BoardVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into board_qa values(?,?,?,?,?,?,sysdate,?)";
		try {
			con=JdbcUtil.getCon();
			int anum=getMaxAnum()+1; //글번호를 1부터 순차적으로 등록하기 위해 사용 
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			ps.setInt(2, vo.getMnum());
			ps.setString(3, vo.getNick());
			ps.setString(4, vo.getTitle());
			ps.setString(5, vo.getKeyword());
			ps.setString(6, vo.getContent());
			ps.setInt(7,vo.getViews());
			ps.executeUpdate();
			return anum;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,null);
		}
	}
	public int getCountRow() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select NVL(count(anum),0) cnt from board_qa"; 
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				int cnt=rs.getInt(1);
				return cnt;
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,rs);
		}
	}
	public Qa_BoardVo select(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select z.*, to_char(z.regdate, 'YYYY-MM-DD HH:MI:SS')systime from( "
				+ "select * from board_qa)z "
				+ "where anum=?";
		try {
			con=JdbcUtil.getCon();
			ps=con.prepareStatement(sql);
			ps.setInt(1, anum);
			rs=ps.executeQuery();
			if(rs.next()) {
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString("systime"),rs.getInt(8));
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
	public int updateView(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="update board_qa set views=views+1 where anum=?";
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
			JdbcUtil.close(con,ps,rs);
		}
	}
	public int detailViews(int anum) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select views from board_qa where anum=?";
		try {
			con=JdbcUtil.getCon();
			int n=updateView(anum);
			if(n>0) {
				ps=con.prepareStatement(sql);
				ps.setInt(1, anum);
				rs=ps.executeQuery();
				if(rs.next()) {
					int viewNum=rs.getInt(1);
					return viewNum;
				}
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,ps,rs);
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
	//sysdate에서 시간을 꺼내오고 content는 태그제외 100자까지의 문자열만 갖는 vo객체를 리스트로 반환
	public ArrayList<Qa_BoardVo> bList1(int startRow,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=JdbcUtil.getCon();
		try {
			String sql="select * from ( "
					+ "    select b.*, rownum rn from ( "
					+ "    select z.*, to_char(z.regdate, 'YYYY-MM-DD HH:MI:SS')systime "
					+ "    from (select * from board_qa) z order by systime desc "
					+ "    )b "
					+ "    ) where rn>=? and rn<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<Qa_BoardVo> list=new ArrayList<Qa_BoardVo>();
			while(rs.next()) {
				// html 태그 제외하고 한줄로 출력하는 정규식 사용
				String content=rs.getString("content").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","").
						replaceAll("\r|\n|&nbsp;","");
				if(content.length()>100) {content.substring(0,100);};
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						content,rs.getString("systime"),rs.getInt(8));
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
	public ArrayList<Qa_BoardVo> bList2(int startRow,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=JdbcUtil.getCon();
		try {
			String sql="select * from ( "
					+ "    select b.*, rownum rn from ( "
					+ "    select z.*, to_char(z.regdate, 'YYYY-MM-DD HH:MI:SS')systime, "
					+ "    NVL(to_char(z.cd, 'YYYY-MM-DD HH:MI:SS'),0)cdtime "
					+ "    from (select b.*, c.regdate cd "
					+ "    from board_qa b left outer join comm_qa c on b.anum=c.anum)z "
					+ "    order by cd desc "
					+ "    )b "
					+ "    ) where rn>=? and rn<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<Qa_BoardVo> list=new ArrayList<Qa_BoardVo>();
			while(rs.next()) {
				// html 태그 제외하고 한줄로 출력하는 정규식 사용
				String content=rs.getString("content").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","").
						replaceAll("\r|\n|&nbsp;","");
				if(content.length()>100) {content.substring(0,100);};
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						content,rs.getString("systime"),rs.getInt(8));
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
	public ArrayList<Qa_BoardVo> bList3(int startRow,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=JdbcUtil.getCon();
		try {
			String sql="select * from ( "
					+ "    select b.*, rownum rn from ( "
					+ "    select z.*, to_char(z.regdate, 'YYYY-MM-DD HH:MI:SS')systime "
					+ "    from (select b.*, c.sel sel "
					+ "    from board_qa b inner join comm_qa c on b.anum=c.anum where sel='N' "
					+ "    order by systime desc)z "
					+ "    )b "
					+ "    ) where rn>=? and rn<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<Qa_BoardVo> list=new ArrayList<Qa_BoardVo>();
			while(rs.next()) {
				// html 태그 제외하고 한줄로 출력하는 정규식 사용
				String content=rs.getString("content").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","").
						replaceAll("\r|\n|&nbsp;","");
				if(content.length()>100) {content.substring(0,100);};
				Qa_BoardVo vo=new Qa_BoardVo(rs.getInt(1),rs.getInt(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						content,rs.getString("systime"),rs.getInt(8));
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
}
