package controller.admin;

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
import vo.MemberVo;

@WebServlet("/admin/list")
public class ListController extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	
	String withdraw = req.getParameter("withdraw");
	String select = req.getParameter("select");
	String search = req.getParameter("search");
	System.out.println(withdraw+"ㅡㅡ"+select+"ㅡㅡ"+search);
	
	
	MemberDao dao = MemberDao.getInstance();
	
	
	if(withdraw.equals("N")) {
		
		String N = "N";
		
		int pageCount = (int)Math.ceil(dao.getCount(N,select,search)/10.0); 
				
		int pageNum = 1;
		String spageNum = req.getParameter("pageNum");
		
		if(spageNum!=null) {
			pageNum = Integer.parseInt(spageNum);
		}
		
		int startRow = (pageNum-1)*10+1; 
		int endRow = startRow +9; 
			
		int startPage = (pageNum-1) /10 *10 +1;
		int endPage = startPage +9;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		
		ArrayList<MemberVo> list = dao.Memberlist(N,select,search,startRow,endRow);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray arr=new JSONArray();
		
		for(MemberVo vo:list) {
			JSONObject ob=new JSONObject();
			ob.put("mnum",vo.getMnum());
			ob.put("id",vo.getId());
			ob.put("pwd",vo.getPwd());
			ob.put("name",vo.getName());
			ob.put("nick",vo.getNick());
			ob.put("phone",vo.getPhone());
			ob.put("birth",vo.getBirth());
			ob.put("withdraw",vo.getWithdraw());
			ob.put("favorite",vo.getFavorite());
			ob.put("grade",vo.getGrade());
			ob.put("stop",vo.getStop());
			arr.put(ob);
		}
		data.put("list", arr);
		data.put("pageNum", pageNum);
		data.put("pageCount", pageCount);
		data.put("startPage", startPage);
		data.put("endPage", endPage);
		pw.print(data);
	
	}else {
		String Y = "Y";	
		
		int pageCount = (int)Math.ceil(dao.getCount(Y,select,search)/10.0); 
			
		int pageNum = 1;
		String spageNum = req.getParameter("pageNum");
		
		if(spageNum!=null) {
			pageNum = Integer.parseInt(spageNum);
		}
		
		int startRow = (pageNum-1)*10+1; 
		int endRow = startRow +9; 
			
		int startPage = (pageNum-1)/10*10+1;
		int endPage = startPage+9;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		
		ArrayList<MemberVo> list = dao.Memberlist(Y,select,search,startRow, endRow);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject data=new JSONObject();
		JSONArray arr=new JSONArray();
		
		for(MemberVo vo:list) {
			JSONObject ob=new JSONObject();
			ob.put("mnum",vo.getMnum());
			ob.put("id",vo.getId());
			ob.put("pwd",vo.getPwd());
			ob.put("name",vo.getName());
			ob.put("nick",vo.getNick());
			ob.put("phone",vo.getPhone());
			ob.put("birth",vo.getBirth());
			ob.put("withdraw",vo.getWithdraw());
			ob.put("favorite",vo.getFavorite());
			ob.put("grade",vo.getGrade());
			ob.put("stop",vo.getStop());
			arr.put(ob);
		}
		data.put("list", arr);
		data.put("pageNum", pageNum);
		data.put("pageCount", pageCount);
		data.put("startPage", startPage);
		data.put("endPage", endPage);
		pw.print(data);
	
	}
	
	
	
}
}
