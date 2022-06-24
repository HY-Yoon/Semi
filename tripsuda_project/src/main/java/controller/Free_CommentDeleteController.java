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

/**
 * Servlet implementation class Free_CommentDeleteController
 */
@WebServlet("/FCommtDelete")
public class Free_CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Free_CommentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		FreeCommDao dao = FreeCommDao.getInstance();
		Boolean n = dao.deleteComment(cnum);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = response.getWriter();
		JSONObject json = new JSONObject();
		if(n==true) {
			json.put("code", "success");
		}else {
			json.put("code", "fail");
		}
		pw.print(json);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}	

}
