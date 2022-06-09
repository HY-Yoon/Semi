package controller;

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

@WebServlet("/login")
public class LoginController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		MemberVo vo = MemberDao.getInstance().select(id, pwd);
		req.getSession().setAttribute("userdata", vo);
		
		ArrayList<ChatroomVo> list = ChatroomDao.getInstance().getUserRooms(vo.getMnum());
		
		req.getSession().setAttribute("channel", 1);
		resp.sendRedirect("chat.jsp");
	}
	
}
