package dao;

import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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

	public PartyboardVo selectNewArticle(long anum)
	{
		return select(getCurrVal());
	}
	
	public long getCurrVal()
	{
		String sql = "select LAST_NUMBER from USER_SEQUENCES where sequence_name = 'BOARD_PARTY_SEQ'";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();)
		{
			if (rs.next())
				return rs.getLong(1);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public PartyboardVo select(long anum)
	{
		System.out.println("test 1");
		if (anum <= 0)
			return null;
		System.out.println("test 2");
		
		String sql = "select * from board_party where anum = " + anum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			System.out.println("test 3");
			if (rs.next())
			{
				System.out.println("test 4");
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
}
