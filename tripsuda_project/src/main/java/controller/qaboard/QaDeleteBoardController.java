package controller.qaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.HTTP;

import dao.Qa_BoardDao;
import dao.Qa_CommDao;
import dao.Qa_HashTagDao;
import dao.Qa_LocalTagDao;
@WebServlet("/html&jsp/board_qa/deleteboard_qa")
public class QaDeleteBoardController extends HttpServlet{
	Qa_BoardDao bdao=Qa_BoardDao.getInstance();
	Qa_HashTagDao hdao=Qa_HashTagDao.getInstance();
	Qa_LocalTagDao ldao=Qa_LocalTagDao.getInstance();
	Qa_CommDao cdao=Qa_CommDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int anum=Integer.parseInt(req.getParameter("anum"));
		int ln=ldao.delete(anum);
		int hn=hdao.delete(anum);
		int cn=cdao.delete(anum);
		int dn=bdao.delete(anum);
		if(ln>0 && dn>0 && hn>0 && cn>0) {
			resp.sendRedirect(req.getContextPath() + "/html&jsp/board_qa/listViewPage.jsp");
		}
	}
}
