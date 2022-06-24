package controller.qaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qa_BoardDao;
import dao.Qa_CommDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
@WebServlet("/html&jsp/board_qa/commselect")
public class QaCheckCommController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	Qa_CommDao cdao=Qa_CommDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cnum=Integer.parseInt(req.getParameter("cnum"));
		int anum=Integer.parseInt(req.getParameter("anum"));
		int n=cdao.upDateselect(cnum,anum);
		if(n>1) {
			req.setAttribute("anum", anum);
			req.getRequestDispatcher("/html&jsp/board_qa/commview").forward(req, resp);
		}
	}
}
