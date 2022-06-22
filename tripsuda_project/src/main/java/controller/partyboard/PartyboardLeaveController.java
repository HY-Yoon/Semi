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

@WebServlet("/board_party/leave")
public class PartyboardLeaveController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		long anum = Long.parseLong(req.getParameter("anum"));
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		if (userdata == null)
		{
			return;
		}
		PartyWaitDao.getInstance().delete(anum, userdata.getMnum());
		
	}
}
