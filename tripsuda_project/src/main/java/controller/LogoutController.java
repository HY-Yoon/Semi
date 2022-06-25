package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			//request.getSession().removeAttribute("sessionID");
		    HttpSession session = request.getSession();
			session.invalidate();
		//	request.getRequestDispatcher("/html&jsp/Menu.jsp").forward(request, response);
	        response.sendRedirect(request.getContextPath()+"/community");  	//kj 624수정 로그아웃시 main페이지
	
	}
}

