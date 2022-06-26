package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.FreeBoardVo;
import vo.PartyboardVo;
import vo.Qa_BoardVo;
import vo.reviewboard.ReviewBoardVo;

public class MypageDao {
	private static MypageDao instance = new MypageDao();
	private MypageDao() {}
	public static MypageDao getInstance() {
		return instance;
	}
	
	//후기게시판 
	public ArrayList<ReviewBoardVo> myreview(int mnum,int start,int end){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
	try {
		con = JdbcUtil.getCon();
		String  sql =	"select * from ( "
						+"select aa.*, rownum rnum from("
						+" select * from board_review where mnum = ? ) aa"
						+") where rnum >=? and rnum <=? ";
										
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs  = pstmt.executeQuery();
			
			ArrayList<ReviewBoardVo> list = new ArrayList<ReviewBoardVo>();
			while(rs.next()) {
				int anum = rs.getInt("anum");
				String title = rs.getString("title");
				Date regdate = rs.getDate("regdate");
				ReviewBoardVo vo = new ReviewBoardVo(anum,mnum,title,null,regdate,0,null,null,null);
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
	//-------후기 게시판 작성글 수 --------
			public int myreviewCount(int mnum) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;			
				con = JdbcUtil.getCon();
			try {
				String sql = "select nvl(count(*),0) cnt from board_review where mnum=?";
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
	
	//--------------------자유-------------------------
			//자유게시판 
			public ArrayList<FreeBoardVo> myfree(int mnum,int start,int end){
				Connection con = null;
				PreparedStatement pstmt =null;
				ResultSet rs = null;
			try {
				con = JdbcUtil.getCon();
				String  sql =	"select * from ( "
								+"select aa.*, rownum rnum from("
								+" select * from board_free where mnum = ? ) aa"
								+") where rnum >=? and rnum <=? ";
												
					pstmt =con.prepareStatement(sql);
					pstmt.setInt(1, mnum);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
					rs  = pstmt.executeQuery();
					
					ArrayList<FreeBoardVo> list = new ArrayList<FreeBoardVo>();
					while(rs.next()) {
						int anum = rs.getInt("anum");
						String title = rs.getString("title");
						Date regdate = rs.getDate("regdate");
						FreeBoardVo vo = new FreeBoardVo(anum,mnum,null,null,title,null,null,regdate,null,null,0);
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
			//-------자유 게시판 작성글 수 --------
					public int myfreeCount(int mnum) {
						Connection con = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;			
						con = JdbcUtil.getCon();
					try {
						String sql = "select nvl(count(*),0) cnt from board_free where mnum=?";
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
		//--------------------동행-------------------------
		//동행게시판 
		public ArrayList<PartyboardVo> myparty(int mnum,int start,int end){
			Connection con = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
		try {
				con = JdbcUtil.getCon();
						String  sql =	"select * from ( "
										+"select aa.*, rownum rnum from("
										+" select * from board_party where mnum = ? ) aa"
										+") where rnum >=? and rnum <=? ";
														
							pstmt =con.prepareStatement(sql);
							pstmt.setInt(1, mnum);
							pstmt.setInt(2, start);
							pstmt.setInt(3, end);
							rs  = pstmt.executeQuery();
							
							ArrayList<PartyboardVo> list = new ArrayList<PartyboardVo>();
							while(rs.next()) {
								long anum = rs.getLong("anum");
								String title = rs.getString("title");
								Date regDate = rs.getDate("regDate");
								PartyboardVo vo = new PartyboardVo(anum,mnum,title,regDate);
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
		
					//-------동행 게시판 작성글 수 --------
							public int mypartyCount(int mnum) {
								Connection con = null;
								PreparedStatement pstmt = null;
								ResultSet rs = null;			
								con = JdbcUtil.getCon();
							try {
								String sql = "select nvl(count(*),0) cnt from board_party where mnum=?";
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
			
							//--------------------qna-------------------------
							//qna게시판 
							public ArrayList<Qa_BoardVo> myqna(int mnum,int start,int end){
								Connection con = null;
								PreparedStatement pstmt =null;
								ResultSet rs = null;
							try {
									con = JdbcUtil.getCon();
											String  sql =	"select * from ( "
															+"select aa.*, rownum rnum from("
															+" select * from board_qa where mnum = ? ) aa"
															+") where rnum >=? and rnum <=? ";
																			
												pstmt =con.prepareStatement(sql);
												pstmt.setInt(1, mnum);
												pstmt.setInt(2, start);
												pstmt.setInt(3, end);
												rs  = pstmt.executeQuery();
												
												ArrayList<Qa_BoardVo> list = new ArrayList<Qa_BoardVo>();
												while(rs.next()) {
													int anum = rs.getInt("anum");
													String title = rs.getString("title");
													String regdate = rs.getString("regdate");
													Qa_BoardVo vo = new Qa_BoardVo(anum,mnum,title,regdate);
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
							
										//-------qna 게시판 작성글 수 --------
												public int myqnaCount(int mnum) {
													Connection con = null;
													PreparedStatement pstmt = null;
													ResultSet rs = null;			
													con = JdbcUtil.getCon();
												try {
													String sql = "select nvl(count(*),0) cnt from board_qna where mnum=?";
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
