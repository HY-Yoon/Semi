package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		req.getSession().setAttribute("id", id);
		req.getSession().setAttribute("channel", 1);
		resp.sendRedirect("chat.jsp");
	}
}
