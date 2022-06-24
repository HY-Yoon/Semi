package controller.adminchat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import chat.AdminChatData;
import dao.AdminChatDao;
import dao.ChatDao;
import dao.ChatroomDao;
import dao.MemberDao;
import dao.PartyBoardDao;
import util.DateUtil;
import util.DateUtil.DATEFORMAT;
import util.JSONUtil;
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;
import vo.PartyboardVo;

// 관리자용 채팅 페이지
@WebServlet("/adminchat/manage")
public class AdminChatManageController extends HttpServlet
{
	/**
	 *	상담 챗 리스트 습득 작업
	 *	목록 습득인지, 아니면 유저에 대한 채팅 습득인지 구별해서 보낸다
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		req.getSession().setAttribute("userdata", userdata);
		
		String mn = req.getParameter("mnum");
		if (mn == null)
			sendRecentChatListdata(resp);
		else
			sendChatdata(resp, Long.parseLong(mn));
	}
	// 상담용 챗 리스트는 사람 당 하나만 나온다
	private void sendRecentChatListdata(HttpServletResponse resp) throws IOException
	{
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject();
		
		// 채팅 정보
		ArrayList<AdminChatData> list = AdminChatDao.getInstance().getRecentChatList();
		JSONArray arr = new JSONArray();
		for (AdminChatData acd : list)
		{
			JSONObject temp = new JSONObject();
			String nick = MemberDao.getInstance().select(acd.getSender()).getNick();
			temp.put("cnum", acd.getcNum());
			temp.put("nick", nick);
			temp.put("sender", acd.getSender());
			temp.put("msg", acd.getMessage());
			temp.put("reader", acd.getReader());
			temp.put("date", DateUtil.getDiffer(acd.getCreDate()));
			
			arr.put(temp);
		}
		json.put("list", arr);
		
		// 작성
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
	
	// 상담->유저 챗 전송 작업
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("admin chat manager insert start");
		
		JSONObject json = JSONUtil.parse(req.getReader());
		long reader = json.getLong("mnum");
		String msg = json.getString("msg");
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		long sender = userdata.getMnum();

		ChatVo vo = new ChatVo(0, 0, sender, null, msg, null);
		AdminChatDao.getInstance().addChat(vo, reader);
		
		sendChatdata(resp, reader);
	}
	
	// response를 통해 방 정보 보내기
	private void sendChatdata(HttpServletResponse resp, long mnum) throws IOException
	{
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject();
		
		// 채팅 정보
		ArrayList<AdminChatData> list = AdminChatDao.getInstance().getList(mnum);
		JSONArray arr = new JSONArray();
		for (AdminChatData acd : list)
		{
			JSONObject temp = new JSONObject();
			String nick = MemberDao.getInstance().select(acd.getSender()).getNick();
			temp.put("cnum", acd.getcNum());
			temp.put("nick", nick);
			temp.put("sender", acd.getSender());
			temp.put("msg", acd.getMessage());
			temp.put("reader", acd.getReader());
			temp.put("date", DateUtil.getText(acd.getCreDate(), DATEFORMAT.HMS));
			
			arr.put(temp);
		}
		json.put("list", arr);
		
		// 작성
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
}
