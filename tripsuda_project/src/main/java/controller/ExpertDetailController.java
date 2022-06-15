package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_ExpertDao;
import dao.Expert_hashtagDao;
import dao.Expert_taglistDao;
import vo.Board_ExpertVo;


@WebServlet("/html&jsp/board_expert/detail")
public class ExpertDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int anum = Integer.parseInt(req.getParameter("anum"));
		int views = Integer.parseInt(req.getParameter("views"));
						
		Board_ExpertDao dao = Board_ExpertDao.getInstance();
		Board_ExpertVo vo = dao.select(anum);
		
		Expert_hashtagDao hdao = new Expert_hashtagDao();
		Expert_taglistDao tdao = new Expert_taglistDao();
		String hashtag = hdao.list(anum);
		String tag = tdao.list(anum);
				
		req.setAttribute("anum",anum);
		req.setAttribute("mnum", vo.getMnum());
		req.setAttribute("nick", vo.getNick());
		req.setAttribute("title", vo.getTitle());
		req.setAttribute("tag", tag);
		req.setAttribute("content", vo.getContent());
		req.setAttribute("hashtag", hashtag);
		req.setAttribute("regdate", vo.getRegdate());
		req.setAttribute("orgfile", vo.getOrgfile());
		req.setAttribute("serverfile", vo.getServerfile());
		req.setAttribute("views", views);
		
	req.getRequestDispatcher("/html&jsp/board_expert/detail.jsp").forward(req, resp);
	
	}

}
