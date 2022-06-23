package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FreeBoardFileDownloadController
 */
@WebServlet("/F_FileDownload")
public class FreeBoardFileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardFileDownloadController() {
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
		String orgfile = request.getParameter("orgfile");
		String savefilename = request.getParameter("serverfile");
		
		String filename = URLEncoder.encode(orgfile,"utf-8");
 
		filename = filename.replaceAll("\\+","%20");

		response.setContentType("application/octet-stream");

		response.setHeader("Content-Disposition","attachment;filename="+filename);
		String path = getServletContext().getRealPath("/upload");
		

		FileInputStream fis = new FileInputStream(path+"\\"+savefilename);

		OutputStream os =response.getOutputStream();

		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		byte[] b = new byte[1024];
		int n=0;
		while((n=bis.read(b))!=-1) {
			bos.write(b,0,n);   
		}
		bos.close();
		bis.close();
		
	}

}
