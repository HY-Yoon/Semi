package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReportDao;
import vo.ReportVo;


@WebServlet("/admin/report")
public class ReportController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDao rdao = new ReportDao();
		
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
				
	ArrayList<ReportVo> list = rdao.reportList(startRow,endRow);
	req.setAttribute("list",list);
	req.setAttribute("pageCount",pageCount);
	req.setAttribute("startPage",startPageNum);
	req.setAttribute("endPage",endPageNum);
	req.setAttribute("pageNum",pageNum);
	
	
	req.getRequestDispatcher("/html&jsp/admin/report.jsp").forward(req, resp);
	
	}
}
