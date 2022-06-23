package controller;

import java.io.IOException;  
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;


@WebServlet("/JoinForm")
public class JoinFormController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 
		 request.setCharacterEncoding("utf-8");
		 
		 String id = request.getParameter("id");
		 String pwd = request.getParameter("pwd");
		 String name = request.getParameter("name");
		 String nickname = request.getParameter("nick");
		 String phone = request.getParameter("phone");
		 String favorite = request.getParameter("favorite");
		
		 MemberVo vo=new MemberVo(0, id, pwd, name, nickname, phone, favorite ); 
		 MemberDao mdao = new MemberDao();
		 int n = mdao.insertMember(vo);
		 System.out.println("n:" + n);
		 if(n>0) {
			 request.setAttribute("msg", "1");
		 }else {
			 request.setAttribute("msg", "-1");		
			 }
		 request.getRequestDispatcher("/html&jsp/member/ResultForm.jsp").forward(request, response);	
	     }
          
}
