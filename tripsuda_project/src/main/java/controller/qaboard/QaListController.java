package controller.qaboard;

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

import dao.Qa_BoardDao;
import dao.Qa_CommDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
import vo.Qa_BoardVo;
import vo.Qa_HashTagVo;
import vo.Qa_LocalTagVo;
@WebServlet("/html&jsp/board_qa/list")
public class QaListController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_CommDao cdao=Qa_CommDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		int sort=Integer.parseInt(req.getParameter("sortselect"));
		int endRow=pageNum*6;
		int startRow=endRow-5;
		ArrayList<Qa_BoardVo> blist=new ArrayList<Qa_BoardVo>();
		switch(sort) {
			case 1:blist=bdao.bList1(startRow, endRow);break;
			case 2:blist=bdao.bList2(startRow, endRow);break;
			case 3:blist=bdao.bList3(startRow, endRow);break;
			default:
		}
		int pageCount =(int)Math.ceil(bdao.getCountRow()/6.0);
		int startPage=((pageNum-1)/6)*6+1;
		int endPage=startPage+5;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray jarr=new JSONArray();
		for(Qa_BoardVo bvo:blist) {
			JSONObject ob=new JSONObject();
			ob.put("anum",bvo.getAnum());
			ob.put("nick",bvo.getNick());
			ob.put("title",bvo.getTitle());
			ob.put("keyword",bvo.getKeyword());
			ob.put("content", bvo.getContent());
			ob.put("regdate", bvo.getRegdate());
			ob.put("views", bvo.getViews());
			ob.put("loc", ldao.select(bvo.getAnum()));
			ob.put("hash", hdao.select(bvo.getAnum()));
			ob.put("commcnt", cdao.commcnt(bvo.getAnum()));
			jarr.put(ob);
		}	
		data.put("list",jarr);
		data.put("pageCount", pageCount);
		data.put("startPage", startPage);
		data.put("endPage", endPage);
		data.put("pageNum", pageNum);
		pw.print(data);
	}
}
