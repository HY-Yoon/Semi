package vo;

import java.util.Date;

public class Expert_commVo {
	private int cnum,anum,mnum;
	private String content;
	private Date regdate;
	private int ref,lev,step;
	private String nick;
	public Expert_commVo(int cnum, int anum, int mnum, String content, Date regdate, int ref, int lev, int step,String nick) {
		super();
		this.cnum = cnum;
		this.anum = anum;
		this.mnum = mnum;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.nick=nick;
	}
	public int getCnum() {
		return cnum;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
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
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	
	
	
	
	
}
