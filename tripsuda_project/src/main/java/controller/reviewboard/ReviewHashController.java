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

import dao.reviewboard.ReviewTagDao;
import vo.reviewboard.ReviewTagVo;

@WebServlet("/board_review/hash")
public class ReviewHashController extends HttpServlet{
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum = Integer.parseInt(req.getParameter("anum"));
		ArrayList<ReviewTagVo> list = ReviewTagDao.getInstance().select(anum);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter(); 
		JSONObject json= new JSONObject();
		JSONArray jarr = new JSONArray();
		for(ReviewTagVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("htag", vo.getHtag());
			jarr.put(obj);
		}
		json.put("list", jarr);
		pw.print(json);
		pw.close();
		
	}
}
