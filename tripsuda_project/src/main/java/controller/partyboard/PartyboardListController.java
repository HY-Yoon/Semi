package controller.partyboard;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;

import dao.ChatDao;
import dao.PartyBoardDao;
import util.DateUtil;
import util.DateUtil.DATEFORMAT;
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
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/listpage.jsp?pagenum=" + pagenum);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard list search start");

		JSONObject json = JSONUtil.parse(req.getReader());
		JSONObject age_limit = json.getJSONObject("age_limit");
		JSONObject schedule = json.getJSONObject("schedule");
		
		// 검색 조건
		long pagenum = json.getLong("pagenum");
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
		
		// list = PartyBoardDao.getInstance().selectAll(pagenum);
		
		JSONObject result = new JSONObject();
		result.put("pagenum", pagenum);
		System.out.println("list - " + list.size());
		result.put("max_page", list.size() / 8 + (list.size() % 8 > 0 ? 1 : 0));
		JSONArray arr = new JSONArray();
		long start = (pagenum - 1) * 8;
		for (int i = 0; i < 8; i++)
		{
			if (start + i >= list.size())
				break;
			
			PartyboardVo vo = list.get((int)start + i);
			
			JSONObject atc = new JSONObject();
			atc.put("anum", vo.getAnum());
			atc.put("dest", vo.getDest());
			atc.put("pic_src", vo.getBackimg());
			atc.put("start_date", DateUtil.getText(vo.getStartDate(), DATEFORMAT.MD_small));
			atc.put("end_date", DateUtil.getText(vo.getEndDate(), DATEFORMAT.MD_small));
			atc.put("expired", vo.getExpired());
			atc.put("title", vo.getTitle());
			atc.put("little_text", Jsoup.parse(vo.getContent()).text());
			atc.put("nick", vo.getNick());
			atc.put("view", vo.getViews());
			
			arr.put(atc);
		}
		result.put("articles", arr);
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(result.toString());
	}
}
