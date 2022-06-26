package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/recommend/sub")
public class RecommendSubController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pageName = "/html&jsp/recommend/"+req.getParameter("pageName")+".jsp";
		req.setAttribute("pageName", pageName);
		req.getRequestDispatcher("/html&jsp/recommend/sub.jsp").forward(req, resp);
	}
}
