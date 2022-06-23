package controller.reviewboard;

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

import dao.MemberDao;
import dao.reviewboard.ReviewBoardDao;
import dao.reviewboard.ReviewCommDao;
import dao.reviewboard.ReviewRecoDao;
import dao.reviewboard.ReviewTagDao;
import util.DateUtil;
import util.JSONUtil;
import vo.MemberVo;
import vo.reviewboard.ReviewCommVo;
import vo.reviewboard.ReviewRecoVo;
import vo.reviewboard.ReviewTagVo;

@WebServlet("/board_review/notice")
public class ReviewNoticeController extends HttpServlet{
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		JSONObject json = JSONUtil.parse(req.getReader());
		int anum = Integer.parseInt(json.getString("anum"));
		String notice = json.getString("notice");

		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw= resp.getWriter();	

		int n=ReviewBoardDao.getInstance().setNotice(anum, notice);
		if(n > 0) {
			pw.print("공지설정변경 성공");
		}else {
			pw.print("공지설정변경 실패");
		}
		pw.close();		
	}
}
