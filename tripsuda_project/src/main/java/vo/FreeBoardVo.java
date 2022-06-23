package vo;

import java.util.Date;

public class FreeBoardVo {
	private int anum;
	private int mnum;
	private String id;
	private String nick;
	private String title;
	private String keyword;
	private String content;
	private Date regdate;
	private String orgFile;
	private String serverFile;
	private int views;

	public FreeBoardVo() {
		super();
	}

	

	public FreeBoardVo(int anum, String id, String nick, String title, String content, String orgFile,
			String serverFile) {
		super();
		this.anum = anum;
		this.id = id;
		this.nick = nick;
		this.title = title;
		this.content = content;
		this.orgFile = orgFile;
		this.serverFile = serverFile;
	}



	public FreeBoardVo(int anum, String id, String nick, String title, String content, Date regdate, String orgFile,
			String serverFile, int views) {
		super();
		this.anum = anum;
		this.id = id;
		this.nick = nick;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.orgFile = orgFile;
		this.serverFile = serverFile;
		this.views = views;
	}



	public FreeBoardVo(int anum, String nick, String title, String content, Date regdate, String orgFile, int views) {
		super();
		this.anum = anum;
		this.nick = nick;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.orgFile = orgFile;
		this.views = views;
	}



	public FreeBoardVo(int anum, String id, String nick, String title, String content, Date regdate,
			String orgFile, int views) {
		super();
		this.anum = anum;
		this.id = id;
		this.nick = nick;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.orgFile = orgFile;
		this.views = views;
	}



	public FreeBoardVo(int anum, int mnum, String id, String nick, String title, String keyword, String content,
			Date regdate, String orgFile, String serverFile, int views) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.id = id;
		this.nick = nick;
		this.title = title;
		this.keyword = keyword;
		this.content = content;
		this.regdate = regdate;
		this.orgFile = orgFile;
		this.serverFile = serverFile;
		this.views = views;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getOrgFile() {
		return orgFile;
	}

	public void setOrgFile(String orgFile) {
		this.orgFile = orgFile;
	}

	public String getServerFile() {
		return serverFile;
	}

	public void setServerFile(String serverFile) {
		this.serverFile = serverFile;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String toString() {
		return "FreeBoardVo [anum=" + anum + ", mnum=" + mnum + ", id=" + id + ", nick=" + nick + ", title=" + title
				+ ", keyword=" + keyword + ", content=" + content + ", regdate=" + regdate + ", orgFile=" + orgFile
				+ ", serverFile=" + serverFile + ", views=" + views + "]";
	}

	

}
