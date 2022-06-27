package controller.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.reviewboard.ReviewBoardDao;
import dao.reviewboard.ReviewCommDao;
import dao.reviewboard.ReviewRecoDao;
import dao.reviewboard.ReviewTagDao;
import util.JSONUtil;
import vo.reviewboard.ReviewBoardVo;
import vo.reviewboard.ReviewTagVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 글쓰기 페이지
*/
@WebServlet("/board_review/delete")
public class ReviewDeleteController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int anum = Integer.parseInt(req.getParameter("anum"));
		int n= ReviewRecoDao.getInstance().delete(anum);
		n+= ReviewCommDao.getInstance().delete(anum);
		n+= ReviewTagDao.getInstance().delete(anum);
		n+= ReviewBoardDao.getInstance().delete(anum);
		if(n ==4) {
			System.out.println("게시글 삭제완료!!!!!!!");
		}else {
			System.out.println("게시글 삭제실패.....");
		}
		
		req.getRequestDispatcher("/board_review").forward(req, resp);
	
	}
}
