package vo;

import java.util.Date;

public class Qa_CommVo {
	private int cnum;			// 답변코드
	private int anum;			// 답변이 달린 게시글 번호
	private int mnum;			// 답변자 회원번호
	private String nick;		// 답변자 닉네임
	private String content;		// 답변내용
	private	String regdate;		// 답변 단 시간
	private int ref;			// 댓글+대댓글 그룹 숫자 
	private int lev;			// 답변 레벨(답댓글이면 1추가됨)
	private String sel;			// 답변 채택 여부 (Y,N)
	public Qa_CommVo() {}
	public Qa_CommVo(int cnum, int anum, int mnum, String nick, String content, String regdate, int ref, int lev,
			String sel) {
		super();
		this.cnum = cnum;
		this.anum = anum;
		this.mnum = mnum;
		this.nick = nick;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
		this.lev = lev;
		this.sel = sel;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}

}