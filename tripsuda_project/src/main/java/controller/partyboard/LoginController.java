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

@WebServlet("/html&jsp/login")
public class LoginController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		MemberVo vo = MemberDao.getInstance().select(id, pwd);
		if (vo == null)
		{
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/login.jsp");
			return;
		}
		
		req.getSession().setAttribute("userdata", vo);

		// System.out.println("no - " + vo.getMnum());
		// ArrayList<ChatroomVo> list = ChatroomDao.getInstance().getUserRooms(vo.getMnum());
		// System.out.println("rooms - " + list.size());
		// req.getSession().setAttribute("chatrooms", list);
		// req.getSession().setAttribute("channel", 1);
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/editpage.jsp");
	}
	
}
