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



@WebServlet("/memberModifyForm")
public class memberModifyFormController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
					
		// 수정할 회원정보를 가져온다.
	    MemberDao mdao = MemberDao.getInstance();
	    MemberVo member = mdao.getUserInfo(id);
					
		request.setAttribute("memberInfo", member);
				
		request.getRequestDispatcher("/html&jsp/member/ModifyForm.jsp").forward(request, response);
	}
	
}
