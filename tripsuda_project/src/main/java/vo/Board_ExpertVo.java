package vo;

import java.util.Date;

public class Board_ExpertVo {
	private int anum,mnum,views;
	private String nick,title,keyword,content,orgfile,serverfile;
	private String notice;
	private Date regdate;
	
	public Board_ExpertVo(int anum, int mnum, String nick, String title, String keyword, String content, Date regdate
			,String orgfile, String serverfile, int views, String notice) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.views = views;
		this.nick = nick;
		this.title = title;
		this.keyword = keyword;
		this.content = content;
		this.orgfile = orgfile;
		this.serverfile = serverfile;
		this.notice = notice;
		this.regdate = regdate;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOrgfile() {
		return orgfile;
	}
	public void setOrgfile(String orgfile) {
		this.orgfile = orgfile;
	}

	public String getServerfile() {
		return serverfile;
	}
	public void setServerfile(String serverfile) {
		this.serverfile = serverfile;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
