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
		req.setAttribute("articledata", vo);
		
		if (userdata.getMnum() == vo.getMnum() || userdata.getGrade().equals("관리자"))
		{
			req.getRequestDispatcher("/html&jsp/board_party/edit.jsp").forward(req, resp);
		}
		else
		{
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/list");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard write start");
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		if (userdata == null)
		{
			// TODO 로그인 화면으로
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/login.jsp");
			return;
		}
		JSONObject json = JSONUtil.parse(req.getReader());
		JSONObject age_limit = json.getJSONObject("age_limit");
		JSONObject schedule = json.getJSONObject("schedule");
		boolean no_agelimit = age_limit.getBoolean("no_limit");
		Date datestart = Date.valueOf(schedule.getString("start"));
		Date dateend = Date.valueOf(schedule.getString("end"));
		PartyboardVo vo = new PartyboardVo(userdata.getMnum(), userdata.getNick(),
				json.getString("region"), json.getString("gender_limit"),
				no_agelimit ? 0 : age_limit.getLong("min_age"), no_agelimit ? 0 : age_limit.getLong("max_age"),
				json.getLong("member_count"), datestart, dateend,
				json.getString("thumbnail_image_base64"), json.getString("title"),
				json.getString("content"), json.getString("tag")
				);
		int result = PartyBoardDao.getInstance().insert(vo);
		PrintWriter pw = resp.getWriter();
		if (result > 0) // 성공
		{
			long anum = PartyBoardDao.getInstance().selectNewArticle().getAnum();
			pw.print(req.getContextPath() + "/html&jsp/board_party/detail?anum=" + anum);
		}
		else // 실패
		{
			pw.print(req.getContextPath() + "/html&jsp/board_party/list");
		}
	}
}
