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
import vo.MemberVo;

public class MemberDao
{
	private static MemberDao instance = null;
	public static MemberDao getInstance()
	{
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}
	private MemberDao()
	{
		initialize();
	}
	
	private void initialize()
	{
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
					rs.getDate("birth"),
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
	
	
	
}
