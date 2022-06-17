package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qa_BoardDao;
import vo.Qa_BoardVo;
@WebServlet("/html&jsp/board_qa/insert_qa")
public class QaInsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/html&jsp/board_qa/qinsert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int mnum=Integer.parseInt(req.getParameter("mnum"));
		String nick=req.getParameter("nick");
		String location=req.getParameter("location");
		String title=req.getParameter("qtitle");
		String content=req.getParameter("editordata");
		String qarea=req.getParameter("qarea");
		String hashTag=req.getParameter("hashtag");
		//Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
		Qa_BoardDao bdao=Qa_BoardDao.getInstance();
		//Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
		//int ln=ldao.insert(location);
		Qa_BoardVo bvo=new Qa_BoardVo(0,mnum,nick,title,"답변대기",content,null,0);
		int bn=bdao.insertQa(bvo);
		//int hn=hdao.insertHash(hashTag);
		if(bn>0)resp.sendRedirect("/home.jsp");
	}
		
}
