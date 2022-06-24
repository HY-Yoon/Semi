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

import chat.AdminChatData;
import db.JdbcUtil;
import oracle.jdbc.OracleConnection;
import vo.AdminChatVo;
import vo.ChatVo;

/**
 * @author 주현
 * 상담 채팅 데이터 DAO
 */
public class AdminChatDao
{
	private static AdminChatDao instance = null;
	public static AdminChatDao getInstance()
	{
		if (instance == null)
			instance = new AdminChatDao();
		return instance;
	}
	private AdminChatDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	public int addChat(ChatVo vo, long reader)
	{
		vo.setrNum(0);
		ChatDao.getInstance().addChat(vo); // 채팅값 추가
		String sql = "insert into adminchat values(?, ?, ?)";
		
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, ChatDao.getInstance().getRecentCnum());
			pstmt.setLong(2, vo.getSender());
			pstmt.setLong(3, reader);
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	

	public ArrayList<AdminChatData> getRecentChatList()
	{
		ArrayList<AdminChatData> list = new ArrayList<AdminChatData>();
		
		String sql = "select * from chat c"
					+ " inner join (select sender, max(cnum) as cnum from adminchat group by sender) a"
					+ " on c.cnum = a.cnum"
					+ " order by c.cnum desc";
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			while (rs.next())
			{
				AdminChatData acd = new AdminChatData(
						rs.getLong("cnum"),
						rs.getLong("sender"), 0,
						rs.getString("message"), rs.getDate("credate"));
				list.add(acd);
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
	public ArrayList<AdminChatData> getList(long mnum)
	{
		ArrayList<AdminChatData> list = new ArrayList<AdminChatData>();
		
		String sql = "select * from adminchat a inner join chat c"
				+ " on a.cnum = c.cnum"
				+ " where a.sender = ? or a.reader = ? order by credate asc";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, mnum);
			pstmt.setLong(2, mnum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				AdminChatData acd = new AdminChatData(
						rs.getLong("cnum"),
						rs.getLong("sender"), rs.getLong("reader"),
						rs.getString("message"), rs.getDate("credate"));
				list.add(acd);
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
