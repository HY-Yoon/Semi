package controller.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.reviewboard.ReviewBoardDao;
import dao.reviewboard.ReviewTagDao;
import util.JSONUtil;
import vo.reviewboard.ReviewBoardVo;
import vo.reviewboard.ReviewTagVo;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기게시판 글쓰기 페이지
*/
@WebServlet("/board_review/edit")
public class ReviewEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int anum = Integer.parseInt(req.getParameter("anum"));
		req.getRequestDispatcher("/html&jsp/board_review/editPage.jsp?anum="+anum).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		JSONObject json= JSONUtil.parse(req.getReader());
		String vmnum= json.getString("mnum");
		int mnum= Integer.parseInt(vmnum);
		String location= json.getString("location");
		String thum_img= json.getString("thumimg");
		String title= json.getString("title");
		String content= json.getString("content");
		String hashtag= null;
		if(json.getString("tag") !=null) {
			hashtag= json.getString("tag");
		}
		
		ReviewBoardVo vo= new ReviewBoardVo(0, mnum, title, content, null, 0, null, thum_img, location);
		int anum=ReviewBoardDao.getInstance().write(vo);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		JSONObject data=new JSONObject();
		if(anum > 0) { //글작성 성공
			if(hashtag !=null) { //해시태그 저장
				String[] tags=hashtag.split(" ");
				for(String htag : tags) {
					ReviewTagVo tagvo=new ReviewTagVo(0, anum, htag);
					ReviewTagDao.getInstance().insert(tagvo);
				}
			}
			//글작성 성공하면 디테일 페이지로 이동
			String url = req.getContextPath() + "/board_review/detail?anum="+anum;
			data.put("url", url);
		}else {
			String url = req.getContextPath() + "/board_review/list";
			data.put("url", url);
		}
		pw.print(data);
		pw.close();
		
	}
}
