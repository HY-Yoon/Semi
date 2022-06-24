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

@WebFilter(urlPatterns = "/board_review/write",
	initParams = {
			@WebInitParam(name="encoding", value="utf-8")
	})
public class ReviewLoginFilter implements Filter
{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		boolean login=false;
		//1. 세션에 id가 존재하면 login 변수가 true, id가 존재하지 않으면 false가 저장
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		if(session !=null) {
			String id=(String)session.getAttribute("id");
			if(id!=null) {
				login=true;
			}
		}
		//2.login이 true이면 요청페이지(또는 다음에 수행할 필터)로 false면 로그인페이지로 이동
		if(login) {
			chain.doFilter(request,response);
		}else {
			HttpServletResponse resp=(HttpServletResponse)response;
			resp.sendRedirect(req.getContextPath()+"/login");
			
		}
		
	}
}
