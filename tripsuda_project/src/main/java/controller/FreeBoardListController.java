package controller;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDao;
import vo.FreeBoardVo;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/freelist")
public class FreeBoardListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");
	
		//null로 왔을 때 대체할 수 있는 기본 값 세팅
		 String field = "title";
		 if(field_ != null && !field_.equals(""))
			 field = field_;
		 
		 String query = "";
		 if(query_ != null && !query_.equals(""))
			 query = query_;
		 
		 int page = 1;
		 if(page_ != null && !page_.equals(""))
			 page = Integer.parseInt(page_);
		 
		 //method 정의한 FreeBoardDao 객체화   
		 FreeBoardDao dao = new FreeBoardDao();
		 
		 List<FreeBoardVo> list = dao.getBoardList(field, query, page);  
		 int count = dao.getBoardListCount(field, query);
		   
		 request.setAttribute("list", list);
		 request.setAttribute("count", count);
		
		 request.getRequestDispatcher("/html&jsp/board_Free/list.jsp").forward(request, response);
	
}	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
