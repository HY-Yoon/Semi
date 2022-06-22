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

import db.JdbcUtil;
import oracle.jdbc.OracleConnection;
import vo.ChatVo;

/**
 * @author 주현
 * 채팅 데이터 DAO
 */
public class ChatDao
{
	private static ChatDao instance = null;
	public static ChatDao getInstance()
	{
		if (instance == null)
			instance = new ChatDao();
		return instance;
	}
	private ChatDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	public int addChat(ChatVo vo)
	{
		String sql = "insert into chat values(chat_seq.nextval, ?, ?, <chat>, ?, sysdate)";
		String param_cm = "chat_members(";
		if (vo.getReaders() != null)
		{
			for (int i = 0; i < vo.getReaders().length; i++)
				param_cm += vo.getReaders()[i] + (i == vo.getReaders().length - 1 ? ")" : ",");
			sql = sql.replaceAll("<chat>", param_cm);
		}
		else
			sql = sql.replaceAll("<chat>", "null");
		
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, vo.getrNum());
			pstmt.setLong(2, vo.getSender());
			pstmt.setString(3, vo.getMessage());
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public long getChatCnt(long anum)
	{
		String sql = "select count(*) from chat where rnum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, anum);
			ResultSet rs = pstmt.executeQuery();
			long cnt = 0;
			if (rs.next())
			{
				cnt = rs.getLong(1);
			}
			rs.close();
			return cnt;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}	
	public long getRecentCnum()
	{
		// String sql = "select * from user_sequences";
		// String sql = "select chat_seq.currval from dual";
		String sql = "select * from chat order by cnum desc";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			long cnt = 0;
			if (rs.next())
			{
				// System.out.println(rs.getString("sequence_name") + " ... " + rs.getLong("last_number"));
				System.out.println(rs.getLong("cnum"));
				cnt = rs.getLong("cnum");
			}
			rs.close();
			return cnt;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	public Date getRecentChatDate(long anum)
	{
		String sql = "select * from (select * from chat where rnum = ? order by cnum desc) where rownum = 1";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, anum);
			ResultSet rs = pstmt.executeQuery();
			Date date = null;
			if (rs.next())
			{
				date = rs.getDate("credate");
			}
			rs.close();
			return date;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<ChatVo> select(long rnum)
	{
		ArrayList<ChatVo> list = new ArrayList<ChatVo>();
		
		String sql = "select * from chat where rnum = ? order by credate asc";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, rnum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				ChatVo vo = new ChatVo();
				vo.setcNum(rs.getLong("cnum"));
				vo.setrNum(rs.getLong("rnum"));
				vo.setSender(rs.getLong("sender"));
				Array arr = rs.getArray("readers");
				System.out.println(arr.getArray().toString());
				BigDecimal[] li = (BigDecimal[])arr.getArray();
				long[] mem = new long[li.length];
				for (int i = 0; i < li.length; i++)
					mem[i] = li[i].longValue();
				vo.setReaders(mem);
				vo.setMessage(rs.getString("message"));
				vo.setCreDate(rs.getDate("credate"));
				list.add(vo);
			}
			rs.close();
			return list;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}

}
