package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board_ExpertDao;
import dao.Expert_hashtagDao;
import dao.Expert_taglistDao;
import vo.Board_ExpertVo;
import vo.Expert_hashtagVo;
import vo.Expert_taglistVo;

@WebServlet("/board_expert/add")
public class ExpertAddController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletContext application = req.getServletContext();
		String saveDir = application.getRealPath("/upload");
		System.out.println(saveDir);
			MultipartRequest mr = new MultipartRequest(
					req,
					saveDir,
					1024*1024*5,
					"utf-8",
					new DefaultFileRenamePolicy()  
			);
		//--------------전문가 게시글 추가--------------------	
		int mnum = Integer.parseInt(mr.getParameter("mnum"));
		String nick = mr.getParameter("nick"); 
		String title = mr.getParameter("title"); 
		String keyword = mr.getParameter("keyword");
		String content = mr.getParameter("content");
		String orgfile = mr.getOriginalFileName("file1");
		String serverfile = mr.getFilesystemName("file1");
		//조회수, 공지사항 여부
			
		Board_ExpertVo vo = new Board_ExpertVo(0, mnum, nick, title,keyword, content, null,orgfile,serverfile, 1, "N");
		Board_ExpertDao dao =Board_ExpertDao.getInstance();
		int anum = dao.insert(vo); // 시퀀스 currval 리턴받아서 join된 테이블 vo에 추가
				
		//---------지역태그 (tag_expert테이블) 추가--------------
		String loctag = mr.getParameter("location");
		Expert_taglistVo tvo = new Expert_taglistVo(0,anum,loctag);
		Expert_taglistDao tdao = new Expert_taglistDao();
		int n1 = tdao.insert(tvo);
		
		//--------해시태그 (hashtag_expert테이블)
		String hashtag = mr.getParameter("hashtag");
		Expert_hashtagVo hvo = new Expert_hashtagVo(0, anum, hashtag);
		Expert_hashtagDao hdao = new Expert_hashtagDao();
		int n2 = hdao.insert(hvo);
		
		
		if(n1>0 && n2>0) {
			req.getRequestDispatcher("/html&jsp/board_expert/list.jsp").forward(req, resp);
		}
				
		
		//req.getRequestDispatcher(req.getContextPath()+"/list").forward(req, resp);
	
	}
}
