package dao;

import java.sql.Connection;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.FreeCommVo;

import java.sql.*;

public class FreeCommDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static FreeCommDao instance;
	
	public FreeCommDao(){}
	public static FreeCommDao getInstance(){
		if(instance==null)
			instance=new FreeCommDao();
		return instance;
	}
	
	 // 댓글 목록 가져오기
	public ArrayList<FreeCommVo> getCommentList(int anum) {
		ArrayList<FreeCommVo> list = new ArrayList<FreeCommVo>();
		String sql="select * from comm_free where anum=?";
		con = JdbcUtil.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, anum);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				FreeCommVo comment = new FreeCommVo();
				
				comment.setCnum(rs.getInt("cnum"));
				comment.setAnum(rs.getInt("anum"));
				comment.setMnum(rs.getInt("mnum"));
				comment.setId(rs.getString("id"));
				comment.setNick(rs.getString("nick"));
				comment.setContent(rs.getString("content"));
				comment.setRegdate(rs.getDate("regdate"));
				comment.setLev(rs.getInt("lev"));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
        close();
		return list;
	} // end getCommentList
	
	// 댓글 등록
	public boolean insertComment(FreeCommVo comment){
		con = JdbcUtil.getCon();
		boolean result = false;
		String sql = "insert into comm_free(cnum,nick,content,regdate) values(fcnum_seq.nextval, ?, ?, sysdate)";
		
		try {
	
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, comment.getNick());
			System.out.println(comment.getNick());
			pstmt.setString(2, comment.getContent());

			int n = pstmt.executeUpdate();
			if(n > 0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		close();
		return result;	
	} // end insertComment();	
	
	
//	public boolean deleteComment(int comment_num) 
//	{
//		boolean result = false;
//
//		try {
//			conn = DBConnection.getConnection();
//			conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
//
//			StringBuffer sql = new StringBuffer();
//			sql.append("DELETE FROM BOARD_COMMENT");
//			sql.append(" WHERE COMMENT_NUM IN");
//			sql.append(" (SELECT COMMENT_NUM");
//			sql.append(" FROM BOARD_COMMENT");
//			sql.append(" START WITH COMMENT_NUM = ?");
//			sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) ");
//			
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, comment_num);
//			
//			int flag = pstmt.executeUpdate();
//			if(flag > 0){
//				result = true;
//				conn.commit(); // 완료시 커밋
//			}	
//			
//		} catch (Exception e) {
//			try {
//				conn.rollback(); // 오류시 롤백
//			} catch (SQLException sqle) {
//				sqle.printStackTrace();
//			}
//			throw new RuntimeException(e.getMessage());
//		}
//
//		close();
//		return result;
//	} // end deleteComment	
//	
	
	//연결 종료
			public void close() {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} //close()
}