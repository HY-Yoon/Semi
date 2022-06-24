package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

@WebServlet("/LoginForm")
public class LoginFormController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//아이디 비밀번호 영대소+숫자, 인코딩 필요x
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		MemberDao mdao = new MemberDao();
		int check = mdao.loginCheck(id, pwd);
		HttpSession session=request.getSession();
		MemberVo mvo = mdao.getUserInfo(id);
		String nick = mvo.getNick();
		long mnum = mvo.getMnum();
		
		if(check == 1) { //로그인 성공
			session.setAttribute("sessionID", id);
			session.setAttribute("sessionNick", nick);
			session.setAttribute("sessionMnum", mnum);
			//request.getRequestDispatcher(request.getContextPath()+"/community").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/community");
		}else {
	    	request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다");
	    	request.getRequestDispatcher("/html&jsp/member/LoginForm.jsp").forward(request, response);
	    }
	}

}

