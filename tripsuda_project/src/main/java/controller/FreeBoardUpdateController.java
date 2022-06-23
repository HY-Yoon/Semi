package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FreeBoardDao;
import vo.FreeBoardVo;

/**
 * Servlet implementation class FreeBoardUpdateController
 */
@WebServlet("/FBoardUpdate")
public class FreeBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
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
			
		int anum =Integer.parseInt(multi.getParameter("anum"));	
		
		FreeBoardDao dao = new FreeBoardDao();
		String id = multi.getParameter("id");
		String nick = multi.getParameter("nick");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String orgFile = multi.getOriginalFileName("file1");
		int n =0;
		FreeBoardVo vo = dao.getDetail(anum);
		if(orgFile!=null) {
			String savefilename=vo.getServerFile();
			File f = new File(saveDir + "\\" + savefilename);
			f.delete(); //기존 파일 삭제
			String serverFile=multi.getFilesystemName("file1");
			//long filesize = multi.getFile("file1").length();
			FreeBoardVo vo1 = new FreeBoardVo(anum, id, nick, title, content, orgFile, serverFile);
			n=dao.updateBoard(vo1);
		}else{ //기존 파일 유지시
			FreeBoardVo vo1 = new FreeBoardVo(anum, id, nick, title, content, vo.getOrgFile(), vo.getServerFile());
			n=dao.updateBoard(vo1);
		}

	
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(n > 0) {
			out.println("<script>alert('수정되었습니다.');");
			out.println("location.href='"+ request.getContextPath() +"/freelist';</script>");
		} else {
			out.println("<script>alert('수정 실패하였습니다.');");
			out.println("location.href='"+ request.getContextPath() +"/freelist';</script>");
		}
		
		return;
	}
}
