package controller.partyboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.ChatDao;
import dao.ChatroomDao;
import util.JSONUtil;
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;

// 채널 변경
@WebServlet("/board_chat/room")
public class ChatroomController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("room change json start");
		long rnum = Long.parseLong(req.getParameter("rnum"));
		req.getSession().setAttribute("channel", rnum);
		
		sendRoomdata(resp, rnum);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("chat insert start");
		
		JSONObject json = JSONUtil.parse(req.getReader());
		long rnum = json.getLong("rnum");
		String msg = json.getString("msg");
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		long mnum = userdata.getMnum();
		ChatVo vo = new ChatVo(0, rnum, mnum, new long[] {mnum}, msg, null);
		ChatDao.getInstance().addChat(vo);
		 
		sendRoomdata(resp, rnum);
	}
	
	// response를 통해 방 정보 보내기
	private void sendRoomdata(HttpServletResponse resp, long rnum) throws IOException
	{
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject();
		
		// 방 정보
		ChatroomVo room = ChatroomDao.getInstance().getRoom(rnum);
		json.put("rnum", room.getrNum());
		json.put("anum", room.getaNum());
		json.put("title", ChatroomDao.getInstance().getArticleName(room.getaNum()));
		json.put("members", room.getMembers());
		
		// 채팅 리스트
		JSONArray arr = new JSONArray();
		for (ChatVo vo : ChatDao.getInstance().select(rnum))
		{
			JSONObject temp = new JSONObject();
			temp.put("sender", vo.getSender());
			temp.put("msg", vo.getMessage());
			temp.put("readers", vo.getReaders());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
			temp.put("date", sdf.format(vo.getCreDate()));
			arr.put(temp);
		}
		json.put("list", arr);
		
		// 작성
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
}
