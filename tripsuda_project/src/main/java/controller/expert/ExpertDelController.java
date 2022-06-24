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
import dao.Expert_RecoDao;
import dao.Expert_commDao;
import dao.Expert_hashtagDao;
import dao.Expert_taglistDao;

@WebServlet("/board_expert/del")
public class ExpertDelController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum = Integer.parseInt(req.getParameter("anum"));
		System.out.println(anum);
		//하위테이블 comm_expert(댓글),reco_expert(추천),tag_expert(지역),hashtag_expert 삭제 후 board_expert삭
		
		Expert_commDao cdao = new Expert_commDao();
		int n1 =cdao.delete(anum);
				
		
		Expert_hashtagDao hdao = new Expert_hashtagDao();
		int n2 =hdao.delete(anum);
				
		Expert_RecoDao rdao = new Expert_RecoDao();
		int n3 =rdao.delete(anum);
				
		Expert_taglistDao tdao = new Expert_taglistDao();
		int n4 =tdao.delete(anum);
						
		Board_ExpertDao edao = Board_ExpertDao.getInstance();
		int n5 = edao.delete(anum);
		
		System.out.println(n5);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject json=new JSONObject();
		
		if(n5>0) {
			json.put("result", "success");
		}else {
			json.put("result", "X");
		}
			
		pw.print(json);
	
	}
}
