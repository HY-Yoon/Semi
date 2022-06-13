package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board_expert/download")
public class ExpertFileDownController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orgfile = req.getParameter("orgfile");
		String savefilename = req.getParameter("serverfile");
		
		String filename = URLEncoder.encode(orgfile,"utf-8");
 
		filename = filename.replaceAll("\\+","%20");

		resp.setContentType("application/octet-stream");

		resp.setHeader("Content-Disposition","attachment;filename="+filename);
		String path = getServletContext().getRealPath("/upload");
		

		FileInputStream fis = new FileInputStream(path+"\\"+savefilename);

		OutputStream os = resp.getOutputStream();

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
