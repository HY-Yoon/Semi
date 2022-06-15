package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.Expert_RecoDao;

@WebServlet("/board_expert/addReco")
public class ExpertRecoController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Expert_RecoDao dao = new Expert_RecoDao();
		int mnum = 22; //로그인한 회원번호 임의로
		int anum = Integer.parseInt(req.getParameter("anum"));
		int n = dao.insert(anum,mnum);
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
