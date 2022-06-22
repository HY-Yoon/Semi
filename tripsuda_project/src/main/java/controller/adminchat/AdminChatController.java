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
import dao.PartyBoardDao;
import util.DateUtil;
import util.DateUtil.DATEFORMAT;
import util.JSONUtil;
import vo.ChatVo;
import vo.ChatroomVo;
import vo.MemberVo;
import vo.PartyboardVo;

// 채널 변경
@WebServlet("/adminchat/chat")
public class AdminChatController extends HttpServlet
{
	/**
	 *	상담 챗 습득 작업
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		req.getSession().setAttribute("userdata", userdata);
		
		sendChatdata(resp, userdata.getMnum());
	}
	
	// 상담 챗 전송 작업
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("admin chat insert start");
		
		JSONObject json = JSONUtil.parse(req.getReader());
		String msg = json.getString("msg");
		
		MemberVo userdata = (MemberVo)req.getSession().getAttribute("userdata");
		long mnum = userdata.getMnum();

		ChatVo vo = new ChatVo(0, -1, mnum, null, msg, null);
		AdminChatDao.getInstance().addChat(vo, -1);
		
		sendChatdata(resp, mnum);
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
			temp.put("cnum", acd.getcNum());
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
