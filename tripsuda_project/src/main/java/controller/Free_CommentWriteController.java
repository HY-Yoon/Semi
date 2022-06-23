package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeCommDao;
import vo.FreeCommVo;

/**
 * Servlet implementation class Free_CommentWriteController
 */
@WebServlet("/FCommentWrite")
public class Free_CommentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Free_CommentWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeCommDao dao = FreeCommDao.getInstance();
		FreeCommVo comment = new FreeCommVo();
		
		// 파리미터 값을 가져온다.
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
		String comment_nick = request.getParameter("comment_nick");
		String comment_content = request.getParameter("comment_content");
		
		comment.setAnum(comment_board);
		comment.setNick(comment_nick);
		comment.setContent(comment_content);
		
//		boolean result = dao.insertComment(comment);
//
//		if(result){
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("1");
//			out.close();
//		}
			
		return ;
	}

}
