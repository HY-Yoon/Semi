package controller.qaboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qa_BoardDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
import vo.Qa_BoardVo;
import vo.Qa_HashTagVo;
import vo.Qa_LocalTagVo;
@WebServlet("/html&jsp/board_qa/updateboard_qa")
public class QaUpdateBoardController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum=Integer.parseInt(req.getParameter("anum"));
		Qa_BoardVo bvo=bdao.select(anum);
		String ltag=ldao.select(anum);
		ArrayList<String> htag=hdao.selectAll(anum);
		String hasht="";
		for(String hash:htag) {
			hasht+=hash+" ";
		}
		req.setAttribute("bvo", bvo);
		req.setAttribute("ltag", ltag);
		req.setAttribute("htag", hasht);
		req.getRequestDispatcher("/html&jsp/board_qa/contentUpdate.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 인코딩
		int anum=Integer.parseInt(req.getParameter("anum"));
		String location=req.getParameter("location");
		String title=req.getParameter("qtitle");
		String content=req.getParameter("content");
		String hashTag=req.getParameter("hashtag");
		int dn=bdao.contentUpdate(anum, title, content);
		int ln=ldao.update(anum, location);
		int hn=hdao.insertHash(anum,hashTag);
		if(ln>0 && dn>0 && hn>0) {
			req.getRequestDispatcher("/html&jsp/board_qa/content?anum="+anum).forward(req, resp);
		}
	}
}
