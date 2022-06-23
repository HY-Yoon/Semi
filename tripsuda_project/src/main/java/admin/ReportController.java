package admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.ReportDao;
import vo.ReportVo;
import vo.ReportVo22;


@WebServlet("/admin/report")
public class ReportController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDao rdao = new ReportDao();
		//신고목록 페이징
		String spageNum = req.getParameter("pageNum");
		int pageNum = 1;
		if(spageNum!=null) {
			pageNum = Integer.parseInt(spageNum);
		}                
						
		int startRow = (pageNum-1)*5+1;                 
		int endRow = startRow+4;	
		
		int cnt = rdao.getCount();
		
		int pageCount = (int)Math.ceil((cnt/5.0)); 
		int startPageNum =((pageNum-1)/5*5)+1; 
		int endPageNum = startPageNum+4; 
		
		if(endPageNum>pageCount) {
			endPageNum = pageCount;
		}
	
	MemberDao mdao = MemberDao.getInstance();
		
	ArrayList<ReportVo> list = rdao.reportList(startRow,endRow);
	
	//신고번호X -아이디로 다시 list에 담기?
	ArrayList<ReportVo22> list2 = new ArrayList<ReportVo22>();
	
	for(ReportVo vo : list) {
		int rnum = vo.getRnum();
		String defend = mdao.whatId(vo.getDefendant());
		String plaint = mdao.whatId(vo.getPlaintiff());
		String reason = vo.getReason();
		Date rdate = vo.getRdate();
		
		ReportVo22 vo22 = new ReportVo22(rnum, defend, plaint, reason, rdate);
		list2.add(vo22);
	}
		
	
	req.setAttribute("list",list2);
	req.setAttribute("pageCount",pageCount);
	req.setAttribute("startPage",startPageNum);
	req.setAttribute("endPage",endPageNum);
	req.setAttribute("pageNum",pageNum);
		
	req.getRequestDispatcher("/html&jsp/admin/report.jsp").forward(req, resp);
	
	}
}
