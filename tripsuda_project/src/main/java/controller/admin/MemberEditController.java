package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.MemberDao;
import util.JSONUtil;
import vo.MemberVo;

@WebServlet("/admin/member/edit")
public class MemberEditController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONObject json = JSONUtil.parse(req.getReader());
		int mnum = Integer.parseInt(json.getString("mnum"));
		String vstop = json.getString("stop");
		Date stop = null;
		if(vstop != null && vstop !="" && !vstop.equals("")) {//회원정지가 아닐때
			stop = Date.valueOf(vstop);
		}
		String withdraw= json.getString("withdraw");
		
		int n = MemberDao.getInstance().updateMemInfoAdmin(mnum, stop, withdraw);
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw= resp.getWriter();
		if(n > 0) {
			pw.print("회원정보수정을 성공했습니다.");
		}else {
			pw.print("회원정보 수정을 실패했습니다.");
		}
		pw.close();
	}
}
