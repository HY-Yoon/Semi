
<%@page import="vo.FreeCommVo"%>
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

 String nick= request.getParameter("comment_nick");
 String content = request.getParameter("comment.content");
 
 FreeCommVo comment = new FreeCommVo();
 String sql = "insert into comm_free(cnum,nick,content,regdate) values(fcnum_seq.nextval, ?, ?, sysdate)";
 Connection con = null;
 PreparedStatement pstmt = null;
 boolean result = false;
 con = JdbcUtil.getCon();

 try {
 	pstmt = con.prepareStatement(sql);
 	pstmt.setString(1, comment.getNick());
 	pstmt.setString(2, comment.getContent());

 	int n = pstmt.executeUpdate();
	if(n > 0){
		result = true;
	}
 } catch (SQLException s) {
 	s.printStackTrace();
 } finally {
 	try {
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
 System.out.println(result);
 if(result==false){
	 pw.print("<code>fail</code>");
 }else{
	 pw.print("<code>success</code>");
 }
 pw.print("</result>");
 pw.close();
 %>