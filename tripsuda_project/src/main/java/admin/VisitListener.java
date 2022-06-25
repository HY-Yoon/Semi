package admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.lang.model.element.ExecutableElement;
import javax.servlet.ServletContainerInitializer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.VisitDao;

public class VisitListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
	//세션이 새로 생성되면 실행
		System.out.println("세션 생성");
		if(se.getSession().isNew()) {
			execute(se);
			
		}
	
	}
	
	private void execute(HttpSessionEvent se) {
		VisitDao dao = new VisitDao();
		HttpSession session = se.getSession();
		
		// 방문자 수 증가
		int n =dao.insertVisit();
		
		// 총 방문자수
		int tot = dao.totalVisit();
		
		// 오늘 방문자
		int today = dao.todayVisit();
		
		// 최근 일주일 방문자
		int week = dao.weekVisit();
		ArrayList<Integer> list = new ArrayList<Integer>();
		
	for(int i=0;i<7;i++) {
		int visit = dao.dayVisit(i);
		System.out.println(visit);
	}
			
		
		System.out.println(tot+","+today+","+week);
		session.setAttribute("list", list);
		session.setAttribute("tot", tot);
		session.setAttribute("today", today);
		session.setAttribute("week", week);
		
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	
	}
	
}
