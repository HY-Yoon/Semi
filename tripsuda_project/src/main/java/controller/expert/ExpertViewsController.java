package controller.expert;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.Board_ExpertDao;

@WebServlet("/board_expert/views")
public class ExpertViewsController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int views = Integer.parseInt(req.getParameter("views"));
		int anum = Integer.parseInt(req.getParameter("anum"));
		Board_ExpertDao dao = Board_ExpertDao.getInstance();
		int n = dao.update(views, anum);
	
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject json=new JSONObject();
		if(n>0){
			json.put("result", "success");
		}else {
			json.put("result", "fail");	
		}
		pw.print(json);
		
		
	}
}
