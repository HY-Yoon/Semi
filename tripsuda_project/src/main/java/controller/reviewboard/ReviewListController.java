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
import dao.reviewboard.ReviewTagDao;
import util.JSONUtil;
import vo.reviewboard.ReviewBoardVo;
import vo.reviewboard.ReviewTagVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 목록 페이지
*/
@WebServlet("/board_review")
public class ReviewListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		req.setCharacterEncoding("utf-8");
		ReviewBoardDao dao= ReviewBoardDao.getInstance();
		//검색	
		String search = req.getParameter("search"); // 검색 값
		String select = req.getParameter("select"); // sel 값 ex) 통합,제목,태그
		
		System.out.println("select값:"+select+"search값:"+search);
		
		//페이징
		int pageCount = (int)Math.ceil(dao.getCount(select,search)/8.0);
		
		System.out.println(dao.getCount(select,search));
		
		String spagenum = req.getParameter("pagenum");
		int pagenum = 1;
		if(spagenum != null) {
			pagenum = Integer.parseInt(spagenum);
		}
		
		int startRow = (pagenum-1)*8+1; //8개씩 
		int endRow = startRow +5; 
			
		
		int startPage = (pagenum-1)/8*8+1;
		int endPage = startPage+7;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
			
		ArrayList<ReviewBoardVo> list = ReviewBoardDao.getInstance().selectAll(startRow,endRow,select,search);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray jarr=new JSONArray();
		for(ReviewBoardVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("anum",vo.getAnum());
			obj.put("mnum",vo.getMnum());
			obj.put("title",vo.getTitle());
			obj.put("content",vo.getContent());
			obj.put("regdate",vo.getRegdate());
			obj.put("views",vo.getViews());
			obj.put("notice",vo.getNotice());
			obj.put("location",vo.getLocation());
			
			//회원정보
			String nick = MemberDao.getInstance().select(vo.getMnum()).getNick();
			obj.put("nick", nick);
			
			//댓글수
			int cnt = ReviewCommDao.getInstance().getCommCnt(vo.getAnum());
			obj.put("cnt", cnt);
			
			jarr.put(obj);
		}
		data.put("list", jarr);
		data.put("pageCount", pageCount);
		data.put("startPage", startPage);
		data.put("endPage", endPage);
		data.put("pageNum", pagenum);
		
		//검색정보 json 객체에 담기
		data.put("select", select);
		data.put("search", search);
		pw.print(data);
		req.getRequestDispatcher("/html&jsp/board_review/listPage.jsp").forward(req, resp);
	}
	
}
