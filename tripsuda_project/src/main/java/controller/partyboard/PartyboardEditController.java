package controller.partyboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.ChatDao;
import dao.PartyBoardDao;
import util.JSONUtil;
import vo.ChatVo;
import vo.MemberVo;
import vo.PartyboardVo;

@WebServlet("/board_party/edit")
public class PartyboardEditController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard edit start");
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		
		long anum = Long.parseLong(req.getParameter("anum"));
		PartyboardVo vo = PartyBoardDao.getInstance().select(anum);
		
		if (userdata.getMnum() == vo.getMnum() || userdata.getGrade().equals("관리자"))
		{
			req.getSession().setAttribute("board_party_edit_cache", vo);
			// req.getRequestDispatcher("/html&jsp/board_party/editpage.jsp").forward(req, resp);
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/editpage.jsp?anum=" + anum);
		}
		else
		{
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/list");
		}
	}
}
