package controller.partyboard;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

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

@WebServlet("/html&jsp/board_party/list")
public class PartyboardListController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String pn = req.getParameter("pagenum");
		long pagenum = 1;
		if (pn != null)
			pagenum = Long.parseLong(pn);
		ArrayList<PartyboardVo> list = PartyBoardDao.getInstance().selectAll(pagenum);
		req.getSession().setAttribute("list", list);
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/listpage.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard list search start");

		String pn = req.getParameter("pagenum");
		long pagenum = 1;
		if (pn != null)
			pagenum = Long.parseLong(pn);
		
		JSONObject json = JSONUtil.parse(req.getReader());
		JSONObject age_limit = json.getJSONObject("age_limit");
		JSONObject schedule = json.getJSONObject("schedule");
		
		// 검색 조건
		boolean no_dest = json.getBoolean("no_dest");
		String dest = json.getString("region");
		
		boolean no_gender = json.getBoolean("no_gender");
		String gender = json.getString("gender_limit");
		
		boolean no_age = age_limit.getBoolean("no_limit");
		long min_age = age_limit.getLong("min_age");
		long max_age = age_limit.getLong("max_age");
		
		boolean no_date = schedule.getBoolean("no_limit");
		Date datestart = Date.valueOf(schedule.getString("start"));
		Date dateend = Date.valueOf(schedule.getString("end"));

		ArrayList<PartyboardVo> list = PartyBoardDao.getInstance().search(pagenum,
				no_dest, dest,
				no_gender, gender,
				no_age, min_age, max_age,
				no_date, datestart, dateend);
		req.getSession().setAttribute("list", list);
		String jo = JSONObject.valueToString(list);
		System.out.println(jo);
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/listpage.jsp?pagenum=" + pagenum);
	}
}
