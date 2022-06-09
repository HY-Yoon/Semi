package dao;

import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Connection;
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
		String sql = "insert into chat values(chat_seq.nextval, ?, ?, ?, ?, sysdate)";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, vo.getrNum());
			pstmt.setLong(2, vo.getSender());
			Array arr = ((OracleConnection) con).createARRAY("chat_members", vo.getReaders());
			pstmt.setArray(3, arr);
			pstmt.setString(4, vo.getMessage());
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public static ArrayList<ChatVo> select(long rnum)
	{
		ArrayList<ChatVo> list = new ArrayList<ChatVo>();
		
		String sql = "select * from chat where rnum = ?";
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
				Array arr = rs.getArray("members");
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
