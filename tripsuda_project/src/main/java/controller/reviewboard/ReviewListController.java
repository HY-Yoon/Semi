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
		String option = req.getParameter("option"); // sel 값 ex) 통합,제목
		String search = req.getParameter("search"); // 검색 값
		String tag = req.getParameter("tag"); // 지역 선택
		  
		//정렬
		String vorder = req.getParameter("order");
		String order = "anum";
		if(vorder != null && !vorder.equals("")) {
			order = vorder;
		}
		
		System.out.println("option값:"+option+"search값:"+search);
		
		String spagenum = req.getParameter("pagenum");
		int pagenum = 1;
		if(spagenum != null) {
			pagenum = Integer.parseInt(spagenum);
		}
		
		int startRow=(pagenum-1)*8+1;//8개씩
		int endRow=startRow+7;
		
		//페이징
		int pageCount = (int)Math.ceil(dao.getCount(option,search,tag)/8.0);
		System.out.println(dao.getCount(option,search,tag));
		
		int startPageNum=((pagenum-1)/8*8)+1;
		int endPageNum = startPageNum+7;	
		
		if(endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		
		ArrayList<ReviewBoardVo> list = ReviewBoardDao.getInstance().selectAll(startRow,endRow,option,search,tag,order);	
		ArrayList<ReviewBoardVo> board_list = new ArrayList<ReviewBoardVo>();
		for(ReviewBoardVo getvo : list) {
			ReviewBoardVo putvo = new ReviewBoardVo();
			putvo.setAnum(getvo.getAnum());
			putvo.setMnum(getvo.getMnum());
			putvo.setTitle(getvo.getTitle());
			putvo.setThum(getvo.getThum());
			//html태그 모두 제거하고 text만 가져오기
			String content = getvo.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			putvo.setContent(content);
			putvo.setRegdate(getvo.getRegdate());
			putvo.setViews(getvo.getViews());
			putvo.setNotice(getvo.getNotice());
			putvo.setLocation(getvo.getLocation());
			putvo.setNick(getvo.getNick());
			
			//댓글수
			int cnt = ReviewCommDao.getInstance().getCommCnt(getvo.getAnum());
			putvo.setCnt(cnt);
			
			board_list.add(putvo);
		}
		req.setAttribute("list", board_list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pagenum);
		
		//검색정보 attribute에 담기
		req.setAttribute("option", option);
		req.setAttribute("search", search);
		req.getRequestDispatcher("/html&jsp/board_review/listPage.jsp").forward(req, resp);
	}
	
}
