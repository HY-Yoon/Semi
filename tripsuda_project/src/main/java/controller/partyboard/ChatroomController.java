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
@WebServlet("/board_chat/room")
public class ChatroomController extends HttpServlet
{
	/**
	 *	방 연결시의 작업
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		String an = req.getParameter("anum");
		String getImg = req.getParameter("getImg");
		long anum = an == null ? PartyBoardDao.getInstance().selectNewArticle(userdata.getMnum()).getAnum() : Long.parseLong(an);
		req.getSession().setAttribute("anum", anum);
		req.getSession().setAttribute("userdata", userdata);
		req.getSession().setAttribute("chatrooms", ChatroomDao.getInstance().getUserRooms(userdata.getMnum()));
		// resp.sendRedirect(req.getContextPath() + "/html&jsp/board_chat/chat.jsp");
		
		sendRoomdata(resp, anum, getImg != null);
	}
	
	// 채팅 송수신시의 작업
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("chat insert start");
		
		JSONObject json = JSONUtil.parse(req.getReader());
		long anum = json.getLong("anum");
		String msg = json.getString("msg");
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		long mnum = userdata.getMnum();
		ChatroomVo room = ChatroomDao.getInstance().getRoomfromAnum(anum);
		ChatVo vo = new ChatVo(0, room.getrNum(), mnum, new long[] {mnum}, msg, null);
		ChatDao.getInstance().addChat(vo);
		 
		sendRoomdata(resp, anum, false);
	}
	
	// response를 통해 방 정보 보내기
	private void sendRoomdata(HttpServletResponse resp, long anum, boolean withImg) throws IOException
	{
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject();
		
		// 방 정보
		PartyboardVo article = PartyBoardDao.getInstance().select(anum);
		ChatroomVo room = ChatroomDao.getInstance().getRoomfromAnum(anum);
		json.put("rnum", room.getrNum());
		json.put("anum", room.getaNum());
		json.put("title", ChatroomDao.getInstance().getArticleName(room.getaNum()));
		json.put("members", room.getMembers());
		
		// 채팅 리스트
		JSONArray arr = new JSONArray();
		for (ChatVo vo : ChatDao.getInstance().select(room.getrNum()))
		{
			JSONObject temp = new JSONObject();
			temp.put("cnum", vo.getcNum());
			temp.put("sender", vo.getSender());
			temp.put("msg", vo.getMessage());
			temp.put("readers", vo.getReaders());
			temp.put("date", DateUtil.getText(vo.getCreDate(), DATEFORMAT.HMS));
			
			arr.put(temp);
		}
		json.put("list", arr);
		if (withImg)
			json.put("img", article.getBackimg());
		// 작성
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
}
