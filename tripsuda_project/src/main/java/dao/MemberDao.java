package dao;

import java.math.BigDecimal; 
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.JdbcUtil;
import oracle.jdbc.OracleConnection;
import vo.ChatVo;
import vo.MemberVo;
import vo.PointVo;

public class MemberDao
{
	private static MemberDao instance = null;
	public static MemberDao getInstance()
	{
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}
	public MemberDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	//220624 혜인 관리자페이지 회원관리를 위한 메소드 추가
	public int updateMemInfoAdmin(int mnum, Date stop, String withdraw)
	{
		int n=-1;
		Connection con= null;
		PreparedStatement pstmt= null;
		String sql="update member set stop =? , withdraw = ? where mnum = ?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setDate(1, stop);
			pstmt.setString(2, withdraw);
			pstmt.setInt(3, mnum);
			n=pstmt.executeUpdate();
		} catch (SQLException e) {
			 e.printStackTrace();
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}
	
	
	/**
	 * 220622 - 주현
	 */
	public MemberVo select(long mnum)
	{
		String sql = "select * from member where mnum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, mnum);
			ResultSet rs = pstmt.executeQuery();
			MemberVo vo = null;
			if (rs.next())
			{
				vo = new MemberVo(
					rs.getLong("mnum"),
					rs.getString("id"),
					rs.getString("pwd"),
					rs.getString("name"),
					rs.getString("nick"),
					rs.getString("phone"),
					rs.getString("birth"),
					rs.getString("withdraw"),
					rs.getString("favorite"),
					rs.getString("grade"),
					rs.getDate("stop"));
			}
			rs.close();
			return vo;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public MemberVo select(String id, String pwd)
	{
		String sql = "select * from member where id = ? and pwd = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			MemberVo vo = null;
			if (rs.next())
			{
				vo = new MemberVo(
					rs.getLong("mnum"),
					rs.getString("id"),
					rs.getString("pwd"),
					rs.getString("name"),
					rs.getString("nick"),
					rs.getString("phone"),
					rs.getString("birth"),
					rs.getString("withdraw"),
					rs.getString("favorite"),
					rs.getString("grade"),
					rs.getDate("stop"));
			}
			rs.close();
			return vo;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	//------------June-------
	public int selAnum(String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select mnum from member where nick=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, nick);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int mnum = rs.getInt("mnum");
			return mnum ;
		}
		return -1;
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	
	//---------------6.23연희 수정(회원번호도 vo에 받아서 넣기)
	//---------------HEE 
	//------------------6/23혜인 수정(vo에 mnum 추가)
	//마이페이지에서 로그인시 정보 확인
	public MemberVo getUserInfo(String id) {

		MemberVo vo = new MemberVo();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();
		String sql = "select * from member where id=?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setMnum(rs.getLong("mnum"));
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNick(rs.getString("nick"));
				vo.setPhone(rs.getString("phone"));
				vo.setBirth(rs.getString("birth"));
				System.out.println(rs.getString("birth"));
				vo.setFavorite(rs.getString("favorite"));
				vo.setGrade(rs.getString("grade"));
				vo.setMnum(rs.getInt("mnum"));
			}

			con.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;

	}

	//------------회원 등업--------
	public int updateGrade(int mnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();
	try {
		String sql = "update member set grade='전문가' where mnum = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,mnum);
		return pstmt.executeUpdate();
				
	}catch (SQLException s) {
		 s.printStackTrace();
		 return -1;
	}finally {
		JdbcUtil.close(con, pstmt, null);
	}
}


	
	//JoinFormController 가입
	public int insertMember(MemberVo dto) {

		String sql = "insert into member(mnum,id,pwd,name,nick,phone,birth,favorite) "
				+ "values(NUM_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		con = JdbcUtil.getCon();

		try {

			pstmt = con.prepareStatement(sql);
			

			pstmt.setString(1, dto.getId());
	
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNick());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getBirth());
			pstmt.setString(7, dto.getFavorite());  //selected

			int n = pstmt.executeUpdate();
			pstmt.close();
			con.close();
			return n;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;  //에러 났을 때 확인 
		}
	
	}
	
	//LoginForm - 아이디 중복 확인 ,CheckidForm 사용 > 구현 완료시 삭제하기 
	public int duplicateIdcheck(String id) {
		int result = 0;

		String sql = "select id from member where id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 0; // 이미 아이디가 존재하는 경우
			} else {
				result = 1; // 아이디가 중복되지 않을 경우
			}

			con.close();
			pstmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}
	
	//LoginForm - 로그인 메소드
	public int loginCheck(String id, String pwd) {
		
		String sql = "select pwd from member where id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();
        String dbpwd = "";
        int n = -1;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id); //id를 입력했을 때 dbpwd 얻음
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpwd = rs.getString("pwd");  //id와 일치하는 비밀번호 가져오기
				if(dbpwd.equals(pwd)) n = 1; //내가 입력한 비번(메소드)과 비밀번호 맞는 경우
				else n = -1;  //비밀번호 틀린 경우 원래 따로 했었는데 > 아이디와 비번을 확인하세요로 !
			} else {
				n = -1; //아이디가 틀린 경우
			}
			
			con.close();
			pstmt.close();
			rs.close();
			}catch (SQLException e) {
		     	// TODO Auto-generated catch block
			    e.printStackTrace();
	    	}
		return n;
	}
	
	// FindIdForm -아이디 찾기, 이름/비번 입력시 아이디 찾기 가능 >삭제예정
	public String findId(String name, String phone) { // 각각의 입력값
		String id = null;
		String sql = "select id from member where name=? and phone=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, name); // 순서대로 name, phone을 넣겠다
			pstmt.setString(2, phone);

			rs = pstmt.executeQuery();

			if (rs.next())
				id = rs.getString("id"); // 맞춰 찾은 id
			
			con.close();
			pstmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	//비번 찾기 - 아이디/이름/전화번호 입력시  > 구현 완료시 삭제하기 
	public String findPwd(String id ,String name, String phone) {
		
		String pwd = null;
		String sql = "select pwd from member where id=? name=? and phone=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) pwd = rs.getString("pwd");
			
			con.close();
			pstmt.close();
			rs.close();
			
		}catch (SQLException e) {
	     	// TODO Auto-generated catch block
		    e.printStackTrace();
    	}
		return pwd;
	}
	
	//회원 탈퇴하기, 아이디/비번 확인 후 탈퇴 진행시킴
	public int deleteMember(String id, String pwd) {
		
		String sql1 = "select pwd from member where id=?"; //비번 조회용
		String sql2 = "delete from member where id=?"; //외원 삭제용
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = JdbcUtil.getCon();

	    String dbpwd = ""; // DB상의 비밀번호를 담아둘 변수
	    int x = -1;

	    try {

		    // 자동 커밋을 false로 한다.
			con.setAutoCommit(false);
				
			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpwd = rs.getString("pwd");
				if (dbpwd.equals(pwd)) // 입력된 비밀번호와 DB비번 비교
				{
					// 같을경우 회원삭제 진행
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					con.commit(); 
					x = 1; // 삭제 성공
				} else {
					x = 0; // 비밀번호 비교결과 - 다름
				}
			}

			con.close();
			pstmt.close();
			rs.close();

			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch(Exception sql) {
				try {
					con.rollback(); //오류시 롤백
				}catch (SQLException e) {
			     	// TODO Auto-generated catch block
				    e.printStackTrace();
	    	}
			}
		return x;

}
	
	//회원 정보 수정하기	
	public void updateMember(MemberVo vo) {	
			
		String sql="update member set pwd=?,nick=?,phone=?,favorite=? where id=?";	
		Connection con = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		con = JdbcUtil.getCon();	
			
		try {	
		    // 자동 커밋을 false로 한다.	
		    con.setAutoCommit(false);	
		    pstmt = con.prepareStatement(sql);	
		    	
		    pstmt.setString(1, vo.getPwd());	
		    pstmt.setString(2, vo.getNick());	
		    pstmt.setString(3, vo.getPhone()); 	
		    pstmt.setString(4, vo.getFavorite());	
		    pstmt.setString(5, vo.getId());	
		    	
		    int n = pstmt.executeUpdate();	
		    if(n>0) con.commit(); //업데이트 완료시 commit	
		    	
		    con.close();	
			pstmt.close();	
				
		}catch (SQLException e) {	
			// TODO Auto-generated catch block	
			e.printStackTrace();	
		}catch (Exception s) {	
				try {	
					con.rollback();	
				} catch (SQLException e) {	
					// TODO Auto-generated catch block	
					e.printStackTrace();	
				} // 오류시 롤백	
				throw new RuntimeException(s.getMessage());	
			} 	
		    	
		}	
		

		
	
	
	public String nickname(String id) {	
		Connection con = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		con = JdbcUtil.getCon();	
		String sql = "select nick from member where id=?";	
		String nick="";	
		try {	
			pstmt = con.prepareStatement(sql);	
				
			pstmt.setString(1, id);	
				
			rs = pstmt.executeQuery();	
			if(rs.next()) nick = rs.getString("nick");	
				
			con.close();	
			pstmt.close();	
			rs.close();	
		}catch (SQLException e) {	
			// TODO Auto-generated catch block	
			e.printStackTrace();	
		}return nick;	
			
	}
	
	//신고자, 피신고자 아이디 구하기
	public String whatId(int mnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		String sql = "select id from member where mnum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, mnum);
		rs = pstmt.executeQuery();
			rs.next(); 
			String id = rs.getString("id");
			return id;
					
	}catch (SQLException s) {
		 s.printStackTrace();
		 return null;
	}finally {
		JdbcUtil.close(con, pstmt, rs);
	}
}
	//kj 회원수
	public int getCount(String YN,String select,String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		con = JdbcUtil.getCon();
	try {
		//기본
		String sql = "select nvl(count(*),0) cnt from member where withdraw = ?";
				
				if(select!=null && !select.equals("")) { //검색했을때
					
				sql += " and "+select +" like '%"+search+"%'" ;
				
				}	
				
					
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, YN);
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
	
	//kj 회원 전체 조회(탈퇴여부Y/N)
	public ArrayList<MemberVo> Memberlist(String YN,String select,String search,int start,int end){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
	try {
		con = JdbcUtil.getCon();
		String sql = "";
											
				if(select!=null && !select.equals("")) { //검색했을때
							sql =	"select * from ( "
								   + " select aa.*, rownum rnum from ( "
								   + " select * from member where withdraw = ? and "
								   + select+" like '%"+search+"%' order by name asc) aa "
								   +" ) where rnum >= ? and rnum <= ? ";
			
					}else{
							sql =	"select * from ( "
							   + " select aa.*, rownum rnum from ( "
							   + " select * from member where withdraw = ? order by name asc) aa "
							   +" ) where rnum >= ? and rnum <= ? ";
					}
				
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, YN);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs  = pstmt.executeQuery();
			
			ArrayList<MemberVo> list = new ArrayList<MemberVo>();
			while(rs.next()) {
				int mnum = rs.getInt("mnum");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String nick = rs.getString("nick");
				String phone = rs.getString("phone");
				String birth = rs.getString("birth");
				String withdraw = rs.getString("withdraw");
				String favorite = rs.getString("favorite");
				String grade = rs.getString("grade");
				Date stop = rs.getDate("stop");
								
				MemberVo vo = new MemberVo(mnum,id,pwd,name,nick,phone,birth,withdraw,favorite,grade,stop);
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
	
	
	
	
	
}
