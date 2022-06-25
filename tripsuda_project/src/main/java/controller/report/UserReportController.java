package controller.report;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReportDao;
import vo.MemberVo;

@WebServlet("/report")
public class UserReportController extends HttpServlet
{
	/**
	 * 신고창 팝업이 뜨는 <a> 태그를 붙입니다.
	 * 신고자의 정보는 session.userdata 를 통해서 취득합니다.
	 * @param req jsp의 리퀘스트 변수 (contextPath 취득용)
	 * @param userNumber 신고대상자의 멤버번호
	 * @return <a href="javascript:window.open(...)>신고 조지기</a>
	 */
	public static String getHTML(HttpServletRequest req, long userNumber)
	{
		String name = "신고하기";
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
	 * 신고창 팝업이 뜨는 <a> 태그를 붙입니다.
	 * 다만 이 경우 플레이스홀더의 형태로 대체됩니다.
	 * <contextPath> -> request.contextPath
	 * <mnum> -> 유저 번호
	 * @return <a href="javascript:window.open(...)>신고 조지기</a>
	 */
	public static String getHTMLFormat()
	{
		String name = "신고";
		String script = "window.open(\'<contextPath>/report?mnum=<mnum>\', \'신고하기\', \'"
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
		boolean isCancelled = false;
		String cancelReason = "";
		
		req.setCharacterEncoding("utf-8");
		System.out.println("mnum - " + req.getParameter("mnum"));
		System.out.println("reason - " + req.getParameter("reason"));
		System.out.println("reason de - " + req.getParameter("reason_detail"));

		if (req.getParameter("mnum") == null || req.getParameter("reason") == null)
		{
			isCancelled = true;
			cancelReason = "비정상적인 접근";
		}
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		if (userdata == null)
		{
			isCancelled = true;
			cancelReason = "먼저 로그인하세요.";
		}
		else
		{
			int plaintiff = (int)userdata.getMnum();
			int defendant = Integer.parseInt(req.getParameter("mnum"));
			String reason = req.getParameter("reason");
			if (req.getParameter("reason_detail") != null)
				reason += " - " + req.getParameter("reason_detail");
			
			int result = ReportDao.getInstance().insert(defendant, plaintiff, reason);
			if (result < 0)
			{
				isCancelled = true;
				cancelReason = "DB 에러";
			}
			
		}
		if (!isCancelled)
		{
			req.getRequestDispatcher("/html&jsp/report/report_complete.jsp?result=ok").forward(req, resp);
			// resp.sendRedirect(req.getContextPath() + "/html&jsp/report/report_complete.jsp?result=ok");			
		}
		else
		{
			req.setAttribute("no_reason", cancelReason);
			req.getRequestDispatcher("/html&jsp/report/report_complete.jsp?result=error").forward(req, resp);
			// resp.sendRedirect(req.getContextPath() + "/html&jsp/report/report_complete.jsp?result=error");
		}
	}
}
