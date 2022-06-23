package controller;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ReportDao;


@WebServlet("/board_expert/report")
public class ExpertReportController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int defendant = Integer.parseInt(req.getParameter("mnum")); // 신고당한
		int plaint = 22; // 로그인한 회원번호(신고자) session으로 
		String reason = req.getParameter("reason");
		
		
		ReportDao dao = new ReportDao();
		int n = dao.insert(defendant, plaint, reason);
		if(n>0) {
			
			
		}else {
			
		}
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<script>");
		pw.print("alert('신고가 완료되었습니다');");
		pw.print("self.close()");
		pw.print("</script>");
		
		
		
	}
}
