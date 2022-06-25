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
import dao.PartyBoardDao;
import util.DateUtil;
import util.DateUtil.DATEFORMAT;
import util.JSONUtil;
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;
import vo.PartyboardVo;

// 채널 변경
@WebServlet("/board_chat/room/delete")
public class ChatroomDeleteController extends HttpServlet
{
	/**
	 *	방 내부에서 채팅을 지우는 작업
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("chat insert start");
		
		JSONObject json = JSONUtil.parse(req.getReader());
		long cnum = json.getLong("cnum");
		
		ChatVo chat = ChatDao.getInstance().get(cnum);
		PartyboardVo article = PartyBoardDao.getInstance().select(chat.getrNum());
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		// 관리자거나 글 작성자의 경우에만 삭제 가능
		if (userdata.getGrade().equals("관리자") || article.getMnum() == userdata.getMnum())
		{
			ChatDao.getInstance().deleteChat(chat.getcNum());
			ChatroomController.sendRoomdata(resp, article.getAnum(), false);
		}
		else
		{
			sendNoSign(resp);
		}
	}
	
	// response를 통해 방 정보 보내기
	public static void sendNoSign(HttpServletResponse resp) throws IOException
	{
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject();
		
		// 방 정보
		json.put("error", "권한이 없습니다.");
		
		// 작성
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
}
