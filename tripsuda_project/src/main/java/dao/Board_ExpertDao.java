package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.JdbcUtil;
import vo.Board_ExpertVo;
import vo.Expert_commVo;

public class Board_ExpertDao {
	
	private static Board_ExpertDao instance = new Board_ExpertDao();
	private Board_ExpertDao() {}
	public static Board_ExpertDao getInstance() {
		return instance;
	}
	
	//------------------게시글 추가---------------------------
	public int insert(Board_ExpertVo vo) {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();
	try {
		String sql1 = "insert into board_expert values(seq_Eboard.nextval,?,?,? "
				+ "	,?,?,sysdate,?,?,?,?)";
		pstmt1 = con.prepareStatement(sql1);
		pstmt1.setInt(1,vo.getMnum());
		pstmt1.setString(2, vo.getNick());
		pstmt1.setString(3, vo.getTitle());
		pstmt1.setString(4, vo.getKeyword());
		pstmt1.setString(5, vo.getContent());
		pstmt1.setString(6, vo.getOrgfile());
		pstmt1.setString(7, vo.getServerfile());
		pstmt1.setInt(8,vo.getViews());
		pstmt1.setString(9, vo.getNotice());
		
		if(pstmt1.executeUpdate()>0) {
			String sql2 = "select seq_eboard.currval anum from dual";
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			rs.next();
			int anum = rs.getInt("anum");
			return anum;
						
		}else {
			return -1;
		}
						
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		try {
			if(con!=null) con.close();
			if(pstmt1!=null) pstmt1.close();
			if(pstmt2!=null) pstmt2.close();
			if(rs!=null) rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
	//-----------------전체 글 개수(+검색기능 수정)-------------------------
	public int getCount(String select, String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();
	try {
		String sql = null;
			  //검색X
			if(select!=null && !select.equals("")) { //검색
				
				if(select.equals("tot")) { //통합
					sql  = 	"select nvl(count(*),0) cnt from("
							+ "select e.*,t.tag from board_expert e, tag_expert t where e.anum = t.anum )"
							+ "where tag like '%"+search+"%' or nick like '%"+search+"%' or title like '%"
							+ search +"%' or keyword like '%"+search+"%'";
					
				}else if(select.equals("tag")) { //태그
					sql  = "select NVL(count(e.anum),0) cnt from board_expert e, tag_expert t"
							+ " where tag like '%"+search+"%' and e.anum = t.anum";
									
					
				}else {       
					sql = "select NVL(count(e.anum),0) cnt from board_expert e "
							+"where "+select + " like '%" +search +"%'"; 
				}
							
			}else {
				 sql = "select NVL(count(e.anum),0) cnt from board_expert e ";
			}
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");			
			return cnt;
	
		}catch (SQLException s) {
			 s.printStackTrace();
			 return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//-----------------전체 게시글 목록(+검색기능)-------------------------
	
	public ArrayList<Board_ExpertVo> list(int start, int end,String select, String search){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
	try {
			con = JdbcUtil.getCon();
			String sql = null;
			
			if(select!=null && !select.equals("")) {
				if(select.equals("tot")) {
					sql =  "select * from ( "
						   +"select aa.*,rownum rnum from ( "
						   +" select e.*,t.tag from board_expert e, tag_expert t "
						   +" where e.anum=t.anum order by e.anum desc ) aa"
						   +" where tag like '%"+search+"%' or nick like '%"+search+"%'"
						   +" or title like '%"+search+"%' or keyword like '%"+search+"%'"
						   +" ) where rnum >=? and rnum <= ?";
				}
				else if(select.equals("tag")) {
					sql = "select * from ( "
						+ " select e.*, rownum rnum from board_expert e, tag_expert t "
						+ " where e.anum = t.anum and tag like '%"+search+"%' order by e.anum desc "
						+" ) where rnum >=? and rnum <=?";
				}
				else {
					sql = " select * from ("
						+ " select e.*, rownum rnum from board_expert e "
						+ " where "+select+ " like '%"+search+"%' order by e.anum desc "
						+" ) where rnum >=? and rnum <= ?";
				}
			}
			
			else {
				 sql =  "select * from("
				    	+"select aa.*,rownum rnum from("
				        +"select * from board_expert order by anum desc"
				        +" ) aa"
				        +") where rnum>=? and rnum<=?" ;
			}
				
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs  = pstmt.executeQuery();
			
			ArrayList<Board_ExpertVo> list = new ArrayList<Board_ExpertVo>();
			while(rs.next()) {
				int anum = rs.getInt("anum");
				int mnum = rs.getInt("mnum");
				String nick = rs.getString("nick");
				String title = rs.getString("title");
				String keyword = rs.getString("keyword");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");
				String orgfile = rs.getString("orgfile");
				String serverfile = rs.getString("serverfile");
				int views = rs.getInt("views");
				String notice = rs.getString("notice");
				Board_ExpertVo vo = new Board_ExpertVo(anum,mnum,nick,title,keyword,content,regdate,orgfile,serverfile,views,notice);
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
	//-------------조회수 업데이트----------
		public int update(int views, int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			con = JdbcUtil.getCon();
		try {
			String sql = "update board_expert set views = ? where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,views);
			pstmt.setInt(2,anum);
				
			return pstmt.executeUpdate();
					
		}catch (SQLException s) {
			 s.printStackTrace();
			 return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
	}
	//------------------select---------------------------
		public Board_ExpertVo select(int anum){
			Connection con = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			try {
				con = JdbcUtil.getCon();
				String sql="select * from board_expert where anum=?";
				pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, anum);
				rs  = pstmt.executeQuery();
								
				if(rs.next()) {
					int mnum = rs.getInt("mnum");
					String nick = rs.getString("nick");
					String title = rs.getString("title");
					String keyword = rs.getString("keyword");
					String content = rs.getString("content");
					Date regdate = rs.getDate("regdate");
					String orgfile = rs.getString("orgfile");
					String serverfile = rs.getString("serverfile");
					int views = rs.getInt("views");
					String notice = rs.getString("notice");
					Board_ExpertVo vo = new Board_ExpertVo(anum,mnum,nick,title,keyword,content,regdate,orgfile,serverfile,views,notice);
					return vo;
				}	
					return null;
				
			}catch (SQLException s) {
				 s.printStackTrace();
				 return null;
			}finally {
				JdbcUtil.close(con, pstmt, rs);
			}
			
		}
	//-------------게시판삭제---------
		public int delete(int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			con = JdbcUtil.getCon();
		try {
			String sql = "delete from board_expert where anum=?";
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
		
	//-------------추천10 넘는 게시글을 작성한 회원번호--------------
		public int reco10(int anum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;			
			con = JdbcUtil.getCon();
		try {
			String sql = "select mnum from board_expert where anum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			rs = pstmt.executeQuery();
			rs.next(); 
				int mnum = rs.getInt("mnum");
				return mnum;
			
			
		}catch (SQLException s) {
			 s.printStackTrace();
			 return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
		
	
}
