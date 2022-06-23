package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FreeBoardDao;

/**
 * Servlet implementation class FreeBoardDeleteController
 */
@WebServlet("/FBoardDelete")
public class FreeBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int anum = Integer.parseInt(request.getParameter("anum"));
		HttpSession session = request.getSession();
	//	String id = (String) session.getAttribute("id");
		String id = "admin";
		FreeBoardDao dao = new FreeBoardDao();
		boolean result = dao.isBoardWriter(anum, id);	//작성자 확인
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(id.equals("admin") || result == true) {  //관리자나 작성자가 삭제 가능
			int n = dao.deleteBoard(anum);
			if(n > 0) {
				out.println("<script>alert('삭제되었습니다.');");
				out.println("location.href='"+ request.getContextPath() +"/freelist';</script>");
			} else {
				out.println("<script>alert('삭제 실패하였습니다.');");
				out.println("location.href='" + request.getContextPath() +"/freelist';</script>");
			}
		} else if(!id.equals("admin") && result == false) {
			out.println("<script>alert('삭제 권한이 없습니다!');");
			//out.println("location.href='${pageContext.request.contextPath}/DetailForm?anum=" + anum + "';</script>"); 작동은 되지만 조회수가 올라가서 적절치 않다.
			out.println("history.go(-1);return false;</script>");
		}
		return;   //
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
