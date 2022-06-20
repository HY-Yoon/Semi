package controller.partyboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.PartyBoardDao;
import dao.PartyWaitDao;
import util.JSONUtil;
import vo.MemberVo;
import vo.PartywaitVo;

@WebServlet("/html&jsp/board_party/detail")
public class PartyboardDetailController extends HttpServlet
{
	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		PartyBoardDao.getInstance().addView(Long.parseLong(req.getParameter("anum")));
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/detailpage.jsp?anum=" + req.getParameter("anum"));
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("partyboard detail action start");

		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		JSONObject json = JSONUtil.parse(req.getReader());
		
		// 검색 조건
		long anum = json.getLong("anum");
		String actionType = json.getString("actiontype");
		System.out.println(actionType);
		int result = 0;
		switch (actionType)
		{
		case "activate": // 활성화
			result = PartyBoardDao.getInstance().updateExpire(anum, false);
			break;
		case "deactivate": // 비활성화
			result = PartyBoardDao.getInstance().updateExpire(anum, true);
			break;
		case "join": // 참가 요청
			result = PartyWaitDao.getInstance().insert(new PartywaitVo(anum, userdata.getMnum(), "N"));
			break;
		case "leave": // 동행 나가기
			result = PartyWaitDao.getInstance().delete(anum, userdata.getMnum());
			break;
		}
		
		PrintWriter pw = resp.getWriter();
		pw.print(result >= 0 ? "OK" : "NO");
	}
}
