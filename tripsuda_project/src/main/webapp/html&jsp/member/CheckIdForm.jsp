
<%@page import="java.io.PrintWriter"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%

 String id = request.getParameter("id");
 boolean exist = false;
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
 		exist = true; // 이미 아이디가 존재하는 경우
 	}
 } catch (SQLException s) {
 	s.printStackTrace();
 } finally {
 	try {
 		if (rs != null)
 	rs.close();
 		if (pstmt != null)
 	pstmt.close();
 		if (con != null)
 	con.close();
 	} catch (SQLException e) {
 		e.printStackTrace();
 	}
 }
 JSONObject json = new JSONObject();
 json.put("exist", exist);
  System.out.println(exist);
 response.setContentType("text/plain;charset=utf-8");
 PrintWriter pw = response.getWriter();
 pw.print(json);
 %>