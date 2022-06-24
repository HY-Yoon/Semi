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
import dao.PointDao;
import vo.PointVo;

@WebServlet("/board_expert/addReco")
public class ExpertRecoController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//추천 테이블 추가
		Expert_RecoDao dao = new Expert_RecoDao();
		int mnum = 22; //로그인한 회원번호 임의로
		int anum = Integer.parseInt(req.getParameter("anum"));
		int n = dao.insert(anum,mnum);
		
		//추천 수 조회 -> 포인트	
		int cnt = dao.getCount(anum);
			
		if(cnt==10) {
			PointDao pdao = new PointDao();
			Board_ExpertDao edao = Board_ExpertDao.getInstance();
			int pointmnum =edao.reco10(anum);
			String content = "추천수 10";
			int n1 = pdao.insert(pointmnum,content); 
		}
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject json=new JSONObject();
		
		if(n>0) {
			json.put("result", "success");
		}else {
			json.put("result", "fail");
		}
		pw.print(json);
	}
}
