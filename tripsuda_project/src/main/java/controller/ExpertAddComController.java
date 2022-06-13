package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.Expert_commDao;
import dao.MemberDao;
import vo.Expert_commVo;

@WebServlet("/board_expert/addcom")
public class ExpertAddComController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int anum = Integer.parseInt(req.getParameter("anum")); //게시글번호
		
		String nick = req.getParameter("nick"); //해당하는 member 회원번호 dao수정해서 사용했음
		MemberDao dao = MemberDao.getInstance();
		int mnum = dao.selAnum(nick);
		String comments = req.getParameter("comments"); //table은 content
		Expert_commVo vo = new Expert_commVo(0, anum, mnum, comments, null, 0, 0, 0, nick);
		Expert_commDao cdao = new Expert_commDao();
		int n =cdao.insert(vo);
			
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject json=new JSONObject();
		if(n>0){
			json.put("code", "success");
		}else {
			json.put("code", "fail");	
		}
		pw.print(json);
	}
}
