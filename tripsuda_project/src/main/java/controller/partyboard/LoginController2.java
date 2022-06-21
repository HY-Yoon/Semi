package controller.partyboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChatroomDao;
import dao.MemberDao;
import vo.ChatroomVo;
import vo.MemberVo;

@WebServlet("/html&jsp/board_party/login")
public class LoginController2 extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		MemberVo vo = MemberDao.getInstance().select(id, pwd);
		if (vo == null)
		{
			return;
		}
		
		req.getSession().setAttribute("userdata", vo);
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/list");
	}
	
}
