
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
 String name = request.getParameter("name");
 String phone = request.getParameter("phone");
 
 String pwd = null;
 String sql = "select pwd from member where id=? and name=? and phone=?";
 Connection con = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;
 con = JdbcUtil.getCon();

 try {
 	pstmt = con.prepareStatement(sql);
 	pstmt.setString(1, id);
 	pstmt.setString(2, name); 
	pstmt.setString(3, phone);

 	rs = pstmt.executeQuery();
 	if (rs.next()) {
 		pwd = rs.getString("pwd"); 
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

 response.setContentType("text/XML;charset=utf-8");
 PrintWriter pw = response.getWriter();
 pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
 pw.print("<result>");
 System.out.println(pwd);
 if(pwd==null){
	 pw.print("<code>fail</code>");
 }else{
	 pw.print("<code>success</code>");
	 pw.print("<pwd>"+pwd+"</pwd>");
 }
 pw.print("</result>");
 pw.close();
 %>