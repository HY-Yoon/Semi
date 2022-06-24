package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/member/list")
public class MemberListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String where = req.getParameter("w");
		if(where.equals("0")) {
			//일반회원보기
			req.getRequestDispatcher("/html&jsp/admin/memberListPage.jsp").forward(req, resp);
		}else {
			//탈퇴회원보기
			req.getRequestDispatcher("/html&jsp/admin/memberListPage_withdraw.jsp").forward(req, resp);
		}
	}
}
