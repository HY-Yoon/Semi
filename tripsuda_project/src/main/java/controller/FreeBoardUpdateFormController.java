package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDao;
import vo.FreeBoardVo;

/**
 * Servlet implementation class FreeBoardUpdateFormController
 */
@WebServlet("/FBoardUpdateForm")
public class FreeBoardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        // 페이지 번호와 글 번호를 가져온다.
				String page = request.getParameter("page");
			
				int boardNum =Integer.parseInt(request.getParameter("anum"));

				FreeBoardDao dao = FreeBoardDao.getInstance();
				FreeBoardVo board = dao.getDetail(boardNum);
				
				request.setAttribute("board", board);
				request.setAttribute("page", page);
				
				request.getRequestDispatcher("/html&jsp/board_Free/UpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
