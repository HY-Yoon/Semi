package controller.qaboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qa_BoardDao;
import dao.Qa_CommDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
import vo.Qa_BoardVo;
@WebServlet("/html&jsp/board_qa/content")
public class QaBoardContentController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	Qa_CommDao cdao=Qa_CommDao.getInstance();
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int anum = Integer.parseInt(req.getParameter("anum"));
//		req.getRequestDispatcher("/board_qa/qview.jsp").forward(req, resp);
//	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 게시글번호 파라미터로 가지고 오기
		int anum = Integer.parseInt(req.getParameter("anum"));
		Qa_BoardVo bvo=bdao.select(anum);
		int views=bdao.detailViews(anum); // 들어가면 조회수 1을 올려주면서 총조회수를 보여줌
		String ltag=ldao.select(anum);
		ArrayList<String> htag=hdao.selectAll(anum);
		int commcnt=cdao.commcnt(anum);
		req.setAttribute("bvo", bvo);
		req.setAttribute("views", views);
		req.setAttribute("ltag", ltag);
		req.setAttribute("htag", htag);
		req.setAttribute("commcnt", commcnt);
		req.getRequestDispatcher("/html&jsp/board_qa/contentViewPage.jsp").forward(req, resp);
		//http://localhost:8081/semi/html&jsp/board_qa/content?anum=18
	}
}
