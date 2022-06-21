package controller.partyboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.ChatDao;
import dao.ChatroomDao;
import util.DateUtil;
import util.DateUtil.DATEFORMAT;
import util.JSONUtil;
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;

// 채널 변경
@WebServlet("/board_chat/main")
public class ChatMainController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		if (userdata == null)
		{
			// TODO 임시
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_party/login.jsp");
			return;
		}
		
		req.getSession().setAttribute("userdata", userdata);
		req.getSession().setAttribute("chatrooms", ChatroomDao.getInstance().getUserRooms(userdata.getMnum()));
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_chat/chatpage.jsp");
	}
}
