package controller.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.MemberDao;
import dao.reviewboard.ReviewBoardDao;
import dao.reviewboard.ReviewTagDao;
import util.JSONUtil;
import vo.MemberVo;
import vo.reviewboard.ReviewBoardVo;
import vo.reviewboard.ReviewTagVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 글쓰기 페이지
*/
@WebServlet("/board_review/detail")
public class ReviewDetailController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int anum = Integer.parseInt(req.getParameter("anum"));
		ReviewBoardVo vo = ReviewBoardDao.getInstance().select(anum);
		MemberVo editor = MemberDao.getInstance().select(vo.getMnum());
		req.setAttribute("vo", vo);
		req.setAttribute("editor", editor);
		req.getRequestDispatcher("/html&jsp/board_review/detailPage.jsp?anum="+anum).forward(req, resp);
	}
}
