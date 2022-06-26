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
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;
import vo.PartyboardVo;
import vo.PartywaitVo;

/**
 * @author 주현
 * 동행 신청 DAO
 * member 테이블에 의존
 */
public class PartyWaitDao
{
	private static PartyWaitDao instance = null;
	public static PartyWaitDao getInstance()
	{
		if (instance == null)
			instance = new PartyWaitDao();
		return instance;
	}
	private PartyWaitDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	public int insert(PartywaitVo vo)
	{
		// 이미 등록한 경우 -2
		if (select(vo.getAnum(), vo.getMnum()) != null)
			return -2;
		
		String sql = "insert into partywait values(?, ?, \'Y\')"; // anum, mnum, yn
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, vo.getAnum());
			pstmt.setLong(2, vo.getMnum());
			int result = pstmt.executeUpdate();

			MemberVo mem = MemberDao.getInstance().select(vo.getMnum());
			ChatVo chat = new ChatVo(0, vo.getAnum(), -1, new long[] { vo.getMnum() }, mem.getNick() + " 님이 참여했어요.", null);
			ChatDao.getInstance().addChat(chat);
			
			return result;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public int getMemCnt(long anum)
	{
		if (anum <= 0)
			return 0;
		
		String sql = "select count(*) as memcnt from partywait where anum = " + anum + " and yn = 'Y'";
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			if (rs.next())
			{
				return rs.getInt("memcnt");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public PartywaitVo select(long anum, long mnum)
	{
		if (anum <= 0 || mnum <= 0)
			return null;
		
		String sql = "select * from partywait where anum = " + anum + " and mnum = " + mnum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			if (rs.next())
			{
				PartywaitVo vo = new PartywaitVo(
					anum,
					mnum,
					rs.getString("yn")
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
	
	public int delete(long anum, long mnum)
	{
		if (anum <= 0 || mnum <= 0)
			return -1;
		
		String sql = "delete from partywait where anum = " + anum + " and mnum = " + mnum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();)
		{
			int result = stmt.executeUpdate(sql);
			MemberVo mem = MemberDao.getInstance().select(mnum);
			ChatVo chat = new ChatVo(0, anum, -1, new long[] { mnum }, mem.getNick() + " 님이 나가셨어요.", null);
			ChatDao.getInstance().addChat(chat);

			return result;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	public int deleteAll(long anum)
	{
		if (anum <= 0)
			return -1;
		
		String sql = "delete from partywait where anum = " + anum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();)
		{
			int result = stmt.executeUpdate(sql);

			return result;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
}
