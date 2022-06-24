package controller.qaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Qa_BoardDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
import vo.Qa_BoardVo;
@WebServlet("/html&jsp/board_qa/insert_qa")
public class QaInsertBoardController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/html&jsp/board_qa/qinsertPage.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 인코딩
		int mnum=Integer.parseInt(req.getParameter("mnum"));
		String nick=req.getParameter("nick");
		String location=req.getParameter("location");
		String title=req.getParameter("qtitle");
		String content=req.getParameter("content");
		String qarea=req.getParameter("qarea");
		String hashTag=req.getParameter("hashtag");
		int anum=0;
		Qa_BoardVo bvo=new Qa_BoardVo(anum,mnum,nick,title,"답변대기",content,null,0);
		anum=bdao.insertQa(bvo);
		int ln=ldao.insert(anum,location);
		int hn=hdao.insertHash(anum,hashTag);
		if(ln>0 && anum>0 && hn>0) {
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_qa/listViewPage.jsp");
		}
	}
		
}
