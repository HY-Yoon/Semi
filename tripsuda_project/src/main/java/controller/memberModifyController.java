package controller;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;


@WebServlet("/memberModify")
public class memberModifyController extends HttpServlet{
   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
     request.setCharacterEncoding("utf-8"); 	
	 MemberDao mdao = MemberDao.getInstance();
	
	 // 세션이 가지고있는 로그인한 ID 정보를 가져온다
	 HttpSession session = request.getSession();
	 String id = session.getAttribute("sessionID").toString();
	
	 // 수정할 정보를 memberVo에 넣는다.
	 MemberVo member = new MemberVo();
	 member.setId(id);
	 member.setPwd(request.getParameter("pwd"));
	 member.setNick(request.getParameter("nick"));
	 member.setPhone(request.getParameter("phone"));
	 member.setFavorite(request.getParameter("favorite"));
	
	 
		mdao.updateMember(member);
	

	 
     session.setAttribute("msg", "0");
     request.getRequestDispatcher("/html&jsp/member/ResultForm.jsp").forward(request, response);
		
   }
}

