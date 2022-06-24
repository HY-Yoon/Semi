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
import vo.FreeCommVo;


/**
 * Servlet implementation class Free_CommListController
 */
@WebServlet("/Free_CommListController")
public class Free_CommListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum = Integer.parseInt(req.getParameter("mnum"));
		FreeCommDao dao = FreeCommDao.getInstance();
		ArrayList<FreeCommVo> list = dao.getCommentList(anum);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONArray arr=new JSONArray();
		for(FreeCommVo vo:list) {
			JSONObject ob = new JSONObject();
			ob.put("cnum", vo.getCnum());
			ob.put("nick", vo.getNick());
			ob.put("content", vo.getContent());
			arr.put(ob);
		}
		pw.print(arr);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum = Integer.parseInt(req.getParameter("anum"));
		ArrayList<FreeCommVo> list = FreeCommDao.getInstance().getCommentList(anum);
	    
	}

}
