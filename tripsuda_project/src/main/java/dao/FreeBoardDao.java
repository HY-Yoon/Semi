package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import db.JdbcUtil;
import vo.FreeBoardVo;

public class FreeBoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
    public static FreeBoardDao instance=null;;
	
	public FreeBoardDao(){}
	public static FreeBoardDao getInstance(){
		if(instance==null)
			instance=new FreeBoardDao();
		return instance;
	}
	
	// 글의 개수를 가져오는 메서드
		 public int getBoardListCount(String field, String query) {
		    	
		    	int count = 0; //게시글 갯수 초기값
		    	
		    	String sql = "select count(nick) count from ("
		    			+ "   select rownum anum, n.* from"
		    			+ "  (select * from board_free where "+field+" like '%'||?||'%' "
		    					+ " order by regdate desc) n"
		    			+ "    ) ";
				
				con = JdbcUtil.getCon();
				
				
				try {
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, query);
		    		 rs = pstmt.executeQuery();
		    		 
		    		 if(rs.next()) count = rs.getInt("count");   
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				close();
				return count;
			} // end getBoardListCount
			
			
			// 글목록 가져오기
		    public List<FreeBoardVo> getBoardList(String field, String query, int page){
		    	List<FreeBoardVo> list = new ArrayList<>();
		    	con = JdbcUtil.getCon();
		    	
		    	String sql = "select * from ("
		    			+ "   select rownum cnum, n.* from"
		    			+ "  (select * from board_free where "+field+" like ? order by regdate desc) n"
		    			+ ") "
		    			+ "where cnum between ? and ?";
		    	
		    	// 1 , 11, 21, 31,... -> an = 1+(page-1)*10
		    	// 10, 20, 30, 40 -> page*10
		    	
		    	try {
		    	   pstmt=con.prepareStatement(sql);
		    		 
		  		   pstmt.setString(1, "%"+query+"%");
		  		   pstmt.setInt(2, 1+(page-1)*10);
		  		   pstmt.setInt(3, page*10);
		  		   
		  		   rs = pstmt.executeQuery();
		  		   
		  		   while(rs.next()){
		  			   int anum=rs.getInt("anum");
		  			   String id=rs.getString("id");
		 			   String nick = rs.getString("nick");
		 		       String title = rs.getString("TITLE"); 
		 		       String content = rs.getString("CONTENT");
		 		       Date regdate = rs.getDate("REGDATE"); 
		 		       String orgfile = rs.getString("orgfile");
		 		       String serverfile = rs.getString("serverfile");
		 		       int views = rs.getInt("views");
		 		   
		 		       FreeBoardVo board = new FreeBoardVo(
		 				   anum,
		 				   id,
		 				   nick,
		 				   title,
		 				   content,
		 				   regdate,
		 				   orgfile,
		 				   serverfile,
		 				   views
		 				   );
		 		       
		 		       list.add(board);
		 		   }
		    	} catch (SQLException e) {
	 	 	     	// TODO Auto-generated catch block
	 	 		    e.printStackTrace();
	 	     	}
		    	
		    	close();
	 		    return list;	
		    	
		    }// end getBoardList
		
		
		public FreeBoardVo getDetail(int anum){	
			
			FreeBoardVo board =  new FreeBoardVo();
			con = JdbcUtil.getCon();
			String sql="select * from board_free where anum = ?";
			try {
				
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, anum);
				
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					board.setAnum(anum);
					board.setId(rs.getString("id"));
					board.setNick(rs.getString("nick"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getDate("regdate"));
					board.setOrgFile(rs.getString("orgfile"));
					board.setServerFile(rs.getString("serverfile"));
					board.setViews(rs.getInt("views"));
				}
				
				
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
			close();
			return board;
		} // end getDetail()
		
		    // 조회수 증가
			public boolean updateCount(int anum){
				boolean result = false;
				String sql = "update board_free set views = views+1 where anum = ? ";
				con = JdbcUtil.getCon();
				
				try {
					pstmt = con.prepareStatement(sql);
					// 자동 커밋을 false로 한다.
					con.setAutoCommit(false);

					pstmt.setInt(1, anum);
					
					int n = pstmt.executeUpdate();
					if(n > 0){
						result = true;
						con.commit(); // 완료시 커밋
					}	
					
				} catch(SQLException e) {
					e.printStackTrace(); 
				}catch (Exception e) {
					try {
						con.rollback(); // 오류시 롤백
					} catch (SQLException s) {
						s.printStackTrace();
					}
					throw new RuntimeException(e.getMessage());
				}
				close();
				return result;
			} // end updateCount
			
			// 글 등록 > int 고려
			public boolean boardInsert(FreeBoardVo vo){
				
				boolean result = false;
				con = JdbcUtil.getCon();
				String sql = "insert into board_free(anum,id,nick,title,content,regdate,orgfile,serverfile) "
						+ "values(fanum_seq.nextval,?,?,?,?,sysdate,?,?)";
				
				try {
					
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, vo.getId());
					pstmt.setString(2, vo.getNick());
					pstmt.setString(3, vo.getTitle());
					pstmt.setString(4, vo.getContent());
					pstmt.setString(5, vo.getOrgFile());
					pstmt.setString(6, vo.getServerFile());

					int n = pstmt.executeUpdate();
					if(n > 0){
						result = true;
					
					}
					
				} catch (Exception e) {
					
					e.printStackTrace();
					
				}
				
				close();
				return result;	
			} // end boardInsert();
			
			// 게시글 삭제
			public int deleteBoard(int anum) {
				con = JdbcUtil.getCon();
				String sql = "DELETE FROM board_free WHERE anum = ?";
				int result = 0;
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, anum);
					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				close();
				return result;
			} // end deleteBoard
			
			// 글 수정
			public int updateBoard(FreeBoardVo board) {
				con = JdbcUtil.getCon();
				String sql = "UPDATE board_free SET title = ?, "
				        +  "content = ? , orgFile = ? , serverFile = ? WHERE anum = ?";
				int result = 0;
				try {
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, board.getTitle());
					pstmt.setString(2, board.getContent());
					pstmt.setString(3, board.getOrgFile());
					pstmt.setString(4, board.getServerFile());
					pstmt.setInt(5, board.getAnum());
					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				close();
				return result;
			} // end updateBoard
			

			//작성자 확인
			public boolean isBoardWriter(int anum, String id) {
				con = JdbcUtil.getCon();
				String sql = "SELECT * FROM board_free WHERE anum = ?";
				boolean result = false;
				try {
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, anum);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						if(id.equals(rs.getString("id"))) {
							result = true;
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				close();
				return result;
			} //isBoardWriter()
			
			
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
