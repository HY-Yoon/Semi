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

		
		request.setAttribute("board", board);

		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/html&jsp/board_Free/DetailForm.jsp").forward(request, response);

				
			}
	}

