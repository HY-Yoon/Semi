package dao;

import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.json.JSONObject;

import db.JdbcUtil;
import vo.ChatroomVo;
import vo.PartyboardVo;

/**
 * @author 주현
 * 동행 구하기 게시판 DAO
 * member 테이블에 의존
 */
public class PartyBoardDao
{
	private static PartyBoardDao instance = null;
	public static PartyBoardDao getInstance()
	{
		if (instance == null)
			instance = new PartyBoardDao();
		return instance;
	}
	private PartyBoardDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	public int insert(PartyboardVo vo)
	{
		String sql = "insert into board_party values(board_party_seq.nextval,"
				+ "?, ?,"	// mnum, nick
				+ "?, ?, ?, ?, ?, ?, ?,"	// dest, gender, age~age, memcnt, date~date
				+ "?, ?, ?, ?,"				// backimage, title, content, tags
				+ "0, sysdate, \'N\')";		// views, regdate, expired
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, vo.getMnum());
			pstmt.setString(2, vo.getNick());
			pstmt.setString(3, vo.getDest());
			pstmt.setString(4, vo.getGender());
			System.out.println("[" + vo.getGender() + "]");
			pstmt.setLong(5, vo.getAge_min());
			pstmt.setLong(6, vo.getAge_max());
			pstmt.setLong(7, vo.getMemcnt());
			pstmt.setDate(8, vo.getStartDate());
			pstmt.setDate(9, vo.getEndDate());
			pstmt.setString(10, vo.getBackimg());
			pstmt.setString(11, vo.getTitle());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getTags());
			int result = pstmt.executeUpdate();
			return result;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return -1;
		}
	}
	public int update(PartyboardVo vo)
	{
		String sql = "update board_party set "
				+ ""
				+ "dest = ?, gender = ?, "
				+ "age_min = ?, age_max = ?, memcnt = ?, "
				+ "startdate = ?, enddate = ?, "	// dest, gender, age~age, memcnt, date~date
				+ "backimage = ?, title = ?, content = ?, tags = ? "	// backimage, title, content, tags
				+ "where anum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setString(1, vo.getDest());
			pstmt.setString(2, vo.getGender());
			pstmt.setLong(3, vo.getAge_min());
			pstmt.setLong(4, vo.getAge_max());
			pstmt.setLong(5, vo.getMemcnt());
			pstmt.setDate(6, vo.getStartDate());
			pstmt.setDate(7, vo.getEndDate());
			pstmt.setString(8, vo.getBackimg());
			pstmt.setString(9, vo.getTitle());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getTags());
			pstmt.setLong(12, vo.getAnum());
			int result = pstmt.executeUpdate();
			return result;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return -1;
		}
	}

	public PartyboardVo selectNewArticle()
	{
		return selectAll(1).get(0);
	}
	public PartyboardVo selectNewArticle(long mnum)
	{
		return selectAll(1, mnum).get(0);
	}
	public void addView(long anum)
	{
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();)
		{
			stmt.executeUpdate("update board_party set views = (views + 1) where anum = " + anum);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	public PartyboardVo select(long anum)
	{
		if (anum <= 0)
			return null;
		
		String sql = "select * from board_party where anum = " + anum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			if (rs.next())
			{
				PartyboardVo vo = new PartyboardVo(
					anum,
					rs.getLong("mnum"),
					rs.getString("nick"),
					rs.getString("dest"),
					rs.getString("gender"),
					rs.getLong("age_min"),
					rs.getLong("age_max"),
					rs.getLong("memcnt"),
					rs.getDate("startdate"),
					rs.getDate("enddate"),
					rs.getString("backimage"),
					rs.getString("title"),
					rs.getString("content"),
					rs.getString("tags"),
					rs.getLong("views"),
					rs.getDate("regdate"),
					rs.getString("expired")
				);
				return vo;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<PartyboardVo> search(long page, boolean no_region, String region, boolean no_gender, String gender, boolean no_age, long age_min, long age_max, boolean no_date, Date startdate, Date enddate)
	{
		ArrayList<PartyboardVo> list = new ArrayList<PartyboardVo>();
		String sql = "select * from ";
		if (no_region && no_gender && no_age && no_date)
		{
			return selectAll();
		}
		else
		{
			// 공포의 쿼리
			sql += "(select bp.*, rownum as rnum from (select * from board_party order by anum desc) bp)"
				+  " where "
				+  (no_region ? "" : "dest = \'" + region + "\' " + (!no_gender || !no_age || !no_date ? "and " : ""))
				+  (no_gender ? "" : "gender = \'" + gender + "\' " + (!no_age || !no_date ? "and " : ""))
				+  (no_age ? "" : "age_min >= " + age_min + " and age_max <= " + age_max + " " + (!no_date ? "and " : ""))
				+  (no_date ? "" : "startdate >= \'" + startdate + "\' and enddate <= \'" + enddate + "\'")
				+  " and rnum > 0";//" and rnum >= " + (page * 8 - 7) + " and rnum <= " + (page * 8);
			System.out.println(sql);
		}
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			while (rs.next())
			{
				PartyboardVo vo = new PartyboardVo(
					rs.getLong("anum"),
					rs.getLong("mnum"),
					rs.getString("nick"),
					rs.getString("dest"),
					rs.getString("gender"),
					rs.getLong("age_min"),
					rs.getLong("age_max"),
					rs.getLong("memcnt"),
					rs.getDate("startdate"),
					rs.getDate("enddate"),
					rs.getString("backimage"),
					rs.getString("title"),
					rs.getString("content"),
					rs.getString("tags"),
					rs.getLong("views"),
					rs.getDate("regdate"),
					rs.getString("expired")
				);
				list.add(vo);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public int getPageCount()
	{
		int page = 1;
		String sql = "select max(rownum) as rmax from board_party";
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			if (rs.next())
			{
				page = rs.getInt("rmax");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return (int)Math.ceil(page / 8.0);
	}
	
	public int updateExpire(long anum, boolean expire)
	{
		String sql = "update board_party set expired = ? where anum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setString(1, expire ? "Y" : "N");
			pstmt.setLong(2, anum);
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(long anum)
	{
		String sql = "delete from board_party where anum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, anum);
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<PartyboardVo> selectAll(long page)
	{
		return selectAll(page, -1);
	}
	public ArrayList<PartyboardVo> selectAll(long page, long mnum)
	{
		ArrayList<PartyboardVo> list = new ArrayList<PartyboardVo>();
		if (page <= 0)
			return list;
		
		String sql = "select * from (select bp.*, rownum as rnum from (select * from board_party <mnum> order by anum desc) bp) where rnum >= ? and rnum <= ?";
		sql = sql.replaceAll("<mnum>", mnum > 0 ? ("where mnum = " + mnum) : "");
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, page * 8 - 7);
			pstmt.setLong(2, page * 8);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				PartyboardVo vo = new PartyboardVo(
					rs.getLong("anum"),
					rs.getLong("mnum"),
					rs.getString("nick"),
					rs.getString("dest"),
					rs.getString("gender"),
					rs.getLong("age_min"),
					rs.getLong("age_max"),
					rs.getLong("memcnt"),
					rs.getDate("startdate"),
					rs.getDate("enddate"),
					rs.getString("backimage"),
					rs.getString("title"),
					rs.getString("content"),
					rs.getString("tags"),
					rs.getLong("views"),
					rs.getDate("regdate"),
					rs.getString("expired")
				);
				list.add(vo);
			}
			rs.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<PartyboardVo> selectAll()
	{
		ArrayList<PartyboardVo> list = new ArrayList<PartyboardVo>();
		
		String sql = "select * from (select bp.*, rownum as rnum from (select * from board_party order by anum desc) bp)";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				PartyboardVo vo = new PartyboardVo(
					rs.getLong("anum"),
					rs.getLong("mnum"),
					rs.getString("nick"),
					rs.getString("dest"),
					rs.getString("gender"),
					rs.getLong("age_min"),
					rs.getLong("age_max"),
					rs.getLong("memcnt"),
					rs.getDate("startdate"),
					rs.getDate("enddate"),
					rs.getString("backimage"),
					rs.getString("title"),
					rs.getString("content"),
					rs.getString("tags"),
					rs.getLong("views"),
					rs.getDate("regdate"),
					rs.getString("expired")
				);
				list.add(vo);
			}
			rs.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
