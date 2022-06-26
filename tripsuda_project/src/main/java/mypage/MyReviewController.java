package mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypageDao;
import vo.reviewboard.ReviewBoardVo;

@WebServlet("/mypage/review")
public class MyReviewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	HttpSession session = req.getSession();
			
	int mnum = ((Long)session.getAttribute("sessionMnum")).intValue();
		
	System.out.println(mnum);
	MypageDao dao= MypageDao.getInstance();
	
	int pageCount = (int)Math.ceil(dao.myreviewCount(mnum)/5.0); 
	System.out.println(pageCount);
		
	int pageNum = 1;
	String spageNum = req.getParameter("pageNum");
	
	if(spageNum!=null) {
		pageNum = Integer.parseInt(spageNum);
	}
	
	int startRow = (pageNum-1)*5+1; 
	int endRow = startRow +4; 
		
	int startPage = (pageNum-1)/5*5+1;
	int endPage = startPage+4;
	
	if(endPage>pageCount) {
		endPage = pageCount;
	}
	
	ArrayList<ReviewBoardVo> list = dao.myreview(mnum,startRow,endRow);
	req.setAttribute("list",list);
	req.setAttribute("startPage",startPage);
	req.setAttribute("endPage",endPage);
	req.setAttribute("pageCount",pageCount);
	req.setAttribute("pageNum",pageNum);
	req.getRequestDispatcher("/html&jsp/mypage/myreview.jsp").forward(req, resp);
	}
}
