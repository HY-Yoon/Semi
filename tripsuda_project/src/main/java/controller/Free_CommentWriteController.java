package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.FreeCommDao;
import vo.FreeCommVo;

/**
 * Servlet implementation class Free_CommentWriteController
 */
@WebServlet("/FCommWrite")
public class Free_CommentWriteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		FreeCommDao dao = FreeCommDao.getInstance();
		FreeCommVo comment = new FreeCommVo();
		
		// 파리미터 값을 가져온다.

		String comment_nick = request.getParameter("comment_nick");
		String comment_content = request.getParameter("comment_content");
		

		comment.setNick(comment_nick);
		comment.setContent(comment_content);
		
		boolean result = dao.insertComment(comment);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		JSONObject json = new JSONObject();

		if(result==true){
			json.put("code", "success");
		}else {
			json.put("code", "fail");
		}
		pw.print(json);
			
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
