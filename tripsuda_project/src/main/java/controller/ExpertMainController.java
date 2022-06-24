package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/board_expert/add") // 글쓰기 누르면 페이지이동 // 필터로 포인트10(전문가등급) 인지 확인?
public class ExpertMainController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원정보 파라미터로 받아서 이동
		req.setCharacterEncoding("utf-8");
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		String nick = req.getParameter("nick");
		req.setAttribute("mnum", mnum);
		req.setAttribute("nick", nick);
		ServletContext application = req.getServletContext();
		application.setAttribute("cp", req.getContextPath());
		//http://localhost:8081/tripsuda_project/main?mnum=1&nick=test
		req.getRequestDispatcher("/html&jsp/board_expert/add.jsp").forward(req, resp);
		
		
	}
}
