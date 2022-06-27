package controller.qaboard;

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
import dao.Qa_CommDao;
import vo.MemberVo;
import vo.Qa_CommVo;
@WebServlet("/html&jsp/board_qa/commview")
public class QaCommContentController extends HttpServlet{
	Qa_CommDao cdao=Qa_CommDao.getInstance();
	MemberDao mdao=MemberDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int anum=Integer.parseInt(req.getParameter("anum"));
		ArrayList<Qa_CommVo> clist=cdao.select(anum);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray jarr=new JSONArray();
		for(Qa_CommVo cvo:clist) {
			MemberVo mvo=mdao.select(Long.valueOf(cvo.getMnum()));
			JSONObject ob=new JSONObject();
			ob.put("mnum",cvo.getMnum());
			ob.put("cnum",cvo.getCnum());
			ob.put("commmnum",cvo.getMnum());
			ob.put("commnick",mvo.getNick());
			ob.put("commregdate",cvo.getRegdate());
			ob.put("commcontent",cvo.getContent());
			ob.put("sel", cvo.getSel());
			jarr.put(ob);
		}
		data.put("clist",jarr);
		pw.print(data);
	}
}
