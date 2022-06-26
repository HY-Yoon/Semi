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

import dao.FreeCommDao;
import dao.MemberDao;
import util.DateUtil;
import vo.Expert_commVo;
import vo.FreeCommVo;
import vo.reviewboard.ReviewCommVo;

/**
 * Servlet implementation class Free_CommentListController
 */
@WebServlet("/Free_CommentListController")
public class Free_CommentListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FreeCommDao dao = new FreeCommDao();
		int anum = Integer.parseInt(req.getParameter("anum"));
		ArrayList<FreeCommVo> list = dao.getCommentList(anum);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray arr=new JSONArray();
		
		for(FreeCommVo vo:list) {
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
