package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

@WebServlet("/admin/member/detail")
public class MemberDetailController extends HttpServlet{
	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		MemberVo user = MemberDao.getInstance().select(mnum);
		req.setAttribute("user", user); 
		req.getRequestDispatcher("/html&jsp/admin/memberdetailPage.jsp?mnum="+mnum).forward(req, resp);
	}
}
