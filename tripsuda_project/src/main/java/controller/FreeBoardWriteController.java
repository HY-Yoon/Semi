package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board_ExpertDao;
import dao.FreeBoardDao;
import vo.Board_ExpertVo;
import vo.FreeBoardVo;

/**
 * Servlet implementation class FreeBoardWriteController
 */
@WebServlet("/FBoardWrite")
public class FreeBoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		ServletContext application = request.getServletContext();
		String saveDir = application.getRealPath("/upload");
		System.out.println(saveDir);
			MultipartRequest multi = new MultipartRequest(
					request,
					saveDir,
					1024*1024*5,
					"utf-8",
					new DefaultFileRenamePolicy()  
			);
		
		FreeBoardVo vo = new FreeBoardVo();
		vo.setId(multi.getParameter("id"));
		vo.setNick(multi.getParameter("nick"));
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("content"));
		vo.setOrgFile(multi.getOriginalFileName("file1"));
		vo.setServerFile(multi.getFilesystemName("file1"));
		
		FreeBoardDao dao = new FreeBoardDao(); 
		boolean n = dao.boardInsert(vo);
		

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(n == true) {
			out.println("<script>alert('등록 성공하였습니다.');");
			out.println("location.href='"+ request.getContextPath() +"/freelist';</script>");
		} else {
			out.println("<script>alert('등록 실패에 실패하였습니다.');");
			out.println("location.href='"+ request.getContextPath() +"/freelist';</script>");
		}
		return;
	
	}

}
