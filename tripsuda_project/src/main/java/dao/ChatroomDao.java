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

/**
 * @author 주현
 * 채팅방 DAO
 * partywait, board_party, member 테이블에 의존
 */
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

	public String getArticleName(long anum)
	{
		String sql = "select * from board_party where anum = " + anum;
		try(Connection con = JdbcUtil.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);)
		{
			if (rs.next())
				return rs.getString("title");
			return "";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "";
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
		// 참가 확정 목록을 통해 채팅방 가져오기
		String sql = "select *"
					+ "    from chatroom a inner join ("
					+ "        select anum"
					+ "            from partywait a inner join member b"
					+ "                on a.mnum = b.mnum"
					+ "            where a.mnum = ? and a.yn = 'Y'"
					+ "        ) b"
					+ "    on a.anum = b.anum";
		// 자신이 쓴 게시물을 통해 채팅방 가져오기
		String sql2 = "select a.*, b.*"
					+ "	   from board_party a inner join chatroom b"
					+ "        on a.anum = b.anum"
					+ "    where a.mnum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			PreparedStatement pstmt2 = con.prepareStatement(sql2);)
		{
			pstmt.setLong(1, mnum);
			pstmt2.setLong(1, mnum);
			ResultSet rs = pstmt.executeQuery();
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs.next()) // 확정 목록 순회
			{
				ChatroomVo vo = new ChatroomVo();
				vo.setrNum(rs.getLong("rnum"));
				vo.setaNum(rs.getLong("anum"));
				Array arr = rs.getArray("members");
				// System.out.println(arr.getArray().toString());
				BigDecimal[] li = (BigDecimal[])arr.getArray();
				long[] mem = new long[li.length];
				for (int i = 0; i < li.length; i++)
					mem[i] = li[i].longValue();
				vo.setMembers(mem);
				list.add(vo);
			}
			while (rs2.next()) // 게시글 순회
			{
				ChatroomVo vo = new ChatroomVo();
				vo.setrNum(rs2.getLong("rnum"));
				vo.setaNum(rs2.getLong("anum"));
				Array arr = rs2.getArray("members");
				// System.out.println(arr.getArray().toString());
				BigDecimal[] li = (BigDecimal[])arr.getArray();
				long[] mem = new long[li.length];
				for (int i = 0; i < li.length; i++)
					mem[i] = li[i].longValue();
				vo.setMembers(mem);
				list.add(vo);
			}
			rs.close();
			rs2.close();
			return list;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return list;
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
				// System.out.println(arr.getArray().toString());
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
	public ChatroomVo getRoomfromAnum(long anum)
	{
		String sql = "select * from chatroom where anum = ?";
		try(Connection con = JdbcUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setLong(1, anum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				ChatroomVo vo = new ChatroomVo();
				vo.setrNum(anum);
				vo.setaNum(rs.getLong("anum"));
				Array arr = rs.getArray("members");
				// System.out.println(arr.getArray().toString());
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
