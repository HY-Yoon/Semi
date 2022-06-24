package controller.report;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/report")
public class UserReportController extends HttpServlet
{
	public static String getHTML(HttpServletRequest req, long userNumber)
	{
		String name = "신고 조지기";
		String url = req.getContextPath() + "/report?mnum=" + userNumber;
		String script = "window.open(\'"
						+ url + "\', \'"
						+ "신고하기" + "\', \'"
						+ "width = 500, height = 860, location = no" + "\')";
		
		return "<a style=\"text-decoration: underline;\" href=\""
				+ "javascript:" + script
				+ "\">" + name + "</a>";
	}
	
	/**
	 *	페이지 취득
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.sendRedirect(req.getContextPath() + "/html&jsp/report/report.jsp?mnum=" + req.getParameter("mnum"));
	}
	
	/**
	 *	폼을 통해 신고 조지기
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		System.out.println("asdfasdf");
		System.out.println(req.getParameter("reason"));
		System.out.println(req.getParameter("reason_detail"));
	}
}
