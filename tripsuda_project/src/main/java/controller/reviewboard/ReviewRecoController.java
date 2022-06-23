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
import dao.PointDao;
import dao.reviewboard.ReviewBoardDao;
import dao.reviewboard.ReviewCommDao;
import dao.reviewboard.ReviewRecoDao;
import dao.reviewboard.ReviewTagDao;
import util.DateUtil;
import util.JSONUtil;
import vo.MemberVo;
import vo.reviewboard.ReviewCommVo;
import vo.reviewboard.ReviewRecoVo;
import vo.reviewboard.ReviewTagVo;

@WebServlet("/board_review/recommend")
public class ReviewRecoController extends HttpServlet{
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		JSONObject json = JSONUtil.parse(req.getReader());
		int anum = Integer.parseInt(json.getString("anum"));
		int mnum = Integer.parseInt(json.getString("mnum"));
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw= resp.getWriter();
		JSONObject data = new JSONObject();		

		//추천 확인
		ReviewRecoDao dao= ReviewRecoDao.getInstance();
		
		//-------------------kj------------------------
		// 6.23 추천수10 작성자 포인트+1 
		int count = dao.getRecoCount(anum); //후기게시판 추천수
		  if(count==10) { //추천수 10일때
			  ReviewBoardDao rdao = ReviewBoardDao.getInstance();
				int pointmnum =rdao.reco10(anum);         // 추천10받은 게시판 작성자 회원번호 구하기 
				PointDao pdao = new PointDao(); 			
				String content = "게시글 추천수 10";				   
				int n1 = pdao.insert(pointmnum,content);  //포인트 테이블 추가
				}
		//-----------------------------------------
		if(dao.select(anum, mnum) ==null) {
			//추천내역이 없으면 추가
			int n = dao.insert(anum, mnum);
			if(n > 0) {//추천 성공
				data.put("result", "이 글을 추천하셨습니다!");
			}else {
				data.put("result", "추천을 실패했습니다.");
			}
		}else {
			//추천 내역 삭제
			dao.delete(anum, mnum); 
			data.put("result", "추천을 취소했습니다.");
		}	
		data.put("cnt", dao.getRecoCount(anum));
		pw.print(data);
		pw.close();
		
		
		
	}
}
