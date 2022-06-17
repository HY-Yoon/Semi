package vo;

import java.util.Date;

public class Qa_BoardVo {
	private int anum; 			// 글번호
	private int mnum;			// 회원번호
	private String nick;		// 회원닉네임
	private String title;		// 질문글제목
	private String keyword;		// 말머리(답변대기, 답변완료)
	private String content;		// 질문글내용
	private Date regdate;		// 질문글작성일
	private int views;			// 질문글 조회수
	public Qa_BoardVo() {}
	public Qa_BoardVo(int anum, int mnum, String nick, String title, String keyword, String content, Date regdate,
			int views) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.nick = nick;
		this.title = title;
		this.keyword = keyword;
		this.content = content;
		this.regdate = regdate;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	




}