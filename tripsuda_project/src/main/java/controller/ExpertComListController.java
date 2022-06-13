package controller;

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

import dao.Expert_commDao;
import vo.Expert_commVo;

@WebServlet("/board_expert/comlist")
public class ExpertComListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Expert_commDao dao = new Expert_commDao();
		int anum = Integer.parseInt(req.getParameter("anum"));
		ArrayList<Expert_commVo> list = dao.list(anum);
	
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray arr=new JSONArray();
		
		for(Expert_commVo vo:list) {
			JSONObject ob=new JSONObject();
			ob.put("nick", vo.getNick());
			ob.put("mnum", vo.getMnum());
			ob.put("regdate",vo.getRegdate());
			ob.put("content",vo.getContent());
			
			arr.put(ob);
		}	
			data.put("list",arr);
			pw.print(data);
	}
}
