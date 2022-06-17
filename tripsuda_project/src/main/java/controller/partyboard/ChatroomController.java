package controller.partyboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 채널 변경
@WebServlet("/chat/room")
public class ChatroomController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int chan = Integer.parseInt(req.getParameter("channel"));
		req.getSession().setAttribute("channel", chan);
		resp.sendRedirect(req.getContextPath() + "/chat.jsp");
		
		/*
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		resp.setContentType("text/xml; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		for (CommentsVo vo : CommentsDao.select(mnum))
		{
			pw.print(" <comm>");
			pw.print("  <num>");
			pw.print(vo.getNum());
			pw.print("  </num>");
			pw.print("  <mnum>");
			pw.print(vo.getMnum());
			pw.print("  </mnum>");
			pw.print("  <id>");
			pw.print(vo.getId());
			pw.print("  </id>");
			pw.print("  <comments>");
			pw.print(vo.getComments());
			pw.print("  </comments>");
			pw.print(" </comm>");
		}
		pw.print("</result>");
		*/
	}
}
