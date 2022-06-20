package filter;
/**
* Create : 윤혜인
* Create Date : 2022-06-19
* Last Update : 2022-06-19
* Modify : 윤혜인
*/
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

@WebFilter(value="/main/loginOk")
public class MainLoginOkFilter implements Filter
{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		
		MemberVo user=MemberDao.getInstance().select(id,pwd);
		if(user == null) {//회원이 아닐때 로그인페이지로 돌아가기
			resp.sendRedirect(req.getContextPath()+"/login/login.jsp?errMsg=error");
		}else {
			//로그인 처리
			session.setAttribute("id", id);
			String grade=user.getGrade();
			//일반 메인으로 이동
			if(grade.equals("일반") || grade.equals("전문가")) {
				resp.sendRedirect(req.getContextPath()+"/main");
			}
			//관리자 메인으로 이동
			if(grade.equals("관리자")) {
				resp.sendRedirect(req.getContextPath()+"/admin/main");
			}
		}
	}
}
