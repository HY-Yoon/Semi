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

@WebServlet("/mypage")
public class memberInfoController extends HttpServlet{
      @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// 세션이 가지고있는 로그인한 ID 정보를 가져온다
  		HttpSession session = request.getSession();
  		String id = session.getAttribute("sessionID").toString();
  		
  		// 그 아이디 해당하는 회원정보를 가져온다.
  		MemberDao dao = MemberDao.getInstance();
  		MemberVo member = dao.getUserInfo(id);
  		
  		// UserInfoForm.jsp에 회원정보를 전달하기 위해 request에 MemberBean을 세팅한다.
  		request.setAttribute("memberInfo", member);
  		
  		//다음 페이지로 이동
  		request.getRequestDispatcher("/html&jsp/default/MyPage.jsp").forward(request, response);
    }
}
