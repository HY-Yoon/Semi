package controller;

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

import dao.Board_ExpertDao;
import dao.Expert_hashtagDao;
import dao.Expert_taglistDao;
import vo.Board_ExpertVo;

@WebServlet("/html&jsp/board_expert/list")
public class ExpertListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	Board_ExpertDao dao = Board_ExpertDao.getInstance();
	
	//검색	
	String search = req.getParameter("search"); // 검색 값
	String select = req.getParameter("select"); // sel 값 ex) 통합,제목,태그
	
	System.out.println("select값:"+select+"search값:"+search);
	
	//페이징
	int pageCount = (int)Math.ceil(dao.getCount(select,search)/6.0); 
	//int spageNum = Integer.parseInt(req.getParameter("pageNum")); //켜질떄 1페이지설정
	
	System.out.println(dao.getCount(select, search));
	
	String spageNum = req.getParameter("pageNum");
	int pageNum = 1;
	if(spageNum!=null) {
		pageNum = Integer.parseInt(spageNum);
	}
	
	int startRow = (pageNum-1)*6+1; //6개씩 
	int endRow = startRow +5; 
		
	
	int startPage = (pageNum-1)/6*6+1;
	int endPage = startPage+5;
	
	if(endPage>pageCount) {
		endPage = pageCount;
	}
			
	//게시글 리스트
	ArrayList<Board_ExpertVo> list =dao.list(startRow,endRow,select,search);
	resp.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=resp.getWriter();
	JSONObject data=new JSONObject();
	Expert_taglistDao tdao = new Expert_taglistDao();
	Expert_hashtagDao hdao = new Expert_hashtagDao();
	JSONArray arr=new JSONArray();
	
	for(Board_ExpertVo vo:list) {
		JSONObject ob=new JSONObject();
		ob.put("anum",vo.getAnum());
		ob.put("mnum",vo.getMnum());
		ob.put("nick",vo.getNick());
		ob.put("title",vo.getTitle());
		ob.put("keyword",vo.getKeyword());
		ob.put("content",vo.getContent());
		ob.put("regdate",vo.getRegdate());
		ob.put("orgfile",vo.getOrgfile());
		ob.put("serverfile",vo.getServerfile());
		ob.put("views",vo.getViews());
		ob.put("notice",vo.getNotice());
		
		//지역태그
		String tag = tdao.list(vo.getAnum());
		ob.put("tag", tag);
		//해시태그
		String htag = hdao.list(vo.getAnum());
		ob.put("htag", htag);
		arr.put(ob);
	}	
	data.put("list",arr);
	data.put("pageCount", pageCount);
	data.put("startPage", startPage);
	data.put("endPage", endPage);
	data.put("pageNum", pageNum);
	
	//검색정보 json 객체에 담기
	data.put("select", select);
	data.put("search", search);
	pw.print(data);
	 
	}
}

