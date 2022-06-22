package controller.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.MemberDao;
import dao.reviewboard.ReviewCommDao;
import dao.reviewboard.ReviewTagDao;
import util.DateUtil;
import vo.MemberVo;
import vo.reviewboard.ReviewCommVo;
import vo.reviewboard.ReviewTagVo;

@WebServlet("/board_review/comm/list")
public class ReviewCommListController extends HttpServlet{
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum = Integer.parseInt(req.getParameter("anum"));
		ArrayList<ReviewCommVo> list = ReviewCommDao.getInstance().getComm(anum);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter(); 
		JSONObject json= new JSONObject();
		JSONArray jarr = new JSONArray();
		for(ReviewCommVo vo : list) {
			JSONObject obj = new JSONObject();
			String nick= MemberDao.getInstance().select(vo.getMnum()).getNick();
			obj.put("cnum", vo.getCnum());
			obj.put("nick", nick);
			obj.put("content", vo.getContent());
			String date = DateUtil.getText(vo.getRegdate(), "YYYY.MM.dd hh:mm");
			obj.put("regdate", date);
			jarr.put(obj);
		}
		json.put("list", jarr);
		pw.print(json);
		pw.close();
		
	}
}
