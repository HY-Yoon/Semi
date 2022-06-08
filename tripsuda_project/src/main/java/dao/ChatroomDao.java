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
import vo.ChatroomVo;

public class ChatroomDao
{
	private static ChatroomDao instance = null;
	public static ChatroomDao getInstance()
	{
		if (instance == null)
			instance = new ChatroomDao();
		return instance;
	}
	private ChatroomDao()
	{
		initialize();
	}
	
	private void initialize()
	{
	}
	
	public int createRoom(ChatroomVo vo)
	{
		String sql = "insert into chatroom values(chatroom_seq.nextval, ?, ?)";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, vo.getaNum());
			Array arr = ((OracleConnection) con).createARRAY("chat_members", vo.getMembers());
			pstmt.setArray(2, arr);
			return pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 해당 유저에게 등록된 채팅방을 전부 조회
	 * @param mnum 유저번호
	 * @return
	 */
	public ArrayList<ChatroomVo> getUserRooms(long mnum)
	{
		ArrayList<ChatroomVo> list = new ArrayList<ChatroomVo>();
		String sql = "select * from chatroom where rnum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, mnum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				ChatroomVo vo = new ChatroomVo();
				vo.setrNum(mnum);
				vo.setaNum(rs.getLong("anum"));
				Array arr = rs.getArray("members");
				System.out.println(arr.getArray().toString());
				BigDecimal[] li = (BigDecimal[])arr.getArray();
				long[] mem = new long[li.length];
				for (int i = 0; i < li.length; i++)
					mem[i] = li[i].longValue();
				vo.setMembers(mem);
				return null;
			}
			rs.close();
			return null;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public ChatroomVo getRoom(long channel)
	{
		String sql = "select * from chatroom where rnum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, channel);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				ChatroomVo vo = new ChatroomVo();
				vo.setrNum(channel);
				vo.setaNum(rs.getLong("anum"));
				Array arr = rs.getArray("members");
				System.out.println(arr.getArray().toString());
				BigDecimal[] li = (BigDecimal[])arr.getArray();
				long[] mem = new long[li.length];
				for (int i = 0; i < li.length; i++)
					mem[i] = li[i].longValue();
				vo.setMembers(mem);
				return vo;
			}
			rs.close();
			return null;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
