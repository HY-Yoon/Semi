package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

/**
 * Servlet implementation class memberDeleteController
 */
@WebServlet("/memberDelete")
public class memberDeleteController extends HttpServlet {
 @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		   throws ServletException, IOException {

	HttpSession session = request.getSession();
	String id = session.getAttribute("sessionID").toString();
	String pwd = request.getParameter("pwd");
	
	MemberDao mdao = MemberDao.getInstance();
	int check = mdao.deleteMember(id, pwd);
	
	if(check == 1){
		session.removeAttribute("sessionID");
		request.getRequestDispatcher("/html&jsp/member/ResultForm.jsp").forward(request, response);
	}else{
		System.out.println("회원 삭제 실패");		
		request.getRequestDispatcher("/Menu.jsp").forward(request, response);
	}
}
}


