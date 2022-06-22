package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@WebServlet("/recomain")
public class RecoMainController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String fav = "제주";
	
	req.setAttribute("fav", fav);
	//로그인 session에 favorite
	req.getRequestDispatcher("/html&jsp/recommend/recoMain.jsp").forward(req, resp);
	}
}
