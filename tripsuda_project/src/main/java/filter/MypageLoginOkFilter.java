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
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

@WebFilter(urlPatterns = "/mypage",
initParams = {
		@WebInitParam(name="encoding", value="utf-8")
})
public class MypageLoginOkFilter implements Filter
{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		
		req.setCharacterEncoding("utf-8");
		
		MemberVo userdata= (MemberVo)session.getAttribute("userdata");
		if(userdata == null) {//회원이 아닐때 로그인페이지로 돌아가기
			resp.sendRedirect(req.getContextPath()+"/html&jsp/member/LoginForm.jsp");
		}else {
			String grade=userdata.getGrade();
			//관리자 메인으로 이동
			if(grade.equals("관리자")) {
				resp.sendRedirect(req.getContextPath()+"/admin/main");
				
			}else{//일반 메인으로 이동
				resp.sendRedirect(req.getContextPath()+"/member/main");
			}
		}
	}
}
