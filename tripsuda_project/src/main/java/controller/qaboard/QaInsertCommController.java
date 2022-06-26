package controller.qaboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Qa_BoardDao;
import dao.Qa_CommDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
import vo.MemberVo;
import vo.Qa_BoardVo;
import vo.Qa_CommVo;
@WebServlet("/html&jsp/board_qa/comminsert_qa")
public class QaInsertCommController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_CommDao cdao=Qa_CommDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum=Integer.parseInt(req.getParameter("anum"));
		Qa_BoardVo bvo=bdao.select(anum);
//		ArrayList<String> hlist=hdao.select(anum);
		req.setAttribute("bvo", bvo);
		req.getRequestDispatcher("/html&jsp/board_qa/comminsertPage.jsp").forward(req, resp);
		// http://localhost:8081/semi/html&jsp/board_qa/comminsert_qa?anum=4
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int anum=Integer.parseInt(req.getParameter("anum"));
		String commContent=req.getParameter("content");
		HttpSession session = req.getSession();
//		MemberVo mvo=(MemberVo)session.getAttribute("userdata");
		int mnum=(int)session.getAttribute("sessionMnum");
		String nick=(String)session.getAttribute("sessionNick");
		int cnum=0;
		int ref=0;
		int lev=0;
		if(req.getParameter("cnum")!=null) {
			int ocnum=Integer.parseInt(req.getParameter("cnum"));
			if(ocnum==0) { // 대댓글일때
				cnum=ocnum;
				ref=Integer.parseInt(req.getParameter("ref"));
				lev=Integer.parseInt(req.getParameter("lev"));
			}
		};
		Qa_CommVo cvo=new Qa_CommVo(cnum,anum,mnum,nick,commContent,null,ref,lev,"N");
		cdao.insert(cvo);
		cdao.updateBoard(anum);
		req.setAttribute("anum", anum);
		req.getRequestDispatcher("/html&jsp/board_qa/content?anum="+anum).forward(req, resp);
	}
}
