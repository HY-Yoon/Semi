package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FreeBoardDao;
import dao.FreeCommDao;
import vo.FreeBoardVo;
import vo.FreeCommVo;

/**
 * Servlet implementation class FreeBoardDetailController
 */
@WebServlet("/FBoardDetail")
public class FreeBoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int anum = Integer.parseInt(request.getParameter("anum"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String page = request.getParameter("page");
		
		FreeBoardDao dao = new FreeBoardDao();
		FreeBoardVo board = new FreeBoardVo();

			dao.updateCount(anum);	//조회수 증가
		
		board = dao.getDetail(anum);	
		
		// 게시글 번호를 이용하여 해당 글에 있는 댓글 목록을 가져온다.
		FreeCommDao commentDAO = FreeCommDao.getInstance();
		ArrayList<FreeCommVo> commentList = commentDAO.getCommentList(anum);
		
		request.setAttribute("board", board);
		if(commentList.size() > 0)	request.setAttribute("commentList", commentList);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/html&jsp/board_Free/DetailForm.jsp").forward(request, response);

				
			}
	}

