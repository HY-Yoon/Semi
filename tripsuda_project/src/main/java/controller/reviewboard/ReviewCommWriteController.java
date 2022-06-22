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

import dao.MemberDao;
import dao.reviewboard.ReviewCommDao;
import dao.reviewboard.ReviewTagDao;
import util.DateUtil;
import util.JSONUtil;
import vo.MemberVo;
import vo.reviewboard.ReviewCommVo;
import vo.reviewboard.ReviewTagVo;

@WebServlet("/board_review/comm/write")
public class ReviewCommWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String anum =req.getParameter("anum");
		req.getRequestDispatcher("/html&jsp/board_review/commPage.jsp?anum="+anum).forward(req, resp);
	}
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		JSONObject json = JSONUtil.parse(req.getReader());
		int anum= Integer.parseInt(json.getString("anum"));
		int mnum= Integer.parseInt(json.getString("mnum"));
		String content = json.getString("content");
		
		ReviewCommVo vo = new ReviewCommVo(0, anum, mnum, content, null);
		int n = ReviewCommDao.getInstance().insert(vo);
		PrintWriter pw = resp.getWriter();
		if(n > 0) {
			String url = req.getContextPath() + "/board_review/detail?anum="+anum;
			pw.print(url);
		}else {
			System.out.println("댓글작성실패");
		}
		pw.close();
		
	}
}
