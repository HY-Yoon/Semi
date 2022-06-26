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
import dao.PartyWaitDao;
import util.JSONUtil;
import vo.ChatVo;
import vo.MemberVo;
import vo.PartyboardVo;

@WebServlet("/board_party/remove")
public class PartyboardRemoveController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard remove start");
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		
		long anum = Long.parseLong(req.getParameter("anum"));
		PartyboardVo vo = PartyBoardDao.getInstance().select(anum);
		
		if (userdata.getMnum() == vo.getMnum() || userdata.getGrade().equals("관리자"))
		{
			ChatDao.getInstance().deleteChatAll(anum);
			PartyWaitDao.getInstance().deleteAll(anum);
			PartyBoardDao.getInstance().delete(anum);
		}
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/list");
	}
}
