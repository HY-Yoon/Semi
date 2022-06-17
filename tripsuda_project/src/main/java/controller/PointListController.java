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

import dao.PointDao;
import vo.PointVo;

@WebServlet("/point/pointlist")
public class PointListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		PointDao dao = new PointDao();
		
		int pageCount = (int)Math.ceil(dao.getCount(mnum)/5.0); 
		
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
		
		//포인트총합	-  포인트가 1점씩이라 count가 총합		
		int sum = dao.getCount(mnum);
		
		
		ArrayList<PointVo> list = dao.Plist(mnum,startRow,endRow);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray arr=new JSONArray();
				
		for(PointVo vo:list) {
			JSONObject ob=new JSONObject();
			ob.put("pnum", vo.getPnum());
			ob.put("mnum", vo.getMnum());
			ob.put("point",vo.getPoint());
			ob.put("content",vo.getContent());
			ob.put("pdate",vo.getPdate());
			arr.put(ob);
		}	
			data.put("list",arr);
			data.put("pageCount", pageCount);
			data.put("pageNum", pageNum);
			data.put("startPage", startPage);
			data.put("endPage", endPage);
			data.put("sum", sum);			
			pw.print(data);
	}
		
		
	}

